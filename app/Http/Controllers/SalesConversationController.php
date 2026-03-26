<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class SalesConversationController extends Controller
{
    /**
     * Show the sales chat interface
     * GET /sales/chat
     */
    public function index()
    {
        $user = auth()->user();

        // Get user's recent conversations
        $conversations = DB::table('agent_conversations')
            ->where('user_id', $user->id)
            // ->orderBy('updated_at', 'desc')
            ->limit(10)
            ->get()
            ->map(fn($conv) => [
                'id' => $conv->id,
                'created_at' => $conv->created_at,
                'last_interaction' => $conv->updated_at,
            ])
            ->toArray();

        return Inertia::render('SalesChat', [
            'conversations' => $conversations,
        ]);
    }

    /**
     * Get conversation history
     * GET /api/sales/conversation/{conversationId}/history
     */
    public function getHistory(Request $request, string $conversationId)
    {
        $user = auth()->user();

        // Verify user owns this conversation
        $conversation = DB::table('agent_conversations')
            ->where('id', $conversationId)
            ->where('user_id', $user->id)
            ->first();

        if (!$conversation) {
            return response()->json(['error' => 'Conversation not found'], 404);
        }

        // Get all messages in conversation
        $messages = DB::table('agent_conversation_messages')
            ->where('conversation_id', $conversationId)
            ->orderBy('created_at', 'asc')
            ->get()
            ->map(fn($msg) => [
                'role' => $msg->role,
                'content' => $msg->content,
                'timestamp' => $msg->created_at,
            ])
            ->toArray();

        return response()->json([
            'success' => true,
            'conversation_id' => $conversationId,
            'messages_count' => count($messages),
            'messages' => $messages,
            'created_at' => $conversation->created_at,
            'last_interaction' => $conversation->updated_at,
        ]);
    }

    /**
     * Get user's conversation list
     * GET /api/sales/conversations
     */
    public function listConversations(Request $request)
    {
        $user = auth()->user();

        $conversations = DB::table('agent_conversations')
            ->where('user_id', $user->id)
            ->orderBy('updated_at', 'desc')
            ->limit(50)
            ->get()
            ->map(fn($conv) => [
                'id' => $conv->id,
                'created_at' => $conv->created_at,
                'last_interaction' => $conv->updated_at,
                'model' => $conv->model,
            ])
            ->toArray();

        return response()->json([
            'success' => true,
            'total' => count($conversations),
            'conversations' => $conversations,
        ]);
    }

    /**
     * Get specific conversation details
     * GET /api/sales/conversation/{conversationId}
     */
    public function getConversation(Request $request, string $conversationId)
    {
        $user = auth()->user();

        $conversation = DB::table('agent_conversations')
            ->where('id', $conversationId)
            ->where('user_id', $user->id)
            ->first();

        if (!$conversation) {
            return response()->json(['error' => 'Conversation not found'], 404);
        }

        // Get message count
        $messageCount = DB::table('agent_conversation_messages')
            ->where('conversation_id', $conversationId)
            ->count();

        return response()->json([
            'success' => true,
            'id' => $conversation->id,
            'created_at' => $conversation->created_at,
            'last_interaction' => $conversation->updated_at,
            'model' => $conversation->model,
            'provider' => $conversation->provider,
            'message_count' => $messageCount,
        ]);
    }

    /**
     * Delete a conversation
     * DELETE /api/sales/conversation/{conversationId}
     */
    public function deleteConversation(Request $request, string $conversationId)
    {
        $user = auth()->user();

        // Verify user owns this conversation
        $conversation = DB::table('agent_conversations')
            ->where('id', $conversationId)
            ->where('user_id', $user->id)
            ->first();

        if (!$conversation) {
            return response()->json(['error' => 'Conversation not found'], 404);
        }

        // Delete messages first (foreign key constraint)
        DB::table('agent_conversation_messages')
            ->where('conversation_id', $conversationId)
            ->delete();

        // Delete conversation
        DB::table('agent_conversations')
            ->where('id', $conversationId)
            ->delete();

        return response()->json([
            'success' => true,
            'message' => 'Conversation deleted successfully',
        ]);
    }

    /**
     * Clear all conversations for user
     * DELETE /api/sales/conversations/clear-all
     */
    public function clearAllConversations(Request $request)
    {
        $user = auth()->user();

        // Get all conversation IDs for user
        $conversationIds = DB::table('agent_conversations')
            ->where('user_id', $user->id)
            ->pluck('id')
            ->toArray();

        if (empty($conversationIds)) {
            return response()->json([
                'success' => true,
                'message' => 'No conversations to delete',
                'deleted' => 0,
            ]);
        }

        // Delete all messages
        DB::table('agent_conversation_messages')
            ->whereIn('conversation_id', $conversationIds)
            ->delete();

        // Delete all conversations
        $deleted = DB::table('agent_conversations')
            ->where('user_id', $user->id)
            ->delete();

        return response()->json([
            'success' => true,
            'message' => 'All conversations cleared',
            'deleted' => $deleted,
        ]);
    }

    /**
     * Export conversation as JSON
     * GET /api/sales/conversation/{conversationId}/export
     */
    public function exportConversation(Request $request, string $conversationId)
    {
        $user = auth()->user();

        // Verify user owns this conversation
        $conversation = DB::table('agent_conversations')
            ->where('id', $conversationId)
            ->where('user_id', $user->id)
            ->first();

        if (!$conversation) {
            return response()->json(['error' => 'Conversation not found'], 404);
        }

        // Get all messages
        $messages = DB::table('agent_conversation_messages')
            ->where('conversation_id', $conversationId)
            ->orderBy('created_at', 'asc')
            ->get()
            ->toArray();

        return response()->json([
            'success' => true,
            'export' => [
                'conversation_id' => $conversationId,
                'created_at' => $conversation->created_at,
                'last_interaction' => $conversation->updated_at,
                'total_messages' => count($messages),
                'messages' => $messages,
            ],
        ]);
    }

    /**
     * Get conversation statistics
     * GET /api/sales/conversations/stats
     */
    public function getStats(Request $request)
    {
        $user = auth()->user();

        $totalConversations = DB::table('agent_conversations')
            ->where('user_id', $user->id)
            ->count();

        $totalMessages = DB::table('agent_conversations as c')
            ->leftJoin('agent_conversation_messages as m', 'c.id', '=', 'm.conversation_id')
            ->where('c.user_id', $user->id)
            ->count('m.id');

        $avgMessagesPerConversation = $totalConversations > 0
            ? round($totalMessages / $totalConversations, 2)
            : 0;

        $recentConversation = DB::table('agent_conversations')
            ->where('user_id', $user->id)
            ->orderBy('updated_at', 'desc')
            ->first();

        return response()->json([
            'success' => true,
            'stats' => [
                'total_conversations' => $totalConversations,
                'total_messages' => $totalMessages,
                'avg_messages_per_conversation' => $avgMessagesPerConversation,
                'last_interaction' => $recentConversation?->updated_at,
            ],
        ]);
    }
}
