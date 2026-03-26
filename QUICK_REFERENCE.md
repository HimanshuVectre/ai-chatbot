# Quick Reference Guide - Conversation Context

## 🚀 Quick Start (5 minutes)

### Step 1: Verify Setup
```bash
cd ai_sdk
php artisan artisan vendor:publish --provider="Laravel\Ai\AiServiceProvider"
php artisan migrate
```

### Step 2: Navigate to Chat
Open your browser and go to:
```
http://localhost:8000/sales/chat
```

### Step 3: Start Chatting
- Click "New" to start conversation
- Type your message
- Wait for agent response
- Context automatically maintained

### Step 4: (Optional) Add Navigation Link
Edit `resources/js/Layouts/AuthenticatedLayout.jsx` and add the Sales Assistant link to the navbar.  
See: `ADD_NAVIGATION_LINK.md`

---

## 📝 File Reference

### Created Files
| File | Purpose |
|------|---------|
| `app/Http/Controllers/SalesConversationController.php` | API endpoint controller |
| `resources/js/Pages/SalesChat.vue` | Chat UI component |
| `CONVERSATION_CONTEXT_GUIDE.md` | Complete documentation |
| `CONVERSATION_CONTEXT_IMPLEMENTATION.md` | Implementation details |
| `IMPLEMENTATION_COMPLETE.md` | Summary of what was done |
| `ADD_NAVIGATION_LINK.md` | How to add nav link |
| `verify-setup.sh` | Verification script |
| `QUICK_REFERENCE.md` | This file |

### Modified Files
| File | Changes |
|------|---------|
| `routes/web.php` | Added conversation routes |

### Files NOT Modified (Already Working)
| File | Notes |
|------|-------|
| `app/Ai/Agents/SalesAssistant.php` | Has RemembersConversations trait ✓ |
| `app/Http/Controllers/AgentController.php` | Uses continue() method ✓ |

---

## 🔗 API Endpoints

### Chat Interface
```
GET /sales/chat
```
Opens the Vue chat interface with conversation history

### Conversation API Endpoints

**List all conversations:**
```
GET /api/sales/conversations
Response: Array of conversations with timestamps
```

**Get conversation statistics:**
```
GET /api/sales/conversations/stats
Response: Total count, message count, averages
```

**Get conversation details:**
```
GET /api/sales/conversation/{id}
Response: Metadata about specific conversation
```

**Get conversation history:**
```
GET /api/sales/conversation/{id}/history
Response: Array of messages with timestamps
```

**Export conversation:**
```
GET /api/sales/conversation/{id}/export
Response: JSON file download
```

**Delete conversation:**
```
DELETE /api/sales/conversation/{id}
Response: Success message
```

**Clear all conversations:**
```
DELETE /api/sales/conversations/clear-all
Response: Count of deleted conversations
```

### Existing Endpoint
```
POST /invoke-agent
Body: { message, conversation_id }
Response: { reply, conversation_id, usage }
```

---

## 💻 Example Usage - JavaScript/Vue

### Send Message
```javascript
const response = await fetch('/invoke-agent', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-CSRF-TOKEN': document.querySelector('[name=csrf-token]').content,
  },
  body: JSON.stringify({
    message: 'Show me lighting products',
    conversation_id: 'existing-id-or-null'
  })
});

const data = await response.json();
console.log(data.reply);           // Agent response
console.log(data.conversation_id); // Use for next message
```

### List Conversations
```javascript
const response = await fetch('/api/sales/conversations');
const data = await response.json();
console.log(data.conversations); // Array of conversations
```

### Export Conversation
```javascript
const response = await fetch('/api/sales/conversation/{id}/export');
const data = await response.json();
const json = JSON.stringify(data.export, null, 2);
// Save to file or display
```

---

## 🗄️ Database Queries

### Check Conversations
```bash
php artisan tinker
> DB::table('agent_conversations')->count();
```

### View Messages
```bash
> DB::table('agent_conversation_messages')->where('conversation_id', 'your-id')->get();
```

### Get User's Conversations
```bash
> DB::table('agent_conversations')->where('user_id', 1)->get();
```

### Check Message Count
```bash
> DB::table('agent_conversation_messages')->count();
```

---

## 🔐 Security

All endpoints:
- ✅ Require authentication (`auth` middleware)
- ✅ Verify user ownership (WHERE user_id = auth()->id())
- ✅ Protected against CSRF attacks
- ✅ User cannot access other users' conversations

---

## 🛠️ Troubleshooting

### Issue: "Conversation not found" error
**Solution:** Verify you're using the correct conversation_id from the first message response

### Issue: Messages not showing in sidebar
**Solution:** Make sure migrations ran: `php artisan migrate`

### Issue: Can't send messages
**Solution:** Check that conversation_id is being passed correctly and is not null for subsequent messages

### Issue: Agent not remembering context
**Solution:** Make sure you're using `/invoke-agent` with the `conversation_id` parameter

### Issue: Vue component not loading
**Solution:** Rebuild assets: `npm run dev` or `npm run build`

---

## 📊 How Context Works

### Flow Diagram
```
START NEW CONVERSATION:
  /invoke-agent with message (no conversation_id)
         ↓
  Agent creates new conversation
         ↓
  Returns conversation_id
         ↓
  Store messages in DB

CONTINUE CONVERSATION:
  /invoke-agent with message + conversation_id
         ↓
  Agent loads previous messages
         ↓
  Includes context in prompt
         ↓
  Appends new message to DB
```

### Behind the Scenes
1. **First message** → `forUser($user)->prompt()` → Creates conversation
2. **Next messages** → `continue($conversationId)->prompt()` → Loads history
3. **RemembersConversations trait** → Auto-stores in DB
4. **Conversational interface** → Messages loaded on each turn

---

## 📈 Performance Tips

### Limit Message History (Optional)
For very long conversations, customize SalesAssistant:

```php
// app/Ai/Agents/SalesAssistant.php
public function messages(): iterable
{
    return $this->messages()
        ->limit(30);  // Max 30 messages instead of 50
}
```

### Archive Old Conversations (Optional)
```bash
php artisan schedule:run  # Run in cron
# Or manually:
php artisan tinker
> DB::table('agent_conversations')->where('last_interaction_at', '<', now()->subMonths(3))->delete();
```

---

## 🎯 Next Steps

1. **Access the chat** → `/sales/chat`
2. **Start a conversation** → Click "New"
3. **Send a test message** → "Show me audio products"
4. **Continue conversation** → Ask a follow-up question
5. **Export conversation** → Test export feature
6. **Add navigation link** → See `ADD_NAVIGATION_LINK.md`

---

## 📞 Common Questions

**Q: Where are conversations stored?**  
A: In `agent_conversations` and `agent_conversation_messages` tables

**Q: Can users see each other's conversations?**  
A: No, all queries are filtered by `user_id`. Each user sees only their own.

**Q: What if I clear conversations?**  
A: They're permanently deleted from the database. Use export before deleting.

**Q: Can the agent access conversation history?**  
A: Yes! The `RemembersConversations` trait automatically loads it on `continue()`

**Q: How long are conversations stored?**  
A: Indefinitely, until manually deleted. Implement archival if needed.

**Q: Can I customize the chat UI?**  
A: Yes! Edit `resources/js/Pages/SalesChat.vue` to customize styling and features.

---

## 📚 Documentation Files

1. **CONVERSATION_CONTEXT_GUIDE.md** - Complete conceptual guide ← Start here
2. **CONVERSATION_CONTEXT_IMPLEMENTATION.md** - Step-by-step implementation
3. **IMPLEMENTATION_COMPLETE.md** - Summary of what was implemented
4. **ADD_NAVIGATION_LINK.md** - How to add to navigation menu
5. **QUICK_REFERENCE.md** - This file

---

## ✨ You're All Set!

Everything is ready to go. Your implementation includes:
- ✅ Full conversation persistence
- ✅ Context-aware agent
- ✅ Complete UI component
- ✅ API endpoints for management
- ✅ Export and statistics features
- ✅ Security and user isolation

**Happy chatting! 🚀**
