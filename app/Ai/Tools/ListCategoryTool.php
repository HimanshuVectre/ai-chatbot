<?php

namespace App\Ai\Tools;

use App\Models\Category;
use Illuminate\Contracts\JsonSchema\JsonSchema;
use Laravel\Ai\Contracts\Tool;
use Laravel\Ai\Tools\Request;
use Stringable;

class ListCategoryTool implements Tool
{
    /**
     * Get the description of the tool's purpose.
     */
    public function description(): Stringable|string
    {
        return 'List categories available in the store, optionally filtered by a search term.';
    }

    /**
     * Execute the tool.
     */
    public function handle(Request $request): Stringable|string
    {
        $search = $request['search'] ?? null;
        $limit = (int) ($request['limit'] ?? 20);
        $limit = max(1, min($limit, 50));

        $categories = Category::query()
            ->when($search, fn ($query) => $query->where('title', 'like', '%'.$search.'%'))
            ->orderBy('title')
            ->limit($limit)
            ->get(['id', 'title']);

        return $categories->toJson();
    }

    /**
     * Get the tool's schema definition.
     */
    public function schema(JsonSchema $schema): array
    {
        return [
            'search' => $schema->string()->nullable(),
            'limit' => $schema->integer()->nullable(),
        ];
    }
}
