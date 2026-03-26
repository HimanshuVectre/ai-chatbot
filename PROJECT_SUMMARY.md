## 1. Project Overview
- Laravel + Inertia React e-commerce assistant project with an authenticated chatbot interface.
- Purpose: allow users to query products, categories, and their own orders through an AI-powered chat workflow.
- Key features:
  - Auth-protected chatbot page (`/chatbot`) and invoke endpoint (`/invoke-agent`).
  - AI agent (`SalesAssistant`) with tool-based data access.
  - Conversation tracking with `agent_conversations` and `agent_conversation_messages`.
  - Profanity detection with warning responses and red warning UI.
  - Resilient fallback logic when AI provider fails (rate limit/transport).

## 2. Architecture & Flow
- High-level design:
  - Frontend: Inertia React page `resources/js/Pages/Chatbot.jsx`.
  - Backend: `AgentController@callAgent` as orchestration layer.
  - AI Layer: Laravel AI SDK agent (`SalesAssistant`) + tools (`ListProductTool`, `ListCategoryTool`, `ListOrderToolForUser`).
  - Data Layer: MySQL tables for users, products, categories, orders, plus AI conversation tables.

- Workflow (input -> processing -> output):
  1. User submits chat prompt from chatbot UI.
  2. Frontend sends `POST /invoke-agent` with `message` and optional `conversation_id`.
  3. Backend validates payload and checks abusive language.
  4. If abusive: warning reply is returned and stored in conversation tables.
  5. If clean: agent is invoked with `forUser()` (new) or `continue()` (existing conversation).
  6. On AI failure: fallback parser answers using DB queries (products/categories/orders).
  7. Response JSON returns `reply`, `conversation_id`, and status flags (`warning`/`fallback`).
  8. Frontend renders assistant reply; warning messages are highlighted red.

- Data flow:
  - UI -> `invoke-agent` -> `AgentController` -> AI SDK + tools or fallback query logic -> DB read/write -> JSON response -> UI render.
  - Conversation data is persisted for warning/fallback paths and via SDK middleware for successful AI calls.

## 3. AI SDK Usage
- SDK used: Laravel AI SDK (`laravel/ai`) with provider config set to OpenAI by default.
- Why used:
  - Native Laravel integration for prompting, tools, conversation memory, and provider abstraction.
- Integration points:
  - Agent class: `app/Ai/Agents/SalesAssistant.php`.
  - Tool classes for domain data retrieval:
    - `app/Ai/Tools/ListProductTool.php`
    - `app/Ai/Tools/ListCategoryTool.php`
    - `app/Ai/Tools/ListOrderToolForUser.php`
  - Controller invocation:
    - `->forUser($user)->prompt($message)`
    - `->continue($conversationId, as: $user)->prompt($message)`
- Key use cases implemented:
  - Product listing with category and price filters.
  - Category listing/search.
  - User-specific order retrieval.
  - Contextual follow-up handling (e.g., recent order category mapping).

## 4. Function-Level Breakdown
### AgentController::callAgent
- Purpose:
  - Main request handler for chatbot interactions.
- Inputs:
  - `message` (string), `conversation_id` (nullable string), authenticated user.
- Outputs:
  - JSON with `reply`, `conversation_id`, `usage`, optional `warning`/`fallback`.
- Internal logic:
  - Validates input -> checks abuse -> invokes agent (new/continue) -> handles exceptions with fallback -> persists warning/fallback chat messages.

### AgentController::fallbackReply
- Purpose:
  - Provides deterministic DB-backed replies when AI is unavailable.
- Inputs:
  - `message`, `userId`.
- Outputs:
  - Text reply string.
- Internal logic:
  - Parses intent for products/categories/orders and advanced product constraints (price bounds, range, stock, count, sorting, limits).

### AgentController::containsAbusiveLanguage
- Purpose:
  - Detect abusive words, including censored variants.
- Inputs:
  - Raw user message string.
- Outputs:
  - Boolean (`true` if abusive).
- Internal logic:
  - Normalizes text/leetspeak and checks regex patterns for plain and obfuscated abusive terms (e.g., `f@#k`, `m@darch0d`, `ch***ya`).

### AgentController::persistConversationMessages / resolveConversationId
- Purpose:
  - Ensure warning/fallback interactions are persisted in conversation tables.
- Inputs:
  - User id, prompt/reply text, optional conversation id.
- Outputs:
  - Resolved conversation id.
- Internal logic:
  - Reuses or creates conversation -> inserts user + assistant message rows -> updates conversation timestamp.

### SalesAssistant::instructions / tools
- Purpose:
  - Define system behavior and available tools for AI agent.
- Inputs:
  - User context via constructor.
- Outputs:
  - Instruction string + tool list.
- Internal logic:
  - Enforces concise, data-backed responses and contextual follow-up handling.

### ListProductTool::handle
- Purpose:
  - Fetch product data for AI with optional category and price filters.
- Inputs:
  - `category`, `min_price`, `max_price`, `limit`.
- Outputs:
  - JSON-encoded product list.
- Internal logic:
  - Applies conditional query filters and returns product records with category relationship.

### ListCategoryTool::handle
- Purpose:
  - Fetch categories for AI.
- Inputs:
  - `search`, `limit`.
- Outputs:
  - JSON-encoded category list.
- Internal logic:
  - Optional search + ordered result set.

### ListOrderToolForUser::handle
- Purpose:
  - Fetch authenticated user orders for AI.
- Inputs:
  - `invoice_id`, `limit`.
- Outputs:
  - JSON-encoded order list.
- Internal logic:
  - Filters by user and invoice, includes product and product categories for context-aware follow-ups.

### Chatbot UI (resources/js/Pages/Chatbot.jsx)
- Purpose:
  - Provide chat interface and render stateful conversations.
- Inputs:
  - User text input and server response payload.
- Outputs:
  - Message list rendering in UI.
- Internal logic:
  - Posts to `invoke-agent`, maintains `conversation_id`, marks warning messages red for both user prompt and assistant warning reply.

## 5. Example Flow (Optional but preferred)
- Example query:
  - User: `List of products under price of 3000`
- End-to-end behavior:
  1. UI sends prompt to `POST /invoke-agent`.
  2. Controller validates and passes abuse check.
  3. Agent tries provider-backed response; if unavailable, fallback parser extracts `maxPrice = 3000`.
  4. DB query returns products where `price <= 3000`.
  5. Response returned, e.g.:
```json
{
  "reply": "Available products under Rs 3000: Ergonomic Mouse (Rs 1299.00), USB-C Hub 8-in-1 (Rs 2999.00), Wireless Keyboard (Rs 2499.00).",
  "conversation_id": "...",
  "usage": [],
  "fallback": true
}
```

## 6. Formatting Rules
- Concise but complete coverage of backend, AI, data, and UI behavior.
- Structured with clear Markdown headings and bullet points.
- Code block included only for concrete API response example.
- No extra content outside required documentation structure.
