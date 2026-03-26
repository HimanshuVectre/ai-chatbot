<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AgentController;
use App\Http\Controllers\SalesConversationController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\ChatController;

Route::get('/', function () {
    return view('chat');
});

Route::post('/chat', [ChatController::class, 'sendMessage']);

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/chatbot', fn () => Inertia::render('Chatbot'))->name('chatbot');
    Route::post('invoke-agent', [AgentController::class, 'callAgent'])->name('invoke-agent');

    // Sales Conversation Routes
    Route::get('/sales/chat', [SalesConversationController::class, 'index'])->name('sales.chat');

    // API endpoints for conversation management
    Route::prefix('api/sales')->group(function () {
        // Conversation management
        Route::get('/conversations', [SalesConversationController::class, 'listConversations'])->name('api.sales.conversations.list');
        Route::get('/conversations/stats', [SalesConversationController::class, 'getStats'])->name('api.sales.conversations.stats');
        Route::delete('/conversations/clear-all', [SalesConversationController::class, 'clearAllConversations'])->name('api.sales.conversations.clear-all');

        // Individual conversation routes
        Route::get('/conversation/{conversationId}', [SalesConversationController::class, 'getConversation'])->name('api.sales.conversation.get');
        Route::get('/conversation/{conversationId}/history', [SalesConversationController::class, 'getHistory'])->name('api.sales.conversation.history');
        Route::get('/conversation/{conversationId}/export', [SalesConversationController::class, 'exportConversation'])->name('api.sales.conversation.export');
        Route::delete('/conversation/{conversationId}', [SalesConversationController::class, 'deleteConversation'])->name('api.sales.conversation.delete');
    });
});

require __DIR__.'/auth.php';
