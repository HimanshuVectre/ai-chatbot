<?php

namespace App\Ai\Tools;

use App\Models\Order;
use App\Models\User;
use Illuminate\Contracts\JsonSchema\JsonSchema;
use Illuminate\Support\Str;
use Laravel\Ai\Contracts\Tool;
use Laravel\Ai\Tools\Request;
use Stringable;

class ListOrderToolForUser implements Tool
{
    public function __construct(protected User $user) {}

    /**
     * Get the description of the tool's purpose.
     */
    public function description(): Stringable|string
    {
        return 'Retrieve orders for the current user. '
            .'Use invoice_id for exact invoice lookup. '
            .'Use limit for number of rows. '
            .'Use position="last" for most recent orders and position="first" for oldest orders. '
            .'Examples: '
            .'"INV-1001 details" => invoice_id="INV-1001". '
            .'"my last 2 orders" => limit=2, position="last". '
            .'"my first 2 orders" => limit=2, position="first". '
            .'"show my orders" => no params.';
    }

    /**
     * Execute the tool.
     */
    public function handle(Request $request): Stringable|string
    {
        $invoiceId = $request['invoice_id'] ?? null;
        $limit = (int) ($request['limit'] ?? 20);
        $limit = max(1, min($limit, 50));
        $position = Str::lower((string) ($request['position'] ?? 'last'));
        $position = in_array($position, ['first', 'oldest', 'earliest'], true) ? 'first' : 'last';

        $query = Order::query()
            ->where('user_id', $this->user->id)
            ->when($invoiceId, fn ($query) => $query->where('invoice_id', $invoiceId))
            ->with(['product:id,title,price', 'product.categories:id,title']);

        if (! $invoiceId) {
            if ($position === 'first') {
                $query->oldest('id');
            } else {
                $query->latest('id');
            }
        } else {
            $limit = 1;
        }

        $orders = $query->limit($limit)->get(['id', 'invoice_id', 'product_id', 'qty', 'created_at']);

        return $orders->toJson();
    }

    /**
     * Get the tool's schema definition.
     */
    public function schema(JsonSchema $schema): array
    {
        return [
            'invoice_id' => $schema->string()->nullable(),
            'limit' => $schema->integer()->nullable(),
            'position' => $schema->string()->nullable(),
        ];
    }
}
