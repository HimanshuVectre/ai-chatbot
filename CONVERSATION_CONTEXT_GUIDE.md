# Conversation Context Implementation Guide

## Table of Contents
1. [What is Conversation Context?](#what-is-conversation-context)
2. [Why It Matters](#why-it-matters)
3. [Architecture Overview](#architecture-overview)
4. [Prerequisites](#prerequisites)
5. [Implementation Methods](#implementation-methods)
6. [Step-by-Step Implementation](#step-by-step-implementation)
7. [Usage Examples](#usage-examples)
8. [Best Practices](#best-practices)
9. [Troubleshooting](#troubleshooting)

---

## What is Conversation Context?

Conversation Context allows your AI agent to remember and maintain conversation history with users. Instead of treating each prompt as an isolated interaction, the agent can access previous messages to maintain continuity, understand references, and provide context-aware responses.

### Key Components:
- **Conversation ID**: Unique identifier for a conversation thread
- **Message History**: All previous user and assistant messages in the conversation
- **Database Storage**: Laravel automatically stores conversations in `agent_conversations` and `agent_conversation_messages` tables
- **Automatic Context Loading**: Previous messages are automatically included when continuing conversations

---

## Why It Matters

### Benefits:
1. **User Experience**: Users can reference previous messages without repeating context
2. **Context Awareness**: Agent understands multi-turn conversations
3. **Long-term Memory**: Conversations persist across sessions
4. **Reference Resolution**: "That product" or "my last order" resolves from conversation history
5. **Improved Responses**: Agent provides more accurate, personalized responses

### Real-World Example:
```
User: "Show me lighting products under 5000"
[Agent retrieves and displays lighting products]

User: "What about the blue one? Is it in stock?"
[With context: Agent knows "the blue one" refers to a specific product from previous message]
[Without context: Agent would be confused about what product is being referenced]
```

---

## Architecture Overview

### Database Tables (Created by Laravel AI SDK)

#### `agent_conversations` Table
Stores conversation metadata:
```
- id: conversation ID
- user_id: related user
- model: AI model used
- provider: provider name (openai, anthropic, etc.)
- started_at: conversation start time
- last_interaction_at: last message time
- created_at, updated_at
```

#### `agent_conversation_messages` Table
Stores individual messages:
```
- id: message ID
- conversation_id: foreign key to agent_conversations
- role: 'user' or 'assistant'
- content: message text
- created_at, updated_at
```

### Flow Diagram
```
Start New Conversation:
  User → forUser($user) → prompt("message") → Store in DB → Return conversationId

Continue Conversation:
  User + conversationId → continue($conversationId, as: $user) → Load history from DB → 
  Include in context → prompt("new message") → Append to DB history
```

---

## Prerequisites

### 1. Laravel AI SDK Installation
```bash
composer require laravel/ai
```

### 2. Publish Configuration & Migrations
```bash
php artisan vendor:publish --provider="Laravel\Ai\AiServiceProvider"
```

### 3. Run Migrations
```bash
php artisan migrate
```

This creates the required database tables for storing conversations.

### 4. Verify in Your Project
Check that you have:
- `RemembersConversations` trait available from `Laravel\Ai\Concerns`
- `Conversational` interface available from `Laravel\Ai\Contracts`
- Migration files created for conversation tables

---

## Implementation Methods

The Laravel AI SDK provides **two approaches** to implement Conversation Context:

### Method 1: Using RemembersConversations Trait (Recommended - Simple)
✅ **Easiest approach**  
✅ **Automatic message storage and retrieval**  
✅ **No need to implement custom messages() method**  
✅ **Best for most use cases**

### Method 2: Implementing Conversational Interface (Custom - Advanced)
✅ **Full control over message retrieval**  
✅ **Ability to customize message loading logic**  
✅ **Filter or transform messages**  
✅ **Best for complex scenarios**

---

## Step-by-Step Implementation

### Implementation Using RemembersConversations (METHOD 1 - RECOMMENDED)

#### Step 1: Verify Your Agent Structure
Your agent should look like this:

```php
<?php

namespace App\Ai\Agents;

use Laravel\Ai\Concerns\RemembersConversations;
use Stringable;
use App\Models\User;
use Laravel\Ai\Promptable;
use Laravel\Ai\Contracts\Agent;
use Laravel\Ai\Contracts\Conversational;
use Laravel\Ai\Contracts\HasTools;

class SalesAssistant implements Agent, Conversational, HasTools
{
    use Promptable, RemembersConversations;

    public User $user;

    public function __construct(User $user) 
    {
        $this->user = $user;
    }

    public function instructions(): Stringable|string
    {
        return 'Your system instructions...';
    }

    public function tools(): iterable
    {
        return [
            // Your tools
        ];
    }
}
```

**Key Requirements:**
- ✅ Implement `Agent` interface
- ✅ Implement `Conversational` interface
- ✅ Use `RemembersConversations` trait
- ✅ Accept `User` in constructor
- ✅ Accept `HasTools` interface (if using tools)

#### Step 2: Creating a New Conversation
Use the `forUser()` method before prompting:

```php
$agent = new SalesAssistant($user);

$response = $agent
    ->forUser($user)
    ->prompt('Show me lighting products under 5000');

// Get the conversation ID to save for later
$conversationId = $response->conversationId;
// Store this in your database to reference later
```

**What happens:**
1. A new conversation is created
2. User message is stored in database
3. Agent processes the message
4. Agent response is stored in database
5. Conversation ID is returned

#### Step 3: Continuing an Existing Conversation
Use the `continue()` method with a conversation ID:

```php
$agent = new SalesAssistant($user);

$response = $agent
    ->continue($conversationId, as: $user)
    ->prompt('What about the blue one? Is it in stock?');

// Previous messages are automatically loaded and included in context
```

**What happens:**
1. Conversation is retrieved from database
2. All previous messages are loaded (limited by default to last 50)
3. Messages are included in the prompt context
4. New user message is processed
5. New response is stored in database

---

### Implementation Using Custom Messages Method (METHOD 2 - ADVANCED)

If you need more control over message retrieval, implement the `messages()` method:

#### Step 1: Add Messages Method to Your Agent
```php
<?php

namespace App\Ai\Agents;

use Laravel\Ai\Concerns\RemembersConversations;
use Laravel\Ai\Messages\Message;
use App\Models\History; // Example: your custom history model
use Laravel\Ai\Promptable;
use Laravel\Ai\Contracts\Agent;
use Laravel\Ai\Contracts\Conversational;

class SalesAssistant implements Agent, Conversational
{
    use Promptable, RemembersConversations;

    /**
     * Get the list of messages comprising the conversation so far.
     */
    public function messages(): iterable
    {
        // Option 1: Using RemembersConversations built-in behavior
        // The trait handles this automatically if this method isn't implemented
        
        // Option 2: Custom message retrieval
        return History::where('user_id', $this->user->id)
            ->latest()
            ->limit(50)
            ->get()
            ->reverse()
            ->map(function ($message) {
                return new Message(
                    $message->role,           // 'user' or 'assistant'
                    $message->content        // message text
                );
            })
            ->all();
    }
}
```

**Key Points:**
- Messages must be returned in chronological order (oldest first)
- Use `Message` class from `Laravel\Ai\Messages`
- The `role` can be `'user'` or `'assistant'`
- Limit messages to improve performance (typically 50 is good)
- Use `.reverse()` to ensure chronological order from latest() query

---

## Usage Examples

### Complete Example: Multi-Turn E-commerce Conversation

#### In Your Controller or Handler:
```php
<?php

namespace App\Http\Controllers;

use App\Ai\Agents\SalesAssistant;
use App\Models\User;
use Illuminate\Http\Request;

class SalesController extends Controller
{
    /**
     * Start a new conversation
     */
    public function startConversation(Request $request)
    {
        $user = auth()->user();
        
        $agent = new SalesAssistant($user);
        
        // Create a new conversation
        $response = $agent
            ->forUser($user)
            ->prompt($request->input('message'));
        
        // Store the conversation ID
        $conversationId = $response->conversationId;
        
        // Save to session or database
        session(['current_conversation' => $conversationId]);
        
        return response()->json([
            'message' => $response->text,
            'conversation_id' => $conversationId,
        ]);
    }

    /**
     * Continue an existing conversation
     */
    public function continueConversation(Request $request, string $conversationId)
    {
        $user = auth()->user();
        
        $agent = new SalesAssistant($user);
        
        // Continue the conversation
        $response = $agent
            ->continue($conversationId, as: $user)
            ->prompt($request->input('message'));
        
        // Previous messages are automatically loaded and included
        
        return response()->json([
            'message' => $response->text,
            'conversation_id' => $conversationId,
        ]);
    }

    /**
     * Get conversation history
     */
    public function getConversationHistory(string $conversationId)
    {
        // Query the agent_conversation_messages table directly
        $messages = \DB::table('agent_conversation_messages')
            ->where('conversation_id', $conversationId)
            ->orderBy('created_at')
            ->get();
        
        return response()->json($messages);
    }
}
```

#### In Your Routes:
```php
// routes/web.php

Route::middleware('auth')->group(function () {
    Route::post('/sales/conversation/start', 
        [SalesController::class, 'startConversation']);
    Route::post('/sales/conversation/{conversationId}', 
        [SalesController::class, 'continueConversation']);
    Route::get('/sales/conversation/{conversationId}/history', 
        [SalesController::class, 'getConversationHistory']);
});
```

#### Frontend Example - JavaScript/Vue:
```javascript
// Start a new conversation
const startConversation = async (message) => {
    const response = await fetch('/sales/conversation/start', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('[name=csrf-token]').content,
        },
        body: JSON.stringify({ message }),
    });
    
    const data = await response.json();
    conversationId = data.conversation_id;  // Save for future messages
    return data.message;
};

// Continue the conversation
const sendMessage = async (message) => {
    const response = await fetch(`/sales/conversation/${conversationId}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('[name=csrf-token]').content,
        },
        body: JSON.stringify({ message }),
    });
    
    const data = await response.json();
    return data.message;
};
```

---

## Best Practices

### 1. Always Verify User Identity
```php
// ✅ CORRECT
$response = $agent
    ->continue($conversationId, as: $user)  // Verify user
    ->prompt($message);

// ❌ WRONG
$response = $agent
    ->continue($conversationId)  // No user verification
    ->prompt($message);
```

### 2. Store Conversation IDs Properly
```php
// Database approach (recommended)
ConversationLog::create([
    'user_id' => $user->id,
    'conversation_id' => $response->conversationId,
    'topic' => 'product_inquiry',
    'started_at' => now(),
]);

// Or session (for temporary conversations)
session(['active_conversation' => $response->conversationId]);
```

### 3. Limit Message Context for Performance
```php
// The RemembersConversations trait automatically limits to 50 messages
// For custom implementation:
$messages->limit(50)  // Don't load unlimited messages
```

### 4. Archive Old Conversations
```php
// Clean up old conversations periodically
\DB::table('agent_conversations')
    ->where('last_interaction_at', '<', now()->subMonths(6))
    ->delete();
```

### 5. Include Conversation Context in Instructions
```php
// Remind the agent about context awareness
public function instructions(): Stringable|string
{
    return 'You are a sales assistant. Reference previous messages '
        . 'when customers use phrases like "that product", "the one we discussed", etc. '
        . 'Maintain consistency across the conversation...';
}
```

### 6. Handle Tool Calls Within Conversation Context
```php
// Tools can reference conversation context
// Example: User says "compare that with the other one"
// Your tool implementation can access message history via $this->messages()
```

---

## Troubleshooting

### Issue 1: Migrations Not Running
**Problem:** Database tables for `agent_conversations` not found

**Solution:**
```bash
# Re-run migrations
php artisan vendor:publish --provider="Laravel\Ai\AiServiceProvider" --force
php artisan migrate
```

### Issue 2: Conversation ID Not Returned
**Problem:** `$response->conversationId` is null

**Possible Causes:**
1. RemembersConversations trait not used
2. Conversational interface not implemented
3. didn't call `forUser()` before `prompt()`

**Solution:**
```php
// Verify your agent:
class SalesAssistant implements Agent, Conversational {
    use Promptable, RemembersConversations;  // ✅ Both required
}

// Use forUser() before prompt()
$response = $agent->forUser($user)->prompt($message);  // ✅ Correct
```

### Issue 3: Messages Not Being Stored
**Problem:** No messages appear in database after prompting

**Check:**
1. Verify migrations ran: `php artisan migrate:status`
2. Check database credentials in `.env`
3. Verify `RemembersConversations` trait is used
4. Check for errors in storage process:

```php
try {
    $response = $agent->forUser($user)->prompt($message);
} catch (\Exception $e) {
    \Log::error('Agent error: ' . $e->getMessage());
}
```

### Issue 4: Conversation Context Not Included
**Problem:** Agent seems to forget previous messages

**Solution:**
```php
// Verify you're using continue() with the correct conversationId
//❌ WRONG
$response = $agent->forUser($user)->prompt($message);  // Creates NEW conversation

// ✅ CORRECT
$response = $agent
    ->continue($conversationId, as: $user)
    ->prompt($message);  // Continues existing conversation
```

### Issue 5: Performance Issues with Long Conversations
**Problem:** Agent is slow when processing messages in long conversations

**Solution:**
```php
// Implement custom message limiting
public function messages(): iterable
{
    return History::where('user_id', $this->user->id)
        ->latest()
        ->limit(20)  // ← Reduce from 50 to 20
        ->get()
        ->reverse()
        ->map(fn($m) => new Message($m->role, $m->content))
        ->all();
}
```

---

## Database Schema Reference

### Querying Conversation Data

```php
// Get all conversations for a user
$conversations = \DB::table('agent_conversations')
    ->where('user_id', $user->id)
    ->orderBy('last_interaction_at', 'desc')
    ->get();

// Get messages in a specific conversation
$messages = \DB::table('agent_conversation_messages')
    ->where('conversation_id', $conversationId)
    ->orderBy('created_at')
    ->get();

// Count messages in conversation
$count = \DB::table('agent_conversation_messages')
    ->where('conversation_id', $conversationId)
    ->count();

// Get recent conversations with message count
$conversations = \DB::table('agent_conversations as c')
    ->leftJoin(
        'agent_conversation_messages as m',
        'c.id',
        '=',
        'm.conversation_id'
    )
    ->where('c.user_id', $user->id)
    ->select(
        'c.id',
        'c.started_at',
        'c.last_interaction_at',
        \DB::raw('COUNT(m.id) as message_count')
    )
    ->groupBy('c.id')
    ->orderBy('c.last_interaction_at', 'desc')
    ->get();
```

---

## Next Steps

1. **Verify your agent** implements both `Agent` and `Conversational` interfaces
2. **Use RemembersConversations trait** for automatic message storage
3. **Test with forUser()** to create new conversations
4. **Test with continue()** to verify conversation loading
5. **Monitor database** to see messages being stored
6. **Implement UI** to display conversation history
7. **Consider archival strategy** for old conversations

---

## Related Documentation

- [Laravel AI SDK - Conversation Context](https://laravel.com/docs/13.x/ai-sdk#conversation-context)
- [Laravel AI SDK - Agents](https://laravel.com/docs/13.x/ai-sdk#agents)
- [Laravel AI SDK - Installation](https://laravel.com/docs/13.x/ai-sdk#installation)

---

## Summary Checklist

Use this checklist to verify your Conversation Context implementation:

- [ ] RemembersConversations trait is imported and used
- [ ] Conversational interface is implemented
- [ ] Database migrations have been run
- [ ] Agent constructor accepts User parameter
- [ ] forUser() is called before prompt() for new conversations
- [ ] continue() is called with conversationId for existing conversations
- [ ] Conversation IDs are stored somewhere (database/session)
- [ ] Messages appear in agent_conversation_messages table
- [ ] Agent references previous context in responses
- [ ] User history is retrieved correctly when continuing conversations
