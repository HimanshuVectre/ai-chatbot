<?php

namespace App\Http\Controllers;

use App\Ai\Agents\SalesAssistant;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Throwable;

class AgentController extends Controller
{
    public function callAgent(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'message' => ['required', 'string', 'max:4000'],
            'conversation_id' => ['nullable', 'string', 'max:64'],
        ]);

        if ($this->containsAbusiveLanguage($validated['message'])) {
            $conversationId = $this->persistConversationMessages(
                userId: $request->user()->id,
                userMessage: $validated['message'],
                assistantReply: 'Warning: abusive language is not allowed. Please ask your question respectfully.',
                conversationId: $validated['conversation_id'] ?? null,
            );

            return response()->json([
                'reply' => 'Warning: abusive language is not allowed. Please ask your question respectfully.',
                'conversation_id' => $conversationId,
                'usage' => [],
                'warning' => true,
            ]);
        }

        $user = $request->user();
        $assistant = new SalesAssistant($user);

        try {
            if (! empty($validated['conversation_id'])) {
                $response = $assistant
                    ->continue($validated['conversation_id'], as: $user)
                    ->prompt($validated['message']);
            } else {
                $response = $assistant
                    ->forUser($user)
                    ->prompt($validated['message']);
            }
        } catch (Throwable $e) {
            report($e);

            $fallbackReply = $this->fallbackReply($validated['message'], $user->id);
            $conversationId = $this->persistConversationMessages(
                userId: $user->id,
                userMessage: $validated['message'],
                assistantReply: $fallbackReply,
                conversationId: $validated['conversation_id'] ?? null,
            );

            return response()->json([
                'reply' => $fallbackReply,
                'conversation_id' => $conversationId,
                'usage' => [],
                'fallback' => true,
            ]);
        }

        return response()->json([
            'reply' => (string) $response,
            'conversation_id' => $response->conversationId,
            'usage' => $response->usage->toArray(),
        ]);
    }

    protected function fallbackReply(string $message, int $userId): string
    {
        $normalized = Str::lower($message);

        if (Str::contains($normalized, ['product', 'products', 'item', 'items'])) {
            $categoryFilter = $this->extractCategoryFilter($normalized);
            [$minPrice, $maxPrice] = $this->extractPriceConstraints($normalized);
            $limit = $this->extractProductLimit($normalized);
            $stockFilter = $this->extractStockFilter($normalized);
            $sortPreference = $this->extractSortPreference($normalized);

            if ($this->isPerCategoryProductQuery($normalized)) {
                $perCategoryLimit = $this->extractPerCategoryProductLimit($normalized);
                $categories = Category::query()->orderBy('title')->get(['id', 'title']);

                if ($categories->isEmpty()) {
                    return 'No categories are available right now.';
                }

                $lines = [];
                $hasAnyProduct = false;

                foreach ($categories as $category) {
                    $products = $category->products()
                        ->when(! is_null($minPrice), fn ($query) => $query->where('price', '>=', $minPrice))
                        ->when(! is_null($maxPrice), fn ($query) => $query->where('price', '<=', $maxPrice))
                        ->when($stockFilter === 'in_stock', fn ($query) => $query->where('stock', '>', 0))
                        ->when($stockFilter === 'out_of_stock', fn ($query) => $query->where('stock', '=', 0))
                        ->when($sortPreference === 'price_asc', fn ($query) => $query->orderBy('price'))
                        ->when($sortPreference === 'price_desc', fn ($query) => $query->orderByDesc('price'))
                        ->when(is_null($sortPreference), fn ($query) => $query->orderBy('title'))
                        ->limit($perCategoryLimit)
                        ->get(['title', 'price']);

                    if ($products->isEmpty()) {
                        $lines[] = "{$category->title}: No matching product";
                        continue;
                    }

                    $hasAnyProduct = true;
                    $productList = $products->map(fn ($product) => "{$product->title} (Rs {$product->price})")->implode(', ');
                    $lines[] = "{$category->title}: {$productList}";
                }

                if (! $hasAnyProduct) {
                    return 'No products match your filters in any category.';
                }

                $prefix = $perCategoryLimit === 1
                    ? 'One product from each category'
                    : "{$perCategoryLimit} products from each category";

                return "{$prefix}: ".implode(' | ', $lines).'.';
            }

            // Check for multiple mentioned categories
            $multipleCategories = $this->extractMultipleCategories($normalized);
            $categoryFilter = count($multipleCategories) === 1 ? $multipleCategories[0] : null;

            $query = Product::query()
                ->when(! empty($multipleCategories), function ($query) use ($multipleCategories) {
                    // Include products in ANY of the mentioned categories
                    $query->whereHas('categories', function ($categoryQuery) use ($multipleCategories) {
                        $categoryQuery->whereIn('title', array_map('ucfirst', $multipleCategories));
                    });
                })
                ->when(! is_null($minPrice), fn ($query) => $query->where('price', '>=', $minPrice))
                ->when(! is_null($maxPrice), fn ($query) => $query->where('price', '<=', $maxPrice))
                ->when($stockFilter === 'in_stock', fn ($query) => $query->where('stock', '>', 0))
                ->when($stockFilter === 'out_of_stock', fn ($query) => $query->where('stock', '=', 0))
                ->when($sortPreference === 'price_asc', fn ($query) => $query->orderBy('price'))
                ->when($sortPreference === 'price_desc', fn ($query) => $query->orderByDesc('price'))
                ->when(is_null($sortPreference), fn ($query) => $query->orderBy('title'))
                ->distinct();

            $products = $query
                ->limit($limit)
                ->get(['title', 'price']);

            if ($products->isEmpty()) {
                $conditions = [];

                if (count($multipleCategories) > 1) {
                    $conditions[] = implode(', ', array_map('ucfirst', $multipleCategories)) . ' categories';
                } elseif ($categoryFilter) {
                    $conditions[] = "{$categoryFilter} category";
                }
                if (! is_null($minPrice) && ! is_null($maxPrice)) {
                    $conditions[] = "price between Rs {$minPrice} and Rs {$maxPrice}";
                } elseif (! is_null($maxPrice)) {
                    $conditions[] = "price up to Rs {$maxPrice}";
                } elseif (! is_null($minPrice)) {
                    $conditions[] = "price from Rs {$minPrice}";
                }
                if ($stockFilter === 'in_stock') {
                    $conditions[] = 'in stock';
                }
                if ($stockFilter === 'out_of_stock') {
                    $conditions[] = 'out of stock';
                }

                if (! empty($conditions)) {
                    return 'No products match: '.implode(', ', $conditions).'.';
                }

                return 'No products are available right now.';
            }

            if ($this->isCountProductQuery($normalized)) {
                $conditionText = [];
                if (count($multipleCategories) > 1) {
                    $conditionText[] = "in " . implode(', ', array_map('ucfirst', $multipleCategories)) . " categories";
                } elseif ($categoryFilter) {
                    $conditionText[] = "in {$categoryFilter} category";
                }
                if (! is_null($minPrice) && ! is_null($maxPrice)) {
                    $conditionText[] = "between Rs {$minPrice} and Rs {$maxPrice}";
                } elseif (! is_null($maxPrice)) {
                    $conditionText[] = "under Rs {$maxPrice}";
                } elseif (! is_null($minPrice)) {
                    $conditionText[] = "above Rs {$minPrice}";
                }
                if ($stockFilter === 'in_stock') {
                    $conditionText[] = 'in stock';
                }
                if ($stockFilter === 'out_of_stock') {
                    $conditionText[] = 'out of stock';
                }

                $suffix = empty($conditionText) ? '' : ' '.implode(' ', $conditionText);

                return "Total matching products{$suffix}: {$products->count()}.";
            }

            $list = $products->map(fn ($product) => "{$product->title} (Rs {$product->price})")->implode(', ');

            $prefix = 'Available products';
            if (count($multipleCategories) > 1) {
                $prefix = "Products in " . implode(', ', array_map('ucfirst', $multipleCategories)) . " categories";
            } elseif ($categoryFilter) {
                $prefix = "Products in {$categoryFilter} category";
            }

            if (! is_null($minPrice) && ! is_null($maxPrice)) {
                $prefix .= " between Rs {$minPrice} and Rs {$maxPrice}";
            } elseif (! is_null($maxPrice)) {
                $prefix .= " under Rs {$maxPrice}";
            } elseif (! is_null($minPrice)) {
                $prefix .= " above Rs {$minPrice}";
            }

            if ($stockFilter === 'in_stock') {
                $prefix .= ' (in stock)';
            }

            if ($stockFilter === 'out_of_stock') {
                $prefix .= ' (out of stock)';
            }

            return "{$prefix}: {$list}.";
        }

        if (
            Str::contains($normalized, ['category', 'categories']) &&
            Str::contains($normalized, ['order', 'recent', 'last', 'latest', 'my'])
        ) {
            $latestOrder = Order::query()
                ->where('user_id', $userId)
                ->with('product.categories:id,title')
                ->latest('id')
                ->first();

            if (! $latestOrder || ! $latestOrder->product) {
                return 'I could not find a recent order to map with categories.';
            }

            $categoryNames = $latestOrder->product->categories
                ->pluck('title')
                ->filter()
                ->values();

            if ($categoryNames->isEmpty()) {
                return "Your recent order item {$latestOrder->product->title} has no mapped category.";
            }

            return "Your recent order item {$latestOrder->product->title} falls under: ".$categoryNames->implode(', ').'.';
        }

        if (Str::contains($normalized, ['category', 'categories'])) {
            $categories = Category::query()
                ->orderBy('title')
                ->limit(10)
                ->pluck('title')
                ->all();

            if (empty($categories)) {
                return 'No categories are available right now.';
            }

            return 'Available categories: '.implode(', ', $categories).'.';
        }

        if (Str::contains($normalized, ['order', 'orders', 'invoice', 'inv', 'detail', 'details', 'show'])) {
            $invoiceId = $this->extractInvoiceId($normalized);
            $firstCount = $this->extractFirstOrdersCount($normalized);
            $lastCount = $this->extractLastOrdersCount($normalized);

            $query = Order::query()
                ->where('user_id', $userId)
                ->with('product:id,title');

            if ($invoiceId) {
                $query->where('invoice_id', $invoiceId);
                $limit = 1;
            } elseif (! is_null($firstCount)) {
                $query->oldest('id');
                $limit = $firstCount;
            } else {
                $query->latest('id');
                $limit = $lastCount ?? 10;
            }

            $orders = $query->limit($limit)->get(['invoice_id', 'product_id', 'qty']);

            if ($orders->isEmpty()) {
                if ($invoiceId) {
                    return "I could not find order {$invoiceId} in your records.";
                }
                return 'You do not have any orders yet.';
            }

            $list = $orders->map(function ($order) {
                $name = $order->product?->title ?? 'Unknown product';
                return "{$order->invoice_id}: {$name} x{$order->qty}";
            })->implode(', ');

            if ($invoiceId) {
                return "Order details for {$invoiceId}: {$list}.";
            }

            if (! is_null($firstCount)) {
                $text = $firstCount === 1 ? 'order' : 'orders';
                return "Your first {$firstCount} {$text}: {$list}.";
            }

            if (! is_null($lastCount)) {
                $text = $lastCount === 1 ? 'order' : 'orders';
                return "Your last {$lastCount} {$text}: {$list}.";
            }

            return "Your recent orders: {$list}.";
        }

        return 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.';
    }

    protected function extractCategoryFilter(string $normalizedMessage): ?string
    {
        // This now just returns first category for backward compatibility
        $categories = $this->extractMultipleCategories($normalizedMessage);
        return count($categories) > 0 ? $categories[0] : null;
    }

    /**
     * Extract MULTIPLE categories from message.
     * Handles cases like "lighting and audio", "cable and accessories"
     * Returns array of all mentioned categories
     */
    protected function extractMultipleCategories(string $normalizedMessage): array
    {
        $allCategories = Category::query()->get(['title']);
        $mentionedCategories = [];

        foreach ($allCategories as $category) {
            $categoryTitle = Str::lower($category->title);
            // Extract just the main keyword (first word or before &)
            $mainKeyword = explode('&', $categoryTitle)[0];
            $mainKeyword = trim($mainKeyword);

            // Check if message contains the category name or main keyword
            if (Str::contains($normalizedMessage, $categoryTitle) ||
                (strlen($mainKeyword) > 3 && Str::contains($normalizedMessage, $mainKeyword))) {
                $mentionedCategories[] = $categoryTitle;
            }
        }

        return $mentionedCategories;
    }

    protected function extractPriceConstraints(string $normalizedMessage): array
    {
        $minPrice = null;
        $maxPrice = null;
        $message = Str::lower($normalizedMessage);
        $message = str_replace(['₹', '$', 'rs.', 'rs', 'rupees', 'inr'], ' ', $message);
        $message = preg_replace('/\s+/', ' ', $message) ?? $message;

        if (preg_match('/(?:between|from)\s+([\d,]+(?:\.\d+)?\s*[k]?)\s*(?:and|to|-)\s*([\d,]+(?:\.\d+)?\s*[k]?)/i', $message, $matches)) {
            $first = $this->parseAmountToken($matches[1]);
            $second = $this->parseAmountToken($matches[2]);

            if (! is_null($first) && ! is_null($second)) {
                $minPrice = min($first, $second);
                $maxPrice = max($first, $second);
            }
        }

        $upperBoundPatterns = [
            '/(?:under|below|less than|upto|up to|at most|max(?:imum)?)(?:\s+price)?(?:\s+of)?\s*([\d,]+(?:\.\d+)?\s*[k]?)/i',
            '/price\s*(?:under|below|less than|upto|up to|at most|max(?:imum)?)(?:\s+of)?\s*([\d,]+(?:\.\d+)?\s*[k]?)/i',
            '/([\d,]+(?:\.\d+)?\s*[k]?)\s*(?:or less|or below|or under)/i',
        ];

        foreach ($upperBoundPatterns as $pattern) {
            if (preg_match($pattern, $message, $matches)) {
                $maxPrice = $this->parseAmountToken($matches[1]);
                break;
            }
        }

        $lowerBoundPatterns = [
            '/(?:above|over|greater than|more than|minimum|min(?:imum)?|at least)(?:\s+price)?(?:\s+of)?\s*([\d,]+(?:\.\d+)?\s*[k]?)/i',
            '/price\s*(?:above|over|greater than|more than|minimum|min(?:imum)?|at least)(?:\s+of)?\s*([\d,]+(?:\.\d+)?\s*[k]?)/i',
            '/([\d,]+(?:\.\d+)?\s*[k]?)\s*(?:or more|or higher)/i',
        ];

        foreach ($lowerBoundPatterns as $pattern) {
            if (preg_match($pattern, $message, $matches)) {
                $minPrice = $this->parseAmountToken($matches[1]);
                break;
            }
        }

        return [$minPrice, $maxPrice];
    }

    protected function parseAmountToken(string $value): ?float
    {
        $normalized = Str::lower(str_replace(',', '', trim($value)));
        $isThousand = Str::endsWith($normalized, 'k');
        $normalized = rtrim($normalized, 'k');

        if (! is_numeric($normalized)) {
            return null;
        }

        $amount = (float) $normalized;

        return $isThousand ? $amount * 1000 : $amount;
    }

    protected function extractProductLimit(string $normalizedMessage): int
    {
        if (preg_match('/(?:top|first|show|list)\s+(\d{1,2})\b/i', $normalizedMessage, $matches)) {
            $limit = (int) $matches[1];

            return max(1, min($limit, 50));
        }

        return 10;
    }

    protected function extractStockFilter(string $normalizedMessage): ?string
    {
        if (Str::contains($normalizedMessage, ['out of stock', 'not available', 'unavailable'])) {
            return 'out_of_stock';
        }

        if (Str::contains($normalizedMessage, ['in stock', 'available', 'instock'])) {
            return 'in_stock';
        }

        return null;
    }

    protected function extractSortPreference(string $normalizedMessage): ?string
    {
        if (Str::contains($normalizedMessage, ['cheapest', 'lowest price', 'low price'])) {
            return 'price_asc';
        }

        if (Str::contains($normalizedMessage, ['most expensive', 'highest price', 'high price', 'costliest'])) {
            return 'price_desc';
        }

        return null;
    }

    protected function isCountProductQuery(string $normalizedMessage): bool
    {
        return Str::contains($normalizedMessage, ['how many', 'count', 'number of']);
    }

    protected function isPerCategoryProductQuery(string $normalizedMessage): bool
    {
        if (! Str::contains($normalizedMessage, ['product', 'products'])) {
            return false;
        }

        return preg_match('/(?:from|for)?\s*(?:each|every|per)\s+categor(?:y|ies)/i', $normalizedMessage) === 1;
    }

    protected function extractPerCategoryProductLimit(string $normalizedMessage): int
    {
        if (preg_match('/\b(\d{1,2})\s+products?\b/i', $normalizedMessage, $matches)) {
            return max(1, min((int) $matches[1], 5));
        }

        $wordToNumber = [
            'one' => 1,
            'two' => 2,
            'three' => 3,
            'four' => 4,
            'five' => 5,
        ];

        foreach ($wordToNumber as $word => $value) {
            if (preg_match("/\\b{$word}\\s+products?\\b/i", $normalizedMessage) === 1) {
                return $value;
            }
        }

        return 1;
    }

    protected function containsAbusiveLanguage(string $message): bool
    {
        $normalized = $this->normalizeAbusiveText($message);
        $compact = str_replace(' ', '', $normalized);

        $normalizedPatterns = [
            '/(?<![a-z])f(?:u+c*k+|a+c*k+|a+k+|u+k+)(?:ing|er|ed|s)?(?![a-z])/',
            '/(?<![a-z])s+h+i+t+(?:ty|s)?(?![a-z])/',
            '/(?<![a-z])b+i+t+c+h+(?:es)?(?![a-z])/',
            '/(?<![a-z])a+s+s+h+o+l+e+(?:s)?(?![a-z])/',
            '/(?<![a-z])m+a+d+a+r+c+h+o+d+(?![a-z])/',
            '/(?<![a-z])b+h+e+n+c+h+o+d+(?![a-z])/',
            '/(?<![a-z])ch(?:u)?(?:t)?(?:i)?y+a+(?:p+a+)?(?![a-z])/',
            '/(?<![a-z])g+a+n+d+u+(?![a-z])/',
            '/(?<![a-z])c+h+o+d+u+(?![a-z])/',
            '/(?<![a-z])r+a+n+d(?:i)(?:ya)+(?![a-z])/',
        ];

        foreach ($normalizedPatterns as $pattern) {
            if (preg_match($pattern, $normalized) === 1 || preg_match($pattern, $compact) === 1) {
                return true;
            }
        }

        $censoredRawPatterns = [
            '/(^|[^a-z0-9])f[\W_@#$*!0-9]*[u@a*#]?[\W_@#$*!0-9]*[c*#]?[\W_@#$*!0-9]*k(?:ing|er|ed|s)?($|[^a-z0-9])/i',
            '/(^|[^a-z0-9])m[\W_@#$*!0-9]*[@a4][\W_@#$*!0-9]*d[\W_@#$*!0-9]*a[\W_@#$*!0-9]*r[\W_@#$*!0-9]*c[\W_@#$*!0-9]*h[\W_@#$*!0-9]*[o0][\W_@#$*!0-9]*d($|[^a-z0-9])/i',
            '/(^|[^a-z0-9])ch[\W_@#$*!0-9]*(?:u|0|@|\*)?[\W_@#$*!0-9]*(?:t|\*)?[\W_@#$*!0-9]*(?:i|1|\*)?[\W_@#$*!0-9]*y[\W_@#$*!0-9]*a($|[^a-z0-9])/i',
        ];

        foreach ($censoredRawPatterns as $pattern) {
            if (preg_match($pattern, $message) === 1) {
                return true;
            }
        }

        return false;
    }

    protected function normalizeAbusiveText(string $message): string
    {
        $normalized = Str::lower($message);

        $normalized = strtr($normalized, [
            '@' => 'a',
            '0' => 'o',
            '1' => 'i',
            '3' => 'e',
            '4' => 'a',
            '5' => 's',
            '7' => 't',
            '$' => 's',
            '!' => 'i',
            '|' => 'i',
        ]);

        $normalized = preg_replace('/[^a-z]+/i', ' ', $normalized) ?? $normalized;
        $normalized = preg_replace('/\s+/', ' ', $normalized) ?? $normalized;

        return trim($normalized);
    }

    protected function persistConversationMessages(
        int $userId,
        string $userMessage,
        string $assistantReply,
        ?string $conversationId = null
    ): string {
        $conversationId = $this->resolveConversationId($userId, $userMessage, $conversationId);

        $now = now();
        $agent = SalesAssistant::class;

        DB::table('agent_conversation_messages')->insert([
            [
                'id' => (string) Str::uuid7(),
                'conversation_id' => $conversationId,
                'user_id' => $userId,
                'agent' => $agent,
                'role' => 'user',
                'content' => $userMessage,
                'attachments' => '[]',
                'tool_calls' => '[]',
                'tool_results' => '[]',
                'usage' => '[]',
                'meta' => '[]',
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'id' => (string) Str::uuid7(),
                'conversation_id' => $conversationId,
                'user_id' => $userId,
                'agent' => $agent,
                'role' => 'assistant',
                'content' => $assistantReply,
                'attachments' => '[]',
                'tool_calls' => '[]',
                'tool_results' => '[]',
                'usage' => '[]',
                'meta' => json_encode(['provider' => 'local', 'model' => 'fallback']),
                'created_at' => $now,
                'updated_at' => $now,
            ],
        ]);

        DB::table('agent_conversations')
            ->where('id', $conversationId)
            ->update(['updated_at' => $now]);

        return $conversationId;
    }

    protected function resolveConversationId(int $userId, string $message, ?string $conversationId): string
    {
        if (! empty($conversationId)) {
            $exists = DB::table('agent_conversations')
                ->where('id', $conversationId)
                ->where('user_id', $userId)
                ->exists();

            if ($exists) {
                return $conversationId;
            }
        }

        $newConversationId = (string) Str::uuid7();
        $now = now();

        DB::table('agent_conversations')->insert([
            'id' => $newConversationId,
            'user_id' => $userId,
            'title' => Str::limit($message, 100, ''),
            'created_at' => $now,
            'updated_at' => $now,
        ]);

        return $newConversationId;
    }

    /**
     * Extract invoice ID from normalized message.
     * Handles formats like "INV-1001", "1001", "invoice 1001", etc.
     */
    protected function extractInvoiceId(string $normalizedMessage): ?string
    {
        // Match patterns like INV-1001, INV-1002, etc.
        if (preg_match('/inv-?(\d{4})/', $normalizedMessage, $matches)) {
            return 'INV-' . $matches[1];
        }

        // Match patterns like "show for 1001", "details for 1001", "show 1001", etc.
        if (preg_match('/(?:show|for|details|get|retrieve|find)[\s\w]*\s+(\d{4})/', $normalizedMessage, $matches)) {
            return 'INV-' . $matches[1];
        }

        // Match standalone 4-digit numbers in context of orders/invoices
        if (preg_match('/\b(\d{4})\b/', $normalizedMessage, $matches)) {
            if (Str::contains($normalizedMessage, ['order', 'invoice', 'detail', 'show', 'get'])) {
                return 'INV-' . $matches[1];
            }
        }

        return null;
    }

    /**
     * Extract "last N orders" count from normalized message.
     * Handles patterns like "last 2", "my last 5", "show last 3", etc.
     */
    protected function extractLastOrdersCount(string $normalizedMessage): ?int
    {
        if (preg_match('/(?:last|latest|recent)\s+(\d+|one|two|three|four|five|six|seven|eight|nine|ten)/i', $normalizedMessage, $matches)) {
            return $this->parseOrderCountToken($matches[1]);
        }

        return null;
    }

    /**
     * Extract "first N orders" count from normalized message.
     * Handles patterns like "first 2", "my first two", "oldest 3", etc.
     */
    protected function extractFirstOrdersCount(string $normalizedMessage): ?int
    {
        if (preg_match('/(?:first|oldest|earliest)\s+(\d+|one|two|three|four|five|six|seven|eight|nine|ten)/i', $normalizedMessage, $matches)) {
            return $this->parseOrderCountToken($matches[1]);
        }

        return null;
    }

    protected function parseOrderCountToken(string $token): int
    {
        $map = [
            'one' => 1,
            'two' => 2,
            'three' => 3,
            'four' => 4,
            'five' => 5,
            'six' => 6,
            'seven' => 7,
            'eight' => 8,
            'nine' => 9,
            'ten' => 10,
        ];

        $normalized = Str::lower(trim($token));
        $count = is_numeric($normalized) ? (int) $normalized : ($map[$normalized] ?? 1);

        return max(1, min($count, 50));
    }
}
