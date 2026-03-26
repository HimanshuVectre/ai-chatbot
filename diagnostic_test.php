<?php

require 'vendor/autoload.php';

$app = require 'bootstrap/app.php';

$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\User;
use App\Models\Order;
use App\Ai\Tools\ListOrderToolForUser;
use Laravel\Ai\Tools\Request;

echo "========== DEEP DIAGNOSTIC TEST ==========\n\n";

$user = User::find(1);

if (!$user) {
    echo "❌ User 1 not found.\n";
    exit(1);
}

// First, check what orders actually exist in database
echo "STEP 1: Database Verification\n";
echo "──────────────────────────────\n";

$allOrders = Order::where('user_id', $user->id)->get();
echo "Total orders for user ID 1: " . $allOrders->count() . "\n";
echo "Invoice IDs in database:\n";
foreach ($allOrders as $order) {
    echo "  - {$order->invoice_id} (ID: {$order->id}, Product: {$order->product->title})\n";
}
echo "\n";

// Check if INV-0009 exists
$checkInv = Order::where('user_id', $user->id)->where('invoice_id', 'INV-0009')->first();
if ($checkInv) {
    echo "✅ INV-0009 EXISTS in database\n";
} else {
    echo "❌ INV-0009 DOES NOT EXIST in database\n";
    echo "   Available invoices: " . $allOrders->pluck('invoice_id')->implode(', ') . "\n";
}
echo "\n";

// Now test the tool directly
echo "STEP 2: Tool Direct Test\n";
echo "──────────────────────────\n";

$tool = new ListOrderToolForUser($user);

// Test 1: Without parameters
echo "TEST 2a: No parameters (should return 20 or less)\n";
$result = $tool->handle(new Request([]));
$orders = json_decode($result, true);
echo "  Returned: " . count($orders) . " orders\n";
if (count($orders) > 0) {
    echo "  First order: {$orders[0]['invoice_id']}\n";
    echo "  Last order: {$orders[count($orders)-1]['invoice_id']}\n";
}
echo "\n";

// Test 2: With invoice_id INV-1006
echo "TEST 2b: With invoice_id='INV-1006'\n";
$result = $tool->handle(new Request(['invoice_id' => 'INV-1006']));
$orders = json_decode($result, true);
echo "  Returned: " . count($orders) . " orders\n";
foreach ($orders as $order) {
    echo "  - {$order['invoice_id']}\n";
}
echo "\n";

// Test 3: With invoice_id INV-0009 (might not exist)
echo "TEST 2c: With invoice_id='INV-0009'\n";
$result = $tool->handle(new Request(['invoice_id' => 'INV-0009']));
$orders = json_decode($result, true);
echo "  Returned: " . count($orders) . " orders\n";
foreach ($orders as $order) {
    echo "  - {$order['invoice_id']}\n";
}
echo "\n";

// Test 4: With limit=2
echo "TEST 2d: With limit=2\n";
$result = $tool->handle(new Request(['limit' => 2]));
$orders = json_decode($result, true);
echo "  Returned: " . count($orders) . " orders\n";
foreach ($orders as $order) {
    echo "  - {$order['invoice_id']}\n";
}
echo "\n";

// Test 5: With limit=1
echo "TEST 2e: With limit=1\n";
$result = $tool->handle(new Request(['limit' => 1]));
$orders = json_decode($result, true);
echo "  Returned: " . count($orders) . " orders\n";
foreach ($orders as $order) {
    echo "  - {$order['invoice_id']}\n";
}
echo "\n";

echo "========== DIAGNOSIS COMPLETE ==========\n";
echo "\nIF invoice_id filtering is NOT working:\n";
echo "  1. Check if the invoice ID exists in database\n";
echo "  2. Verify the tool's Query WHERE clause\n";
echo "  3. Check if agent is actually passing the parameter\n\n";

echo "IF limit filtering is NOT working:\n";
echo "  1. Check the limit value being passed\n";
echo "  2. Verify the LIMIT part of the query\n";
echo "  3. Check if agent is actually passing the parameter\n";
