# Conversation Context Implementation Checklist for SalesAssistant

This document provides a step-by-step checklist to implement Conversation Context in your SalesAssistant agent with working code examples.

---

## Phase 1: Verify Prerequisites ✅

### Step 1.1: Check Laravel AI SDK Installation
```bash
# Run from your project root: d:\Vectre\Ai sdk laravel
cd ai_sdk
php artisan --version

# Verify Laravel AI is installed
composer show | grep laravel/ai
```

**Expected Output:**
```
laravel/ai                    v0.x.x     Laravel AI SDK
```

### Step 1.2: Verify Database Migrations
```bash
# Check if conversation tables exist
php artisan migrate:status
```

**Expected Output:**
```
✓ 2026_02_06... (tables already migrated)
✓ 2026_02_07... agent_conversations table
✓ 2026_02_07... agent_conversation_messages table
```

**If tables don't exist, run:**
```bash
php artisan vendor:publish --provider="Laravel\Ai\AiServiceProvider"
php artisan migrate
```

### Step 1.3: Verify User Model
```bash
# Check that your User model exists and is properly configured
ls app/Models/User.php
```

---

## Phase 2: Review Current SalesAssistant 🔍

### Step 2.1: Check Current Implementation
✅ **Your SalesAssistant already has:**
- `RemembersConversations` trait imported
- `Conversational` interface implemented
- `User` parameter in constructor
- `HasTools` interface implemented

**Location:** `app/Ai/Agents/SalesAssistant.php`

### Step 2.2: Current Status
```php
// ✅ ALREADY IN PLACE
class SalesAssistant implements Agent, Conversational, HasTools
{
    use Promptable, RemembersConversations;  // ✅ Good!

    public User $user;  // ✅ Good!

    public function __construct(User $user)  // ✅ Good!
    {
        $this->user = $user;
    }
}
```

**Action Required:** None - Foundation is already set up! ✅

---

## Phase 3: Create Conversation Handler Controller 🎮

### Step 3.1: Create SalesConversationController
```bash
php artisan make:controller SalesConversationController
```

### Step 3.2: Add to `app/Http/Controllers/SalesConversationController.php`

```php
<?php

namespace App\Http\Controllers;

use App\Ai\Agents\SalesAssistant;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SalesConversationController extends Controller
{
    /**
     * Start a new sales conversation
     * 
     * POST /sales/conversation/start
     * Body: { "message": "Show me lighting products" }
     */
    public function start(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:1000',
        ]);

        $user = auth()->user();
        
        if (!$user) {
            return response()->json(['error' => 'Unauthenticated'], 401);
        }

        try {
            $agent = new SalesAssistant($user);
            
            // Create new conversation
            $response = $agent
                ->forUser($user)  // ← Creates new conversation
                ->prompt($request->input('message'));

            return response()->json([
                'success' => true,
                'message' => $response->text,
                'conversation_id' => $response->conversationId,
                'timestamp' => now(),
            ]);
        } catch (\Exception $e) {
            \Log::error('Sales conversation start error: ' . $e->getMessage());
            return response()->json([
                'error' => 'Failed to start conversation',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Continue an existing conversation
     * 
     * POST /sales/conversation/{conversationId}
     * Body: { "message": "What about the blue one?" }
     */
    public function continue(Request $request, string $conversationId)
    {
        $request->validate([
            'message' => 'required|string|max:1000',
        ]);

        $user = auth()->user();
        
        if (!$user) {
            return response()->json(['error' => 'Unauthenticated'], 401);
        }

        try {
            $agent = new SalesAssistant($user);
            
            // Continue existing conversation with history
            $response = $agent
                ->continue($conversationId, as: $user)  // ← Loads previous messages
                ->prompt($request->input('message'));

            return response()->json([
                'success' => true,
                'message' => $response->text,
                'conversation_id' => $conversationId,
                'timestamp' => now(),
            ]);
        } catch (\Exception $e) {
            \Log::error('Sales conversation continue error: ' . $e->getMessage());
            return response()->json([
                'error' => 'Failed to continue conversation',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Get conversation history
     * 
     * GET /sales/conversation/{conversationId}/history
     */
    public function getHistory(string $conversationId)
    {
        $user = auth()->user();
        
        if (!$user) {
            return response()->json(['error' => 'Unauthenticated'], 401);
        }

        try {
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
                'started_at' => $conversation->started_at,
                'last_interaction' => $conversation->last_interaction_at,
            ]);
        } catch (\Exception $e) {
            \Log::error('Sales conversation history error: ' . $e->getMessage());
            return response()->json([
                'error' => 'Failed to retrieve history',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Get user's conversation list
     * 
     * GET /sales/conversations
     */
    public function list()
    {
        $user = auth()->user();
        
        if (!$user) {
            return response()->json(['error' => 'Unauthenticated'], 401);
        }

        try {
            $conversations = DB::table('agent_conversations')
                ->where('user_id', $user->id)
                ->orderBy('last_interaction_at', 'desc')
                ->limit(20)
                ->get()
                ->map(fn($conv) => [
                    'id' => $conv->id,
                    'started_at' => $conv->started_at,
                    'last_interaction' => $conv->last_interaction_at,
                    'model' => $conv->model,
                    'provider' => $conv->provider,
                ])
                ->toArray();

            return response()->json([
                'success' => true,
                'total' => count($conversations),
                'conversations' => $conversations,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to retrieve conversations',
            ], 500);
        }
    }

    /**
     * Delete a conversation
     * 
     * DELETE /sales/conversation/{conversationId}
     */
    public function delete(string $conversationId)
    {
        $user = auth()->user();
        
        if (!$user) {
            return response()->json(['error' => 'Unauthenticated'], 401);
        }

        try {
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
                'message' => 'Conversation deleted',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to delete conversation',
            ], 500);
        }
    }
}
```

---

## Phase 4: Add Routes 🛣️

### Step 4.1: Update `routes/web.php`

```php
<?php

use App\Http\Controllers\SalesConversationController;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth'])->group(function () {
    // Sales Conversation Routes
    
    // Start a new conversation
    Route::post('/sales/conversation/start', 
        [SalesConversationController::class, 'start'])
        ->name('sales.conversation.start');
    
    // Continue conversation
    Route::post('/sales/conversation/{conversationId}', 
        [SalesConversationController::class, 'continue'])
        ->name('sales.conversation.continue');
    
    // Get conversation history
    Route::get('/sales/conversation/{conversationId}/history', 
        [SalesConversationController::class, 'getHistory'])
        ->name('sales.conversation.history');
    
    // List user conversations
    Route::get('/sales/conversations', 
        [SalesConversationController::class, 'list'])
        ->name('sales.conversations.list');
    
    // Delete conversation
    Route::delete('/sales/conversation/{conversationId}', 
        [SalesConversationController::class, 'delete'])
        ->name('sales.conversation.delete');
});
```

---

## Phase 5: Create Frontend Component 🖥️

### Step 5.1: Create Vue Component
**File:** `resources/js/components/SalesChat.vue`

```vue
<template>
  <div class="sales-chat">
    <div class="chat-header">
      <h3>Sales Assistant</h3>
      <span v-if="conversationId" class="conversation-id">
        Conversation #{{ conversationId.slice(0, 8) }}
      </span>
    </div>

    <div class="chat-messages">
      <div 
        v-for="(message, index) in messages" 
        :key="index"
        :class="['chat-message', message.role]"
      >
        <div class="message-role">{{ message.role === 'user' ? 'You' : 'Assistant' }}</div>
        <div class="message-content">{{ message.content }}</div>
        <div class="message-time">{{ formatTime(message.timestamp) }}</div>
      </div>
    </div>

    <div class="chat-input">
      <input 
        v-model="newMessage"
        @keyup.enter="sendMessage"
        type="text"
        placeholder="Ask about products or orders..."
        :disabled="loading"
      >
      <button @click="sendMessage" :disabled="loading || !newMessage">
        {{ loading ? 'Sending...' : 'Send' }}
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue';

const messages = ref([]);
const newMessage = ref('');
const conversationId = ref(null);
const loading = ref(false);

const sendMessage = async () => {
  if (!newMessage.value.trim()) return;

  const userMessage = newMessage.value;
  messages.value.push({
    role: 'user',
    content: userMessage,
    timestamp: new Date(),
  });

  newMessage.value = '';
  loading.value = true;

  try {
    let response;

    if (!conversationId.value) {
      // Start new conversation
      response = await fetch('/sales/conversation/start', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': document.querySelector('[name=csrf-token]').content,
        },
        body: JSON.stringify({ message: userMessage }),
      });
    } else {
      // Continue conversation
      response = await fetch(`/sales/conversation/${conversationId.value}`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': document.querySelector('[name=csrf-token]').content,
        },
        body: JSON.stringify({ message: userMessage }),
      });
    }

    const data = await response.json();

    if (data.success) {
      conversationId.value = data.conversation_id;
      messages.value.push({
        role: 'assistant',
        content: data.message,
        timestamp: data.timestamp,
      });
    } else {
      messages.value.push({
        role: 'error',
        content: `Error: ${data.error}`,
        timestamp: new Date(),
      });
    }
  } catch (error) {
    messages.value.push({
      role: 'error',
      content: `Error: ${error.message}`,
      timestamp: new Date(),
    });
  } finally {
    loading.value = false;
  }
};

const formatTime = (date) => {
  if (typeof date === 'string') {
    date = new Date(date);
  }
  return date.toLocaleTimeString();
};
</script>

<style scoped>
.sales-chat {
  display: flex;
  flex-direction: column;
  height: 500px;
  border: 1px solid #ddd;
  border-radius: 8px;
  background: white;
}

.chat-header {
  padding: 15px;
  background: #007bff;
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-radius: 8px 8px 0 0;
}

.conversation-id {
  font-size: 12px;
  opacity: 0.8;
}

.chat-messages {
  flex: 1;
  padding: 15px;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.chat-message {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.chat-message.user {
  align-items: flex-end;
}

.chat-message.assistant {
  align-items: flex-start;
}

.message-role {
  font-size: 12px;
  font-weight: bold;
  color: #666;
}

.message-content {
  padding: 10px 15px;
  border-radius: 8px;
  max-width: 80%;
  word-wrap: break-word;
}

.chat-message.user .message-content {
  background: #007bff;
  color: white;
}

.chat-message.assistant .message-content {
  background: #f0f0f0;
  color: #333;
}

.chat-message.error .message-content {
  background: #f8d7da;
  color: #721c24;
}

.message-time {
  font-size: 11px;
  color: #999;
}

.chat-input {
  padding: 15px;
  border-top: 1px solid #ddd;
  display: flex;
  gap: 10px;
}

.chat-input input {
  flex: 1;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 14px;
}

.chat-input button {
  padding: 10px 20px;
  background: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
}

.chat-input button:disabled {
  background: #ccc;
  cursor: not-allowed;
}

.chat-input button:hover:not(:disabled) {
  background: #0056b3;
}
</style>
```

---

## Phase 6: Test Conversation Context 🧪

### Step 6.1: Manual Testing via API

**Start New Conversation:**
```bash
curl -X POST http://localhost:8000/sales/conversation/start \
  -H "Content-Type: application/json" \
  -H "X-CSRF-TOKEN: your-csrf-token" \
  -d '{"message":"Show me lighting products under 5000"}' \
  -b "XSRF-TOKEN=your-token" \
  -b "laravel_session=your-session"
```

**Expected Response:**
```json
{
  "success": true,
  "message": "Here are lighting products under 5000... [products list]",
  "conversation_id": "550e8400-e29b-41d4-a716-446655440000"
}
```

**Continue Conversation:**
```bash
curl -X POST http://localhost:8000/sales/conversation/550e8400-e29b-41d4-a716-446655440000 \
  -H "Content-Type: application/json" \
  -H "X-CSRF-TOKEN: your-csrf-token" \
  -d '{"message":"What about the blue one? Is it in stock?"}' \
  -b "XSRF-TOKEN=your-token" \
  -b "laravel_session=your-session"
```

**Key Test:** The agent should reference the earlier conversation when saying "the blue one"

### Step 6.2: Verify Database
```bash
# Check conversations table
php artisan tinker
> DB::table('agent_conversations')->latest()->first();

# Check messages
> DB::table('agent_conversation_messages')
    ->where('conversation_id', 'your-conversation-id')
    ->get();
```

### Step 6.3: Unit Test
**File:** `tests/Feature/SalesConversationTest.php`

```php
<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class SalesConversationTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    public function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_can_start_new_conversation()
    {
        $response = $this->actingAs($this->user)
            ->postJson('/sales/conversation/start', [
                'message' => 'Show me lighting products',
            ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'conversation_id',
                'timestamp',
            ]);

        $this->assertNotNull($response->json('conversation_id'));
    }

    public function test_can_continue_conversation()
    {
        // Start conversation
        $startResponse = $this->actingAs($this->user)
            ->postJson('/sales/conversation/start', [
                'message' => 'Show me lighting products',
            ]);

        $conversationId = $startResponse->json('conversation_id');

        // Continue conversation
        $continueResponse = $this->actingAs($this->user)
            ->postJson("/sales/conversation/{$conversationId}", [
                'message' => 'What about the blue one?',
            ]);

        $continueResponse->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'conversation_id',
            ]);

        $this->assertEquals($conversationId, $continueResponse->json('conversation_id'));
    }

    public function test_conversation_history_is_stored()
    {
        $response = $this->actingAs($this->user)
            ->postJson('/sales/conversation/start', [
                'message' => 'Show lighting',
            ]);

        $conversationId = $response->json('conversation_id');

        // Verify messages in database
        $this->assertDatabaseHas('agent_conversation_messages', [
            'conversation_id' => $conversationId,
            'role' => 'user',
        ]);

        $this->assertDatabaseHas('agent_conversation_messages', [
            'conversation_id' => $conversationId,
            'role' => 'assistant',
        ]);
    }
}
```

**Run Tests:**
```bash
php artisan test tests/Feature/SalesConversationTest.php
```

---

## Phase 7: Monitoring & Maintenance 📊

### Step 7.1: Add Logging
Update `SalesAssistant.php` to log conversations:

```php
// In SalesAssistant constructor or methods
\Log::info('Sales Agent Invoked', [
    'user_id' => $this->user->id,
    'user_email' => $this->user->email,
]);
```

### Step 7.2: Monitor Database Growth
```bash
# Monitor conversation table size
php artisan tinker
> DB::table('agent_conversations')->count();
> DB::table('agent_conversation_messages')->count();
```

### Step 7.3: Cleanup Old Conversations
Create a command:

```bash
php artisan make:command CleanupOldConversations
```

**File:** `app/Console/Commands/CleanupOldConversations.php`

```php
<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class CleanupOldConversations extends Command
{
    protected $signature = 'conversations:cleanup {--days=30 : Delete conversations older than N days}';
    protected $description = 'Delete old conversations to free up database space';

    public function handle()
    {
        $days = $this->option('days');
        $date = now()->subDays($days);

        $deleted = DB::table('agent_conversations')
            ->where('last_interaction_at', '<', $date)
            ->delete();

        $this->info("Deleted {$deleted} old conversations.");
    }
}
```

**Schedule in `app/Console/Kernel.php`:**
```php
$schedule->command('conversations:cleanup --days=90')
    ->daily();
```

---

## ✅ Implementation Checklist

Use this checklist to verify all steps are complete:

- [ ] Phase 1: Database tables verified/created
- [ ] Phase 2: SalesAssistant structure reviewed (no changes needed)
- [ ] Phase 3: SalesConversationController created with all methods
- [ ] Phase 4: Routes added to web.php
- [ ] Phase 5: Vue component created and integrated
- [ ] Phase 6: Manual API testing successful
- [ ] Phase 6: Database verification shows stored messages
- [ ] Phase 6: Unit tests passing
- [ ] Phase 7: Logging configured
- [ ] Phase 7: Cleanup command scheduled

---

## Troubleshooting Quick Links

| Issue | Solution |
|-------|----------|
| ConversationId is null | Verify RemembersConversations trait is used |
| Messages not in database | Check migrations ran successfully |
| Can't continue conversation | Use `continue()` not `prompt()` after first message |
| Performance degradation | Implement message limiting in Phase 7 |
| User seeing other users' conversations | Verify `where('user_id', $user->id)` in all queries |

---

## Success Indicators 🎉

You've successfully implemented Conversation Context when:

✅ New conversations created with `forUser()` and return conversation ID  
✅ Messages appear in `agent_conversation_messages` database table  
✅ Continuing with `continue()` loads previous messages  
✅ Agent references context from previous messages  
✅ User can view complete conversation history  
✅ Multiple conversations work independently  
✅ Conversation data persists across sessions  
