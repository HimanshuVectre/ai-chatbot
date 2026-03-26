#!/bin/bash

echo "🔍 Conversation Context Implementation Verification"
echo "======================================================"
echo ""

cd ai_sdk

echo "✓ Checking Laravel installation..."
php artisan --version
echo ""

echo "✓ Checking AI SDK installation..."
composer show | grep laravel/ai
echo ""

echo "✓ Checking database migrations status..."
php artisan migrate:status
echo ""

echo "✓ Checking if conversation tables exist..."
php artisan tinker --execute="
echo 'Checking agent_conversations table... ';
try {
    DB::table('agent_conversations')->limit(1)->get();
    echo 'EXISTS ✓' . PHP_EOL;
} catch (Exception \$e) {
    echo 'NOT FOUND - Run migrations!' . PHP_EOL;
}

echo 'Checking agent_conversation_messages table... ';
try {
    DB::table('agent_conversation_messages')->limit(1)->get();
    echo 'EXISTS ✓' . PHP_EOL;
} catch (Exception \$e) {
    echo 'NOT FOUND - Run migrations!' . PHP_EOL;
}
"
echo ""

echo "✓ Checking controller files..."
if [ -f "app/Http/Controllers/SalesConversationController.php" ]; then
    echo "✓ SalesConversationController.php exists"
else
    echo "✗ SalesConversationController.php NOT FOUND"
fi

if [ -f "resources/js/Pages/SalesChat.vue" ]; then
    echo "✓ SalesChat.vue component exists"
else
    echo "✗ SalesChat.vue NOT FOUND"
fi
echo ""

echo "✓ Summary:"
echo "- Documentation: CONVERSATION_CONTEXT_GUIDE.md"
echo "- Implementation Guide: CONVERSATION_CONTEXT_IMPLEMENTATION.md"
echo "- Implementation Status: IMPLEMENTATION_COMPLETE.md"
echo ""

echo "✓ Access the chat interface at: http://localhost:8000/sales/chat"
echo ""

echo "Done! ✨"
