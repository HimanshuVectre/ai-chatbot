<?php

namespace App\Ai\Tools;

use App\Models\Product;
use Illuminate\Contracts\JsonSchema\JsonSchema;
use Laravel\Ai\Contracts\Tool;
use Laravel\Ai\Tools\Request;
use Stringable;

class ListProductTool implements Tool
{
    /**
     * Get the description of the tool's purpose.
     */
    public function description(): Stringable|string
    {
        return 'LIST PRODUCTS WITH FLEXIBLE FILTERING. '
        .'Can filter by SINGLE or MULTIPLE categories, price range, and limit results. '
        .'IMPORTANT: When user mentions multiple categories (e.g., "lighting and audio"), ALWAYS use categories_list parameter (comma-separated). '
        .'EXAMPLES: '
        .'"Show lighting products" → use category="lighting" OR categories_list="lighting". '
        .'"Show lighting and audio products" → use categories_list="lighting,audio" (CRITICAL: use comma-separated list, not single category). '
        .'"Lighting products between 2000 to 5000" → category="lighting", min_price=2000, max_price=5000. '
        .'"Audio and Video products under 3000" → categories_list="audio,video", max_price=3000. '
        .'If user says multiple categories like "and", "with", "also", or lists them separately, ALWAYS parse all mentioned categories and pass them in categories_list separated by commas. ';
    }

    /**
     * Execute the tool.
     */
    public function handle(Request $request): Stringable|string
    {
        $category = $request['category'] ?? null;
        $categoriesList = $request['categories_list'] ?? null;
        $minPrice = $request['min_price'] ?? null;
        $maxPrice = $request['max_price'] ?? null;
        $limit = (int) ($request['limit'] ?? 20);
        $limit = max(1, min($limit, 50));

        // Parse categories_list (comma-separated string) into array
        $categories = [];
        if ($categoriesList) {
            $categories = array_map('trim', explode(',', $categoriesList));
            $categories = array_filter($categories);
        } elseif ($category) {
            $categories = [$category];
        }

        $products = Product::query()
            ->when(!empty($categories), function ($query) use ($categories) {
                // Include products in ANY of the mentioned categories
                $query->whereHas('categories', function ($categoryQuery) use ($categories) {
                    $categoryQuery->whereIn('title', $categories);
                });
            })
            ->when(is_numeric($minPrice), fn ($query) => $query->where('price', '>=', $minPrice))
            ->when(is_numeric($maxPrice), fn ($query) => $query->where('price', '<=', $maxPrice))
            ->with('categories:id,title')
            ->distinct()
            ->orderBy('title')
            ->limit($limit)
            ->get(['id', 'title', 'price', 'stock', 'description']);

        return $products->toJson();
    }

    /**
     * Get the tool's schema definition.
     */
    public function schema(JsonSchema $schema): array
    {
        return [
            'category' => $schema->string()->nullable(),
            'categories_list' => $schema->string()->nullable(),
            'min_price' => $schema->number()->nullable(),
            'max_price' => $schema->number()->nullable(),
            'limit' => $schema->integer()->nullable(),
        ];
    }
}
