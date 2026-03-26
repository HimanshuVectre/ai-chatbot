<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $user = User::query()->firstOrCreate(
            ['email' => 'test@example.com'],
            [
                'name' => 'Test User',
                'password' => 'password',
            ]
        );

        $secondUser = User::query()->firstOrCreate(
            ['email' => 'buyer@example.com'],
            [
                'name' => 'Buyer User',
                'password' => 'password',
            ]
        );

        // Create 15 categories
        $categories = collect([
            'Electronics',
            'Home Office',
            'Accessories',
            'Fitness',
            'Audio',
            'Cables & Adapters',
            'Monitors & Displays',
            'Storage & Organization',
            'Mobile Devices',
            'Smart Home',
            'Gaming Gear',
            'Ergonomic Furniture',
            'Lighting',
            'Power Solutions',
            'Computer Components',
        ])->mapWithKeys(function (string $title) {
            $category = Category::query()->firstOrCreate(['title' => $title]);
            return [$title => $category];
        });

        // Create 50 products
        $products = [
            // Electronics & Cables
            ['title' => 'Wireless Keyboard', 'price' => 2499.00, 'stock' => 40, 'description' => 'Compact mechanical keyboard with backlight.', 'categories' => ['Electronics', 'Home Office', 'Accessories']],
            ['title' => 'Ergonomic Mouse', 'price' => 1299.00, 'stock' => 55, 'description' => 'Vertical ergonomic mouse for long work sessions.', 'categories' => ['Electronics', 'Home Office', 'Accessories']],
            ['title' => 'Noise Cancelling Headphones', 'price' => 7999.00, 'stock' => 24, 'description' => 'Over-ear bluetooth headphones with active noise cancellation.', 'categories' => ['Electronics', 'Audio']],
            ['title' => 'USB-C Hub 8-in-1', 'price' => 2999.00, 'stock' => 65, 'description' => 'Multiport USB-C hub with HDMI and card reader.', 'categories' => ['Electronics', 'Accessories', 'Cables & Adapters']],
            ['title' => 'HDMI 2.1 Cable 5M', 'price' => 899.00, 'stock' => 120, 'description' => '5-meter HDMI 2.1 cable for 4K 120Hz video.', 'categories' => ['Cables & Adapters', 'Accessories']],
            ['title' => 'USB 3.2 Gen 2 Hub', 'price' => 1599.00, 'stock' => 45, 'description' => 'Fast USB hub with multiple ports.', 'categories' => ['Cables & Adapters', 'Accessories', 'Electronics']],
            ['title' => 'Thunderbolt 3 Dock', 'price' => 6499.00, 'stock' => 18, 'description' => 'Universal docking station with full connectivity.', 'categories' => ['Cables & Adapters', 'Home Office']],
            ['title' => 'DisplayPort 1.4 Cable', 'price' => 1199.00, 'stock' => 80, 'description' => 'Premium DisplayPort cable for high-res monitors.', 'categories' => ['Cables & Adapters']],

            // Home Office
            ['title' => 'Adjustable Dumbbell Set', 'price' => 10499.00, 'stock' => 12, 'description' => 'Pair of space-saving adjustable dumbbells.', 'categories' => ['Fitness']],
            ['title' => 'Standing Desk Converter', 'price' => 6999.00, 'stock' => 18, 'description' => 'Desk riser with keyboard tray for sit-stand workflow.', 'categories' => ['Home Office', 'Ergonomic Furniture']],
            ['title' => 'Desk Lamp LED', 'price' => 1899.00, 'stock' => 35, 'description' => 'Dimmable LED desk lamp with USB port.', 'categories' => ['Home Office', 'Lighting']],
            ['title' => 'Monitor Stand Riser', 'price' => 1299.00, 'stock' => 50, 'description' => 'Adjustable monitor stand with storage.', 'categories' => ['Home Office', 'Storage & Organization']],
            ['title' => 'Ergonomic Chair Cushion', 'price' => 2199.00, 'stock' => 28, 'description' => 'Memory foam seat cushion for better posture.', 'categories' => ['Ergonomic Furniture', 'Home Office']],
            ['title' => 'Desk Organizer Set', 'price' => 899.00, 'stock' => 75, 'description' => '5-piece wood desk organizer set.', 'categories' => ['Storage & Organization', 'Home Office']],

            // Monitors & Displays
            ['title' => '4K Monitor 27in', 'price' => 24999.00, 'stock' => 8, 'description' => '27-inch 4K UHD monitor with color accuracy.', 'categories' => ['Monitors & Displays', 'Electronics']],
            ['title' => 'Ultrawide Curved Monitor', 'price' => 19999.00, 'stock' => 10, 'description' => '34-inch ultrawide curved gaming monitor.', 'categories' => ['Monitors & Displays', 'Gaming Gear']],
            ['title' => 'Portable Display 15.6in', 'price' => 8999.00, 'stock' => 22, 'description' => 'USB-C portable display for mobile professionals.', 'categories' => ['Monitors & Displays', 'Mobile Devices']],
            ['title' => 'Monitor Arm Dual', 'price' => 3499.00, 'stock' => 16, 'description' => 'Dual monitor articulating arm mount.', 'categories' => ['Monitors & Displays', 'Home Office']],

            // Audio Equipment
            ['title' => 'Wireless Earbuds Pro', 'price' => 3999.00, 'stock' => 42, 'description' => 'Premium wireless earbuds with ANC and case.', 'categories' => ['Audio', 'Electronics']],
            ['title' => 'Bluetooth Speaker', 'price' => 2499.00, 'stock' => 58, 'description' => 'Portable waterproof Bluetooth speaker.', 'categories' => ['Audio']],
            ['title' => 'USB Microphone', 'price' => 4499.00, 'stock' => 34, 'description' => 'Professional USB condenser microphone for streaming.', 'categories' => ['Audio', 'Electronics']],
            ['title' => 'Audio Interface 2-in-2-out', 'price' => 5999.00, 'stock' => 19, 'description' => 'Compact USB audio interface for music production.', 'categories' => ['Audio']],

            // Fitness
            ['title' => 'Yoga Mat Premium', 'price' => 1699.00, 'stock' => 66, 'description' => 'Non-slip premium TPE yoga mat.', 'categories' => ['Fitness']],
            ['title' => 'Resistance Bands Set', 'price' => 1299.00, 'stock' => 89, 'description' => '5-piece resistance loop band set.', 'categories' => ['Fitness', 'Accessories']],
            ['title' => 'Jump Rope Speed', 'price' => 899.00, 'stock' => 72, 'description' => 'Steel wire speed jump rope.', 'categories' => ['Fitness']],
            ['title' => 'Foam Roller', 'price' => 1499.00, 'stock' => 43, 'description' => 'High-density foam roller for muscle recovery.', 'categories' => ['Fitness']],

            // Mobile & Smart Devices
            ['title' => 'Phone Stand Metal', 'price' => 599.00, 'stock' => 95, 'description' => 'Adjustable aluminum phone stand.', 'categories' => ['Mobile Devices', 'Accessories']],
            ['title' => 'Wireless Charging Pad', 'price' => 1299.00, 'stock' => 51, 'description' => 'Fast wireless charging pad for all Qi devices.', 'categories' => ['Mobile Devices', 'Power Solutions']],
            ['title' => 'Smart LED Bulb', 'price' => 899.00, 'stock' => 63, 'description' => 'WiFi-controlled RGB smart bulb.', 'categories' => ['Smart Home', 'Lighting']],
            ['title' => 'Smart Power Strip', 'price' => 3499.00, 'stock' => 27, 'description' => '4-outlet smart power strip with timer control.', 'categories' => ['Smart Home', 'Power Solutions']],

            // Gaming Gear
            ['title' => 'Gaming Mouse RGB', 'price' => 2999.00, 'stock' => 38, 'description' => 'High-precision gaming mouse with RGB lighting.', 'categories' => ['Gaming Gear', 'Electronics']],
            ['title' => 'Mechanical Keyboard RGB', 'price' => 4499.00, 'stock' => 25, 'description' => 'Cherry MX mechanical gaming keyboard.', 'categories' => ['Gaming Gear', 'Electronics']],
            ['title' => 'Gaming Headset', 'price' => 3799.00, 'stock' => 31, 'description' => '7.1 surround sound gaming headset.', 'categories' => ['Gaming Gear', 'Audio']],
            ['title' => 'Mouse Pad Large', 'price' => 1599.00, 'stock' => 67, 'description' => 'XXL gaming mouse pad with rubber base.', 'categories' => ['Gaming Gear', 'Accessories']],

            // Power Solutions
            ['title' => 'Power Bank 30000mAh', 'price' => 2899.00, 'stock' => 44, 'description' => 'Large capacity portable charger with dual USB-C.', 'categories' => ['Power Solutions', 'Mobile Devices']],
            ['title' => 'USB-C Fast Charger', 'price' => 1199.00, 'stock' => 76, 'description' => '65W USB-C fast charger for laptop and phone.', 'categories' => ['Power Solutions', 'Cables & Adapters']],
            ['title' => 'Solar Power Bank', 'price' => 2199.00, 'stock' => 23, 'description' => 'Solar-powered portable charger.', 'categories' => ['Power Solutions']],

            // Storage & Organization
            ['title' => 'SSD 1TB NVMe', 'price' => 9999.00, 'stock' => 15, 'description' => '1TB NVMe SSD for fast storage.', 'categories' => ['Storage & Organization', 'Computer Components']],
            ['title' => 'External HDD 4TB', 'price' => 5999.00, 'stock' => 21, 'description' => '4TB portable external hard drive.', 'categories' => ['Storage & Organization']],
            ['title' => 'Organizer Box Set', 'price' => 1499.00, 'stock' => 82, 'description' => '6-piece plastic storage box set.', 'categories' => ['Storage & Organization']],

            // Lighting
            ['title' => 'Ring Light 10in', 'price' => 2299.00, 'stock' => 39, 'description' => '10-inch ring light with phone holder.', 'categories' => ['Lighting']],
            ['title' => 'Panel Light RGB', 'price' => 3999.00, 'stock' => 17, 'description' => 'Modular RGB panel light system.', 'categories' => ['Lighting', 'Smart Home']],

            // Computer Components
            ['title' => 'RAM 32GB DDR5', 'price' => 8999.00, 'stock' => 12, 'description' => '32GB DDR5 memory kit.', 'categories' => ['Computer Components']],
            ['title' => 'CPU Cooler Tower', 'price' => 4199.00, 'stock' => 28, 'description' => 'High-performance air CPU cooler.', 'categories' => ['Computer Components']],

            // Additional Products
            ['title' => 'Graphics Card RTX 4070', 'price' => 34999.00, 'stock' => 5, 'description' => 'High-end 12GB graphics card for gaming and 3D work.', 'categories' => ['Computer Components']],
            ['title' => 'Mechanical Keyboard Gateron', 'price' => 5899.00, 'stock' => 14, 'description' => 'Gaming keyboard with Gateron switches.', 'categories' => ['Gaming Gear', 'Electronics']],
            ['title' => 'Desk Fan Portable', 'price' => 799.00, 'stock' => 88, 'description' => 'Compact portable USB desk fan.', 'categories' => ['Accessories', 'Home Office']],
            ['title' => 'Cable Management Box', 'price' => 1099.00, 'stock' => 97, 'description' => 'Plastic cable organizer box for desk.', 'categories' => ['Storage & Organization']],
            ['title' => 'Surge Protector 6-Outlet', 'price' => 1599.00, 'stock' => 34, 'description' => '6-outlet surge protector with USB ports.', 'categories' => ['Power Solutions', 'Accessories']],
            ['title' => 'Monitor Screen Protector', 'price' => 499.00, 'stock' => 123, 'description' => 'Anti-glare screen protector for monitors.', 'categories' => ['Accessories', 'Monitors & Displays']],
        ];

        $createdProducts = collect($products)->mapWithKeys(function (array $data) use ($categories) {
            $product = Product::query()->updateOrCreate(
                ['title' => $data['title']],
                [
                    'price' => $data['price'],
                    'stock' => $data['stock'],
                    'description' => $data['description'],
                ]
            );

            $categoryIds = collect($data['categories'])
                ->map(fn (string $title) => $categories[$title]->id)
                ->all();

            $product->categories()->sync($categoryIds);

            return [$data['title'] => $product];
        });

        // Create orders for user ID 1 (test@example.com)
        $userOrders = [
            ['invoice_id' => 'INV-1001', 'product' => 'Wireless Keyboard', 'qty' => 1],
            ['invoice_id' => 'INV-1002', 'product' => 'Noise Cancelling Headphones', 'qty' => 1],
            ['invoice_id' => 'INV-1003', 'product' => 'USB-C Hub 8-in-1', 'qty' => 2],
            ['invoice_id' => 'INV-1004', 'product' => 'Standing Desk Converter', 'qty' => 1],
            ['invoice_id' => 'INV-1005', 'product' => 'Monitor Stand Riser', 'qty' => 1],
            ['invoice_id' => 'INV-1006', 'product' => '4K Monitor 27in', 'qty' => 1],
            ['invoice_id' => 'INV-1007', 'product' => 'Wireless Earbuds Pro', 'qty' => 2],
            ['invoice_id' => 'INV-1008', 'product' => 'USB Microphone', 'qty' => 1],
            ['invoice_id' => 'INV-1009', 'product' => 'Gaming Mouse RGB', 'qty' => 1],
            ['invoice_id' => 'INV-1010', 'product' => 'Mechanical Keyboard RGB', 'qty' => 1],
            ['invoice_id' => 'INV-1011', 'product' => 'Power Bank 30000mAh', 'qty' => 1],
            ['invoice_id' => 'INV-1012', 'product' => 'Ring Light 10in', 'qty' => 1],
            ['invoice_id' => 'INV-1013', 'product' => 'Portable Display 15.6in', 'qty' => 1],
            ['invoice_id' => 'INV-1014', 'product' => 'SSD 1TB NVMe', 'qty' => 1],
            ['invoice_id' => 'INV-1015', 'product' => 'Ergonomic Chair Cushion', 'qty' => 1],
        ];

        foreach ($userOrders as $order) {
            Order::query()->updateOrCreate(
                [
                    'invoice_id' => $order['invoice_id'],
                    'user_id' => $user->id,
                    'product_id' => $createdProducts[$order['product']]->id,
                ],
                ['qty' => $order['qty']]
            );
        }

        // Create a few orders for second user
        $secondUserOrders = [
            ['invoice_id' => 'INV-2001', 'product' => 'Ergonomic Mouse', 'qty' => 1],
            ['invoice_id' => 'INV-2002', 'product' => 'Desk Lamp LED', 'qty' => 2],
        ];

        foreach ($secondUserOrders as $order) {
            Order::query()->updateOrCreate(
                [
                    'invoice_id' => $order['invoice_id'],
                    'user_id' => $secondUser->id,
                    'product_id' => $createdProducts[$order['product']]->id,
                ],
                ['qty' => $order['qty']]
            );
        }
    }
}
