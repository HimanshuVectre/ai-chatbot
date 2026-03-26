-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               9.1.0 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ai_sdk
CREATE DATABASE IF NOT EXISTS `ai_sdk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ai_sdk`;

-- Dumping structure for table ai_sdk.agent_conversations
DROP TABLE IF EXISTS `agent_conversations`;
CREATE TABLE IF NOT EXISTS `agent_conversations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_conversations_user_id_updated_at_index` (`user_id`,`updated_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.agent_conversations: 56 rows
/*!40000 ALTER TABLE `agent_conversations` DISABLE KEYS */;
INSERT INTO `agent_conversations` (`id`, `user_id`, `title`, `created_at`, `updated_at`) VALUES
	('019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'Show me all orders for a product with ID #9999 and link it to the \'Furniture\' category', '2026-03-20 03:58:05', '2026-03-20 06:27:28'),
	('019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'last 2 orders', '2026-03-20 06:27:50', '2026-03-20 07:33:46'),
	('019d0b26-c769-737e-a0c2-25ed23a28ce3', 1, 'Show me INV-1001 details', '2026-03-20 06:39:44', '2026-03-20 06:39:44'),
	('019d0b26-c9eb-7179-9c80-cab66f11d879', 1, 'My last 2 orders', '2026-03-20 06:39:44', '2026-03-20 06:39:44'),
	('019d0b26-ce81-70bd-b9da-854bf539bf1f', 1, 'Show me my last 5 orders', '2026-03-20 06:39:45', '2026-03-20 06:39:45'),
	('019d0b26-d27c-73a6-b833-6e78ddf6c5a4', 1, 'What are my recent orders?', '2026-03-20 06:39:46', '2026-03-20 06:39:46'),
	('019d0b26-d4c0-708a-8bfd-f811c7970dee', 1, 'Details for 1003', '2026-03-20 06:39:47', '2026-03-20 06:39:47'),
	('019d0b51-b299-7109-93a3-5a8e5e3d2d23', 1, 'Show lighting and audio products', '2026-03-20 07:26:36', '2026-03-20 07:26:36'),
	('019d0b51-b538-72d8-8b26-0ca59fbbf438', 1, 'Lighting products and audio products between 2000 to 4000', '2026-03-20 07:26:37', '2026-03-20 07:26:37'),
	('019d0b51-b754-71fc-8d3d-9215e0ffe2f9', 1, 'Audio and video products under 3000', '2026-03-20 07:26:37', '2026-03-20 07:26:37'),
	('019d0b51-b9ca-70a3-a961-b0696231810e', 1, 'Show camera video and photography items', '2026-03-20 07:26:38', '2026-03-20 07:26:38'),
	('019d0b51-bbf7-73a8-a615-d73af1cbc0c2', 1, 'Lighting products', '2026-03-20 07:26:39', '2026-03-20 07:26:39'),
	('019d0b52-4154-7032-bb90-08a4e0cdda26', 1, 'Show lighting and audio products', '2026-03-20 07:27:13', '2026-03-20 07:27:13'),
	('019d0b52-43ec-7213-8495-b606a7232121', 1, 'Lighting products and audio products between 2000 to 4000', '2026-03-20 07:27:13', '2026-03-20 07:27:13'),
	('019d0b52-4650-7354-b2d2-dbad0d57a1cd', 1, 'Audio and gaming gear products under 4000', '2026-03-20 07:27:14', '2026-03-20 07:27:14'),
	('019d0b52-4902-7240-8d05-2b0960ae3930', 1, 'Show me smart home and lighting items', '2026-03-20 07:27:15', '2026-03-20 07:27:15'),
	('019d0b52-4b2f-717e-adc5-2d5009d6e6f0', 1, 'Products in electronics and audio', '2026-03-20 07:27:15', '2026-03-20 07:27:15'),
	('019d0b52-4d85-7305-83de-b269cffabff8', 1, 'Accessories and cables', '2026-03-20 07:27:16', '2026-03-20 07:27:16'),
	('019d0b52-4fdf-70dd-be13-904b8f98721c', 1, 'Lighting products', '2026-03-20 07:27:17', '2026-03-20 07:27:17'),
	('019d0b52-b08b-7159-b12f-207d1877765e', 1, 'Show lighting and audio products', '2026-03-20 07:27:41', '2026-03-20 07:27:41'),
	('019d0b52-b294-7094-a96f-6cb6ce907176', 1, 'Lighting products and audio products between 2000 to 4000', '2026-03-20 07:27:42', '2026-03-20 07:27:42'),
	('019d0b52-b498-71e6-8ad8-35c83cbeb96a', 1, 'Audio and gaming gear products under 4000', '2026-03-20 07:27:42', '2026-03-20 07:27:42'),
	('019d0b52-b6a9-71ba-9dad-2a6c78080df9', 1, 'Show me smart home and lighting items', '2026-03-20 07:27:43', '2026-03-20 07:27:43'),
	('019d0b52-b8a3-734d-aff8-1ea8e106d99a', 1, 'Products in electronics and audio', '2026-03-20 07:27:43', '2026-03-20 07:27:43'),
	('019d0b52-bac7-7153-8cb7-c9fe506c3781', 1, 'Accessories and cables', '2026-03-20 07:27:44', '2026-03-20 07:27:44'),
	('019d0b52-bcf0-7307-8461-8df58d1065b4', 1, 'Lighting products', '2026-03-20 07:27:44', '2026-03-20 07:27:44'),
	('019d0b54-cde6-7367-b223-9d339d308095', 1, 'Show lighting and audio products', '2026-03-20 07:30:00', '2026-03-20 07:30:00'),
	('019d0b54-d083-707d-b49a-098626751744', 1, 'Lighting products and audio products between 2000 to 4000', '2026-03-20 07:30:01', '2026-03-20 07:30:01'),
	('019d0b54-d2af-70ce-89c6-4bfc9777cebe', 1, 'Audio and gaming gear products under 4000', '2026-03-20 07:30:01', '2026-03-20 07:30:01'),
	('019d0b54-d4fb-7272-b6e9-0fbfc5e27dc3', 1, 'Show me smart home and lighting items', '2026-03-20 07:30:02', '2026-03-20 07:30:02'),
	('019d0b54-d75c-7198-b0d3-a17ae7afd416', 1, 'Products in electronics and audio', '2026-03-20 07:30:02', '2026-03-20 07:30:02'),
	('019d0b54-d9f4-731e-8520-2874a56f79f4', 1, 'Accessories and cables', '2026-03-20 07:30:03', '2026-03-20 07:30:03'),
	('019d0b54-dc5e-71b7-ac05-d4e31c367144', 1, 'Lighting products', '2026-03-20 07:30:04', '2026-03-20 07:30:04'),
	('019d0b56-fb12-703d-8893-5010942c97b3', 1, 'Show lighting and audio products', '2026-03-20 07:32:22', '2026-03-20 07:32:22'),
	('019d0b56-fdd5-72dc-9592-1d8124909546', 1, 'Lighting products and audio products between 2000 to 4000', '2026-03-20 07:32:23', '2026-03-20 07:32:23'),
	('019d0b57-0025-7111-bb84-e1522b0eb834', 1, 'Audio and gaming gear products under 4000', '2026-03-20 07:32:24', '2026-03-20 07:32:24'),
	('019d0b57-028b-70fb-8dbc-bf9628333ac0', 1, 'Show me smart home and lighting items', '2026-03-20 07:32:24', '2026-03-20 07:32:24'),
	('019d0b57-04fc-705b-89a5-42e6bc7aa85e', 1, 'Products in electronics and audio', '2026-03-20 07:32:25', '2026-03-20 07:32:25'),
	('019d0b57-075d-7294-aa2a-e1db69a3f5d6', 1, 'Accessories and cables', '2026-03-20 07:32:26', '2026-03-20 07:32:26'),
	('019d0b57-0a0d-73df-82ae-5c2b6cb199f8', 1, 'Lighting products', '2026-03-20 07:32:26', '2026-03-20 07:32:26'),
	('019d1e3d-25dd-71da-939b-dba4ee9950e5', 1, 'my order list', '2026-03-23 23:36:57', '2026-03-23 23:36:57'),
	('019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'my order list', '2026-03-23 23:37:09', '2026-03-24 01:02:47'),
	('019d1e92-8126-7159-8070-0b8690b20a43', 1, 'hi', '2026-03-24 01:10:11', '2026-03-24 01:10:50'),
	('019d1eb6-409b-7232-b79e-5ec6c244fc90', 1, 'say audio "Hello"', '2026-03-24 01:49:13', '2026-03-24 01:49:13'),
	('019d1ebe-2448-73aa-8316-619fa20802e2', 1, 'Give me last 2 order list', '2026-03-24 01:57:50', '2026-03-24 01:57:50'),
	('019d1ec6-0acd-701e-99d3-6d6d56c14339', 1, 'my orders', '2026-03-24 02:06:28', '2026-03-24 02:06:28'),
	('019d1ecd-3a66-7211-89c1-84c17ae32625', 1, 'List of categories', '2026-03-24 02:14:19', '2026-03-24 02:20:29'),
	('019d1ef1-b2e0-725a-8be2-3934830df677', 1, 'generate moon', '2026-03-24 02:54:09', '2026-03-24 03:03:43'),
	('019d1efa-cb53-72a7-ae09-1495bc2315c8', 1, 'Draw a moon', '2026-03-24 03:04:05', '2026-03-24 03:04:05'),
	('019d1f2b-46c0-72e4-8a4d-34ba364717d3', 1, 'audio product', '2026-03-24 03:57:03', '2026-03-24 03:57:23'),
	('019d1f2d-116b-7245-a080-a5169103e971', 1, 'Draw a sunset', '2026-03-24 03:59:00', '2026-03-24 03:59:00'),
	('019d1f3a-a7b5-73a9-b478-f5e5964b2c2d', 1, 'Draw a sunset', '2026-03-24 04:13:50', '2026-03-24 04:13:50'),
	('019d1f43-993f-7037-86ff-c61bd8cf1ad9', 1, 'Draw a sunset', '2026-03-24 04:23:37', '2026-03-24 04:23:37'),
	('019d1f4c-656c-730b-b284-fc24acce1b9a', 1, 'Draw a moon', '2026-03-24 04:33:13', '2026-03-24 04:33:13'),
	('019d1f6a-61e4-7035-ac6e-443494f2fb46', 1, 'my orders', '2026-03-24 05:05:58', '2026-03-24 05:05:58'),
	('019d1f6f-9b83-7175-8563-edc01c898dbc', 1, 'my order', '2026-03-24 05:11:41', '2026-03-24 05:29:12');
/*!40000 ALTER TABLE `agent_conversations` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.agent_conversation_messages
DROP TABLE IF EXISTS `agent_conversation_messages`;
CREATE TABLE IF NOT EXISTS `agent_conversation_messages` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `agent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Path to generated image',
  `image_metadata` json DEFAULT NULL COMMENT 'Image generation metadata (model, prompt, size, etc)',
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Public URL of generated image',
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text' COMMENT 'Message type: text, image, audio, mixed',
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_calls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_results` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_index` (`conversation_id`,`user_id`,`updated_at`),
  KEY `agent_conversation_messages_user_id_index` (`user_id`),
  KEY `agent_conversation_messages_conversation_id_index` (`conversation_id`),
  KEY `agent_conversation_messages_content_type_index` (`content_type`),
  KEY `agent_conversation_messages_conversation_id_content_type_index` (`conversation_id`,`content_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.agent_conversation_messages: 278 rows
/*!40000 ALTER TABLE `agent_conversation_messages` DISABLE KEYS */;
INSERT INTO `agent_conversation_messages` (`id`, `conversation_id`, `user_id`, `agent`, `role`, `content`, `image_path`, `image_metadata`, `image_url`, `content_type`, `attachments`, `tool_calls`, `tool_results`, `usage`, `meta`, `created_at`, `updated_at`) VALUES
	('019d0a92-c90a-70b5-9554-f01ffa501558', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me all orders for a product with ID #9999 and link it to the \'Furniture\' category', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 03:58:05', '2026-03-20 03:58:05'),
	('019d0a92-c90a-70b5-9554-f01ffb14d6dd', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products: 4K Monitor 27in (Rs 24999.00), Adjustable Dumbbell Set (Rs 10499.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), CPU Cooler Tower (Rs 4199.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 03:58:05', '2026-03-20 03:58:05'),
	('019d0a93-65c3-70db-b245-965bdfb609e6', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'is there any beauty category', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 03:58:45', '2026-03-20 03:58:45'),
	('019d0a93-65c3-70db-b245-965be059e669', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available categories: Accessories, Audio, Cables & Adapters, Computer Components, Electronics, Ergonomic Furniture, Fitness, Gaming Gear, Home Office, Lighting.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 03:58:45', '2026-03-20 03:58:45'),
	('019d0a95-55a6-7214-bd69-87469f32114e', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Give me a summary of our current sales performance', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:00:52', '2026-03-20 04:00:52'),
	('019d0a95-55a6-7214-bd69-87469f55e4f6', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:00:52', '2026-03-20 04:00:52'),
	('019d0a95-c7b3-7065-a169-c8c8c381a639', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'I want to buy 6 units of the \'Wireless Mouse\'. Can you process this order for me?', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:01:21', '2026-03-20 04:01:21'),
	('019d0a95-c7b3-7065-a169-c8c8c44ad1f6', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:01:21', '2026-03-20 04:01:21'),
	('019d0a99-ac93-71d4-a3a3-47cb11609b59', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'What is the total cost if I buy a laptop priced at 1,200 and a cooling pad for 45?', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:05:36', '2026-03-20 04:05:36'),
	('019d0a99-ac93-71d4-a3a3-47cb1198ca86', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:05:36', '2026-03-20 04:05:36'),
	('019d0a9a-0f90-72d8-8f76-49fac34a4c5f', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'gaming gear is ?', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:06:01', '2026-03-20 04:06:01'),
	('019d0a9a-0f90-72d8-8f76-49fac444aaae', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:06:01', '2026-03-20 04:06:01'),
	('019d0a9a-569a-7335-8abf-002a4154120a', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'gaming products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:06:20', '2026-03-20 04:06:20'),
	('019d0a9a-569a-7335-8abf-002a416cdeff', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products: 4K Monitor 27in (Rs 24999.00), Adjustable Dumbbell Set (Rs 10499.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), CPU Cooler Tower (Rs 4199.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:06:20', '2026-03-20 04:06:20'),
	('019d0aa3-8989-7139-93ac-c8ac157f3eda', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me all the products we have in the Electronics and Home Office categories', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:16:22', '2026-03-20 04:16:22'),
	('019d0aa3-8989-7139-93ac-c8ac1646f627', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Electronics category: 4K Monitor 27in (Rs 24999.00), Ergonomic Mouse (Rs 1299.00), Gaming Mouse RGB (Rs 2999.00), Mechanical Keyboard Gateron (Rs 5899.00), Mechanical Keyboard RGB (Rs 4499.00), Noise Cancelling Headphones (Rs 7999.00), USB 3.2 Gen 2 Hub (Rs 1599.00), USB Microphone (Rs 4499.00), USB-C Hub 8-in-1 (Rs 2999.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:16:22', '2026-03-20 04:16:22'),
	('019d0aa3-ce3b-733e-a8e7-2cf0173e95da', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me all the products we have in the Home Office categories.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:16:40', '2026-03-20 04:16:40'),
	('019d0aa3-ce3b-733e-a8e7-2cf017a77a66', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Home Office category: Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), Ergonomic Chair Cushion (Rs 2199.00), Ergonomic Mouse (Rs 1299.00), Monitor Arm Dual (Rs 3499.00), Monitor Stand Riser (Rs 1299.00), Standing Desk Converter (Rs 6999.00), Thunderbolt 3 Dock (Rs 6499.00), Wireless Keyboard (Rs 2499.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:16:40', '2026-03-20 04:16:40'),
	('019d0aa4-6940-7043-9325-254db0074bff', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'list 5 products from each category', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:17:20', '2026-03-20 04:17:20'),
	('019d0aa4-6940-7043-9325-254db0fbbe6b', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', '5 products from each category: Accessories: Desk Fan Portable (Rs 799.00), Ergonomic Mouse (Rs 1299.00), HDMI 2.1 Cable 5M (Rs 899.00), Monitor Screen Protector (Rs 499.00), Mouse Pad Large (Rs 1599.00) | Audio: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), USB Microphone (Rs 4499.00) | Cables & Adapters: DisplayPort 1.4 Cable (Rs 1199.00), HDMI 2.1 Cable 5M (Rs 899.00), Thunderbolt 3 Dock (Rs 6499.00), USB 3.2 Gen 2 Hub (Rs 1599.00), USB-C Fast Charger (Rs 1199.00) | Computer Components: CPU Cooler Tower (Rs 4199.00), Graphics Card RTX 4070 (Rs 34999.00), RAM 32GB DDR5 (Rs 8999.00), SSD 1TB NVMe (Rs 9999.00) | Electronics: 4K Monitor 27in (Rs 24999.00), Ergonomic Mouse (Rs 1299.00), Gaming Mouse RGB (Rs 2999.00), Mechanical Keyboard Gateron (Rs 5899.00), Mechanical Keyboard RGB (Rs 4499.00) | Ergonomic Furniture: Ergonomic Chair Cushion (Rs 2199.00), Standing Desk Converter (Rs 6999.00) | Fitness: Adjustable Dumbbell Set (Rs 10499.00), Foam Roller (Rs 1499.00), Jump Rope Speed (Rs 899.00), Resistance Bands Set (Rs 1299.00), Yoga Mat Premium (Rs 1699.00) | Gaming Gear: Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mechanical Keyboard Gateron (Rs 5899.00), Mechanical Keyboard RGB (Rs 4499.00), Mouse Pad Large (Rs 1599.00) | Home Office: Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), Ergonomic Chair Cushion (Rs 2199.00), Ergonomic Mouse (Rs 1299.00) | Lighting: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00) | Mobile Devices: Phone Stand Metal (Rs 599.00), Portable Display 15.6in (Rs 8999.00), Power Bank 30000mAh (Rs 2899.00), Wireless Charging Pad (Rs 1299.00) | Monitors & Displays: 4K Monitor 27in (Rs 24999.00), Monitor Arm Dual (Rs 3499.00), Monitor Screen Protector (Rs 499.00), Portable Display 15.6in (Rs 8999.00), Ultrawide Curved Monitor (Rs 19999.00) | Power Solutions: Power Bank 30000mAh (Rs 2899.00), Smart Power Strip (Rs 3499.00), Solar Power Bank (Rs 2199.00), Surge Protector 6-Outlet (Rs 1599.00), USB-C Fast Charger (Rs 1199.00) | Smart Home: Panel Light RGB (Rs 3999.00), Smart LED Bulb (Rs 899.00), Smart Power Strip (Rs 3499.00) | Storage & Organization: Cable Management Box (Rs 1099.00), Desk Organizer Set (Rs 899.00), External HDD 4TB (Rs 5999.00), Monitor Stand Riser (Rs 1299.00), Organizer Box Set (Rs 1499.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:17:20', '2026-03-20 04:17:20'),
	('019d0aa5-878e-732e-9e14-d1e6da9ffa33', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'list 5 products from accessories & audio only', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:18:33', '2026-03-20 04:18:33'),
	('019d0aa5-878e-732e-9e14-d1e6db839fd7', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Accessories category: Desk Fan Portable (Rs 799.00), Ergonomic Mouse (Rs 1299.00), HDMI 2.1 Cable 5M (Rs 899.00), Monitor Screen Protector (Rs 499.00), Mouse Pad Large (Rs 1599.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:18:33', '2026-03-20 04:18:33'),
	('019d0aaa-2014-732b-8948-9288f418605d', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Find the cheapest monitor in the Gaming category.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:23:34', '2026-03-20 04:23:34'),
	('019d0aaa-2014-732b-8948-9288f45b53b8', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available categories: Accessories, Audio, Cables & Adapters, Computer Components, Electronics, Ergonomic Furniture, Fitness, Gaming Gear, Home Office, Lighting.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:23:34', '2026-03-20 04:23:34'),
	('019d0aaa-9217-707f-8e54-c340d9c53d45', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'gaming gear', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:24:03', '2026-03-20 04:24:03'),
	('019d0aaa-9217-707f-8e54-c340da6d2fa1', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:24:03', '2026-03-20 04:24:03'),
	('019d0ac8-b767-7241-a222-28226d27b88a', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'audio', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:56:59', '2026-03-20 04:56:59'),
	('019d0ac8-b767-7241-a222-28226e0defac', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:56:59', '2026-03-20 04:56:59'),
	('019d0ac9-cd96-70cc-9256-6b9d28951d42', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'highlight top performing products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 04:58:10', '2026-03-20 04:58:10'),
	('019d0ac9-cd96-70cc-9256-6b9d2915eddf', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products: 4K Monitor 27in (Rs 24999.00), Adjustable Dumbbell Set (Rs 10499.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), CPU Cooler Tower (Rs 4199.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 04:58:10', '2026-03-20 04:58:10'),
	('019d0aed-ba10-70dc-ba66-f53a2e4ce663', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Present financial data in a clear monetary format', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 05:37:25', '2026-03-20 05:37:25'),
	('019d0aed-ba10-70dc-ba66-f53a2f0a4739', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 05:37:25', '2026-03-20 05:37:25'),
	('019d0af8-51c5-71c8-97b3-1471aa2f27b2', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'how many items of audio', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 05:48:59', '2026-03-20 05:48:59'),
	('019d0af8-51c5-71c8-97b3-1471aa742a8a', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 05:48:59', '2026-03-20 05:48:59'),
	('019d0af8-831b-7060-9f1c-4a986e5736fe', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'how many products of audio', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 05:49:11', '2026-03-20 05:49:11'),
	('019d0af8-831b-7060-9f1c-4a986f3668b1', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Total matching products in Audio category: 6.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 05:49:11', '2026-03-20 05:49:11'),
	('019d0af8-ef22-7307-bb4f-dbd84b635e2e', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Flag items with fewer than 5 units as LOW-STOCK order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 05:49:39', '2026-03-20 05:49:39'),
	('019d0af8-ef22-7307-bb4f-dbd84ba51840', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 05:49:39', '2026-03-20 05:49:39'),
	('019d0af9-0feb-716e-b03d-54d70627f4a9', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Flag items with fewer than 5 units as LOW-STOCK', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 05:49:47', '2026-03-20 05:49:47'),
	('019d0af9-0feb-716e-b03d-54d706da5dbe', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 05:49:47', '2026-03-20 05:49:47'),
	('019d0b00-a982-70d5-9121-4f7a083865b7', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'show me sales performance', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 05:58:06', '2026-03-20 05:58:06'),
	('019d0b00-a982-70d5-9121-4f7a08683186', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 05:58:06', '2026-03-20 05:58:06'),
	('019d0b01-08a7-710c-a9e1-f4d1657d95a9', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'top-performing categories', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 05:58:30', '2026-03-20 05:58:30'),
	('019d0b01-08a7-710c-a9e1-f4d165fbcbd3', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available categories: Accessories, Audio, Cables & Adapters, Computer Components, Electronics, Ergonomic Furniture, Fitness, Gaming Gear, Home Office, Lighting.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 05:58:30', '2026-03-20 05:58:30'),
	('019d0b01-4b8a-72bf-a1b5-36f2d1d949d5', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'low-inventory items', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 05:58:47', '2026-03-20 05:58:47'),
	('019d0b01-4b8a-72bf-a1b5-36f2d27e1887', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 05:58:47', '2026-03-20 05:58:47'),
	('019d0b07-49e3-7294-a3cb-d62f1c4c42a5', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my recent order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:05:20', '2026-03-20 06:05:20'),
	('019d0b07-49e3-7294-a3cb-d62f1ca60dce', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:05:20', '2026-03-20 06:05:20'),
	('019d0b07-7ae6-7355-a75c-14bbb14e1d9d', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my last order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:05:32', '2026-03-20 06:05:32'),
	('019d0b07-7ae6-7355-a75c-14bbb19244cf', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:05:32', '2026-03-20 06:05:32'),
	('019d0b07-a892-7204-a086-b76b4fb0f99e', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my last one order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:05:44', '2026-03-20 06:05:44'),
	('019d0b07-a892-7204-a086-b76b500a8fd7', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:05:44', '2026-03-20 06:05:44'),
	('019d0b07-d64d-72af-b7c1-8596cc3d93e5', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my last 2 order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:05:56', '2026-03-20 06:05:56'),
	('019d0b07-d64d-72af-b7c1-8596ccd47b69', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:05:56', '2026-03-20 06:05:56'),
	('019d0b08-a4da-717e-bce4-8ea463e737ca', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'calculate total order values', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:06:49', '2026-03-20 06:06:49'),
	('019d0b08-a4da-717e-bce4-8ea464b6b24b', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:06:49', '2026-03-20 06:06:49'),
	('019d0b16-d0c1-710c-86e9-b5f5c243e8bc', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'last 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:22:17', '2026-03-20 06:22:17'),
	('019d0b16-d0c1-710c-86e9-b5f5c326e7bb', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:22:17', '2026-03-20 06:22:17'),
	('019d0b17-1af5-729a-8eef-3386f2ff1d5e', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'INV-0009 details', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:22:36', '2026-03-20 06:22:36'),
	('019d0b17-1af5-729a-8eef-3386f33dbddc', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:22:36', '2026-03-20 06:22:36'),
	('019d0b17-43c2-7308-80fd-ea81e66747cf', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'INV-0009 order details', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:22:47', '2026-03-20 06:22:47'),
	('019d0b17-43c2-7308-80fd-ea81e6b13b60', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:22:47', '2026-03-20 06:22:47'),
	('019d0b1a-bcb0-72c7-a566-3835bc47bac8', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my last 3 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:26:34', '2026-03-20 06:26:34'),
	('019d0b1a-bcb0-72c7-a566-3835bc92f7ff', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:26:34', '2026-03-20 06:26:34'),
	('019d0b1b-45e0-71df-bf40-b57f2ffba948', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'inv-0009 order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:27:09', '2026-03-20 06:27:09'),
	('019d0b1b-45e0-71df-bf40-b57f30eaabd7', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:27:09', '2026-03-20 06:27:09'),
	('019d0b1b-8cd9-734b-8f2c-e7700e155456', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'last 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:27:28', '2026-03-20 06:27:28'),
	('019d0b1b-8cd9-734b-8f2c-e7700e1d462d', '019d0a92-c908-70b4-a0ae-1a8ea9bd0047', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:27:28', '2026-03-20 06:27:28'),
	('019d0b1b-e2df-73de-afb7-c6cd9422bf3c', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'last 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:27:50', '2026-03-20 06:27:50'),
	('019d0b1b-e2df-73de-afb7-c6cd94887932', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:27:50', '2026-03-20 06:27:50'),
	('019d0b1c-6eec-72b3-8fa1-92557b6ba2e8', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'invoice_id="INV-0009"', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:28:26', '2026-03-20 06:28:26'),
	('019d0b1c-6eec-72b3-8fa1-92557ba962cf', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:28:26', '2026-03-20 06:28:26'),
	('019d0b1e-2f96-719d-9aa5-f970c47a1833', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'invoice_id="INV-1001"', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:30:20', '2026-03-20 06:30:20'),
	('019d0b1e-2f96-719d-9aa5-f970c4e4785d', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:30:20', '2026-03-20 06:30:20'),
	('019d0b1e-857e-72ed-a84d-f7d9c31c1088', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'INV-1001 invoice details', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:30:42', '2026-03-20 06:30:42'),
	('019d0b1e-857e-72ed-a84d-f7d9c3cdd375', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:30:42', '2026-03-20 06:30:42'),
	('019d0b1f-4d2f-7212-ae16-da897e0ac744', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me INV-1006', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:31:33', '2026-03-20 06:31:33'),
	('019d0b1f-4d2f-7212-ae16-da897e7e16dd', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:31:33', '2026-03-20 06:31:33'),
	('019d0b1f-5f58-726a-9d47-74c06ba3ea09', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me INV-1007', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:31:38', '2026-03-20 06:31:38'),
	('019d0b1f-5f58-726a-9d47-74c06c3c04fa', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:31:38', '2026-03-20 06:31:38'),
	('019d0b1f-9c11-723c-9e79-22c23bc7a95d', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'What\'s in INV-1009?', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:31:54', '2026-03-20 06:31:54'),
	('019d0b1f-9c11-723c-9e79-22c23c6dff25', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:31:54', '2026-03-20 06:31:54'),
	('019d0b20-68a8-70e5-a129-6eccfb2e39d5', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me INV-1001 details', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:32:46', '2026-03-20 06:32:46'),
	('019d0b20-68a8-70e5-a129-6eccfc218c8d', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:32:46', '2026-03-20 06:32:46'),
	('019d0b21-1460-72cc-8a79-9ac0bb2a2da0', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'My last 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:33:30', '2026-03-20 06:33:30'),
	('019d0b21-1460-72cc-8a79-9ac0bb2b50e1', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:33:30', '2026-03-20 06:33:30'),
	('019d0b26-c783-7344-a9c1-aab74b502835', '019d0b26-c769-737e-a0c2-25ed23a28ce3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me INV-1001 details', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:39:44', '2026-03-20 06:39:44'),
	('019d0b26-c783-7344-a9c1-aab74bcd7570', '019d0b26-c769-737e-a0c2-25ed23a28ce3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Order details for INV-1001: INV-1001: Wireless Keyboard x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:39:44', '2026-03-20 06:39:44'),
	('019d0b26-c9ec-70d9-8e96-cdd69bc0db34', '019d0b26-c9eb-7179-9c80-cab66f11d879', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'My last 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:39:44', '2026-03-20 06:39:44'),
	('019d0b26-c9ec-70d9-8e96-cdd69bfef587', '019d0b26-c9eb-7179-9c80-cab66f11d879', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your last 2 orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:39:44', '2026-03-20 06:39:44'),
	('019d0b26-ce82-701e-9bfe-0cfad87fa935', '019d0b26-ce81-70bd-b9da-854bf539bf1f', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me my last 5 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:39:45', '2026-03-20 06:39:45'),
	('019d0b26-ce82-701e-9bfe-0cfad89b4505', '019d0b26-ce81-70bd-b9da-854bf539bf1f', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your last 5 orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:39:45', '2026-03-20 06:39:45'),
	('019d0b26-d27d-70b5-9c30-179d38f006b4', '019d0b26-d27c-73a6-b833-6e78ddf6c5a4', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'What are my recent orders?', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:39:46', '2026-03-20 06:39:46'),
	('019d0b26-d27d-70b5-9c30-179d39ced49d', '019d0b26-d27c-73a6-b833-6e78ddf6c5a4', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:39:46', '2026-03-20 06:39:46'),
	('019d0b26-d4c4-728f-a6e3-a93b40d9bab6', '019d0b26-d4c0-708a-8bfd-f811c7970dee', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Details for 1003', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:39:47', '2026-03-20 06:39:47'),
	('019d0b26-d4c4-728f-a6e3-a93b414a623b', '019d0b26-d4c0-708a-8bfd-f811c7970dee', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Order details for INV-1003: INV-1003: USB-C Hub 8-in-1 x2.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:39:47', '2026-03-20 06:39:47'),
	('019d0b27-2d29-73a5-9017-a5f128385310', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me INV-1001 details', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:40:10', '2026-03-20 06:40:10'),
	('019d0b27-2d29-73a5-9017-a5f128a0e057', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Order details for INV-1001: INV-1001: Wireless Keyboard x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:40:10', '2026-03-20 06:40:10'),
	('019d0b27-7038-7253-ae01-e6e56299736d', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'My last 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:40:27', '2026-03-20 06:40:27'),
	('019d0b27-7038-7253-ae01-e6e562b5a963', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your last 2 orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:40:27', '2026-03-20 06:40:27'),
	('019d0b27-ef57-72d1-a1b9-7c30d90db9ca', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Details for 1003', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 06:40:59', '2026-03-20 06:40:59'),
	('019d0b27-ef57-72d1-a1b9-7c30d9ac3634', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Order details for INV-1003: INV-1003: USB-C Hub 8-in-1 x2.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 06:40:59', '2026-03-20 06:40:59'),
	('019d0b49-6e35-730a-a3d6-65d5af3d27b9', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'suggest products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:17:34', '2026-03-20 07:17:34'),
	('019d0b49-6e35-730a-a3d6-65d5afa12e1c', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products: 4K Monitor 27in (Rs 24999.00), Adjustable Dumbbell Set (Rs 10499.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), CPU Cooler Tower (Rs 4199.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:17:34', '2026-03-20 07:17:34'),
	('019d0b49-b992-73c6-b918-609f686195a0', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'suggest me products under 3000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:17:54', '2026-03-20 07:17:54'),
	('019d0b49-b992-73c6-b918-609f68eda906', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products under Rs 3000: Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00), Ergonomic Chair Cushion (Rs 2199.00), Ergonomic Mouse (Rs 1299.00), Foam Roller (Rs 1499.00), Gaming Mouse RGB (Rs 2999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:17:54', '2026-03-20 07:17:54'),
	('019d0b49-fa64-7100-91f3-df5d68c4e791', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'suggest me products under price 3000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:18:10', '2026-03-20 07:18:10'),
	('019d0b49-fa64-7100-91f3-df5d69c45ea3', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products under Rs 3000: Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00), Ergonomic Chair Cushion (Rs 2199.00), Ergonomic Mouse (Rs 1299.00), Foam Roller (Rs 1499.00), Gaming Mouse RGB (Rs 2999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:18:10', '2026-03-20 07:18:10'),
	('019d0b4a-9ab3-714b-befa-87021cca0fe2', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'category list', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:18:51', '2026-03-20 07:18:51'),
	('019d0b4a-9ab3-714b-befa-87021d0a5f01', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available categories: Accessories, Audio, Cables & Adapters, Computer Components, Electronics, Ergonomic Furniture, Fitness, Gaming Gear, Home Office, Lighting.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:18:51', '2026-03-20 07:18:51'),
	('019d0b4a-c25c-718f-b613-18698d752db6', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'audio products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:19:02', '2026-03-20 07:19:02'),
	('019d0b4a-c25c-718f-b613-18698e55a380', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio category: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:19:02', '2026-03-20 07:19:02'),
	('019d0b4b-841e-724a-979f-2bcab4bab262', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'audio products between 2000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:19:51', '2026-03-20 07:19:51'),
	('019d0b4b-841e-724a-979f-2bcab582d890', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio category between Rs 2000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:19:51', '2026-03-20 07:19:51'),
	('019d0b4c-31dd-70c9-9008-f1f1fc292f17', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'lighting and audio products between 2000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:20:36', '2026-03-20 07:20:36'),
	('019d0b4c-31dd-70c9-9008-f1f1fcee0854', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio category between Rs 2000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:20:36', '2026-03-20 07:20:36'),
	('019d0b4c-705c-704b-aaf7-b9a26d20354d', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'lighting products and audio products between 2000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:20:52', '2026-03-20 07:20:52'),
	('019d0b4c-705c-704b-aaf7-b9a26d8d986b', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio category between Rs 2000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:20:52', '2026-03-20 07:20:52'),
	('019d0b4c-b502-7369-a3f5-c4d3049578c2', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'lighting products and audio products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:21:09', '2026-03-20 07:21:09'),
	('019d0b4c-b502-7369-a3f5-c4d304cfe987', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio category: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:21:09', '2026-03-20 07:21:09'),
	('019d0b4c-d437-735f-849e-a21640280beb', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'lighting products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:21:17', '2026-03-20 07:21:17'),
	('019d0b4c-d437-735f-849e-a21640a785b9', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Lighting category: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:21:17', '2026-03-20 07:21:17'),
	('019d0b51-b29b-7287-a651-b1014c917e84', '019d0b51-b299-7109-93a3-5a8e5e3d2d23', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show lighting and audio products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:26:36', '2026-03-20 07:26:36'),
	('019d0b51-b29b-7287-a651-b1014d315d79', '019d0b51-b299-7109-93a3-5a8e5e3d2d23', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Desk Lamp LED (Rs 1899.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:26:36', '2026-03-20 07:26:36'),
	('019d0b51-b539-72e9-90c9-7369837b00b6', '019d0b51-b538-72d8-8b26-0ca59fbbf438', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products and audio products between 2000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:26:37', '2026-03-20 07:26:37'),
	('019d0b51-b53a-7125-bdd5-6686768e2ae1', '019d0b51-b538-72d8-8b26-0ca59fbbf438', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories between Rs 2000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:26:37', '2026-03-20 07:26:37'),
	('019d0b51-b755-70b3-8cb1-2094c9934ddf', '019d0b51-b754-71fc-8d3d-9215e0ffe2f9', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Audio and video products under 3000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:26:37', '2026-03-20 07:26:37'),
	('019d0b51-b755-70b3-8cb1-2094ca1c42c0', '019d0b51-b754-71fc-8d3d-9215e0ffe2f9', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in audio category under Rs 3000: Bluetooth Speaker (Rs 2499.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:26:37', '2026-03-20 07:26:37'),
	('019d0b51-b9cb-712a-af31-6f534cc2f0fc', '019d0b51-b9ca-70a3-a961-b0696231810e', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show camera video and photography items', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:26:38', '2026-03-20 07:26:38'),
	('019d0b51-b9cb-712a-af31-6f534da6b177', '019d0b51-b9ca-70a3-a961-b0696231810e', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:26:38', '2026-03-20 07:26:38'),
	('019d0b51-bbf7-73a8-a615-d73af2849bb7', '019d0b51-bbf7-73a8-a615-d73af1cbc0c2', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:26:39', '2026-03-20 07:26:39'),
	('019d0b51-bbf7-73a8-a615-d73af34981fa', '019d0b51-bbf7-73a8-a615-d73af1cbc0c2', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in lighting category: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:26:39', '2026-03-20 07:26:39'),
	('019d0b52-4156-726b-ad88-e2d0cd888c9b', '019d0b52-4154-7032-bb90-08a4e0cdda26', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show lighting and audio products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:13', '2026-03-20 07:27:13'),
	('019d0b52-4156-726b-ad88-e2d0cdcfeb11', '019d0b52-4154-7032-bb90-08a4e0cdda26', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Desk Lamp LED (Rs 1899.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:13', '2026-03-20 07:27:13'),
	('019d0b52-43ec-7213-8495-b606a7650acb', '019d0b52-43ec-7213-8495-b606a7232121', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products and audio products between 2000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:13', '2026-03-20 07:27:13'),
	('019d0b52-43ec-7213-8495-b606a7af9663', '019d0b52-43ec-7213-8495-b606a7232121', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories between Rs 2000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:13', '2026-03-20 07:27:13'),
	('019d0b52-4651-73d8-8fa5-8fab1889d8b6', '019d0b52-4650-7354-b2d2-dbad0d57a1cd', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Audio and gaming gear products under 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:14', '2026-03-20 07:27:14'),
	('019d0b52-4651-73d8-8fa5-8fab18da7d6e', '019d0b52-4650-7354-b2d2-dbad0d57a1cd', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Gaming gear categories under Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mouse Pad Large (Rs 1599.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:14', '2026-03-20 07:27:14'),
	('019d0b52-4903-727e-b080-18c449300332', '019d0b52-4902-7240-8d05-2b0960ae3930', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me smart home and lighting items', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:15', '2026-03-20 07:27:15'),
	('019d0b52-4903-727e-b080-18c449c576b7', '019d0b52-4902-7240-8d05-2b0960ae3930', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:15', '2026-03-20 07:27:15'),
	('019d0b52-4b30-7019-bbe4-7b4299ca5b7c', '019d0b52-4b2f-717e-adc5-2d5009d6e6f0', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Products in electronics and audio', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:15', '2026-03-20 07:27:15'),
	('019d0b52-4b30-7019-bbe4-7b429a008770', '019d0b52-4b2f-717e-adc5-2d5009d6e6f0', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Electronics, Audio categories: 4K Monitor 27in (Rs 24999.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Ergonomic Mouse (Rs 1299.00), Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mechanical Keyboard Gateron (Rs 5899.00), Mechanical Keyboard RGB (Rs 4499.00), Noise Cancelling Headphones (Rs 7999.00), USB 3.2 Gen 2 Hub (Rs 1599.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:15', '2026-03-20 07:27:15'),
	('019d0b52-4d86-72a8-9aef-d01024596857', '019d0b52-4d85-7305-83de-b269cffabff8', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Accessories and cables', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:16', '2026-03-20 07:27:16'),
	('019d0b52-4d86-72a8-9aef-d01024889ad0', '019d0b52-4d85-7305-83de-b269cffabff8', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:16', '2026-03-20 07:27:16'),
	('019d0b52-4fe0-7322-85c5-7660a51435ac', '019d0b52-4fdf-70dd-be13-904b8f98721c', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:17', '2026-03-20 07:27:17'),
	('019d0b52-4fe0-7322-85c5-7660a6071e41', '019d0b52-4fdf-70dd-be13-904b8f98721c', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in lighting category: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:17', '2026-03-20 07:27:17'),
	('019d0b52-b08d-7108-929b-04dc1128297a', '019d0b52-b08b-7159-b12f-207d1877765e', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show lighting and audio products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:41', '2026-03-20 07:27:41'),
	('019d0b52-b08d-7108-929b-04dc11bb3796', '019d0b52-b08b-7159-b12f-207d1877765e', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Desk Lamp LED (Rs 1899.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:41', '2026-03-20 07:27:41'),
	('019d0b52-b295-710a-8d45-3b712de3d30d', '019d0b52-b294-7094-a96f-6cb6ce907176', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products and audio products between 2000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:42', '2026-03-20 07:27:42'),
	('019d0b52-b295-710a-8d45-3b712dfd82bc', '019d0b52-b294-7094-a96f-6cb6ce907176', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories between Rs 2000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:42', '2026-03-20 07:27:42'),
	('019d0b52-b499-7294-af50-903e1ec07a52', '019d0b52-b498-71e6-8ad8-35c83cbeb96a', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Audio and gaming gear products under 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:42', '2026-03-20 07:27:42'),
	('019d0b52-b499-7294-af50-903e1f2f1bec', '019d0b52-b498-71e6-8ad8-35c83cbeb96a', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Gaming gear categories under Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mouse Pad Large (Rs 1599.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:42', '2026-03-20 07:27:42'),
	('019d0b52-b6aa-73a8-a08c-1454c55b12a1', '019d0b52-b6a9-71ba-9dad-2a6c78080df9', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me smart home and lighting items', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:43', '2026-03-20 07:27:43'),
	('019d0b52-b6aa-73a8-a08c-1454c639cf56', '019d0b52-b6a9-71ba-9dad-2a6c78080df9', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Smart home, Lighting categories: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), Smart Power Strip (Rs 3499.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:43', '2026-03-20 07:27:43'),
	('019d0b52-b8a4-72a2-9457-a7d5098de025', '019d0b52-b8a3-734d-aff8-1ea8e106d99a', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Products in electronics and audio', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:43', '2026-03-20 07:27:43'),
	('019d0b52-b8a4-72a2-9457-a7d509eda0b0', '019d0b52-b8a3-734d-aff8-1ea8e106d99a', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Electronics, Audio categories: 4K Monitor 27in (Rs 24999.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Ergonomic Mouse (Rs 1299.00), Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mechanical Keyboard Gateron (Rs 5899.00), Mechanical Keyboard RGB (Rs 4499.00), Noise Cancelling Headphones (Rs 7999.00), USB 3.2 Gen 2 Hub (Rs 1599.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:43', '2026-03-20 07:27:43'),
	('019d0b52-bac8-7000-87b8-539911170f6b', '019d0b52-bac7-7153-8cb7-c9fe506c3781', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Accessories and cables', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:44', '2026-03-20 07:27:44'),
	('019d0b52-bac8-7000-87b8-539911968578', '019d0b52-bac7-7153-8cb7-c9fe506c3781', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:44', '2026-03-20 07:27:44'),
	('019d0b52-bcf0-7307-8461-8df58dfd7ac5', '019d0b52-bcf0-7307-8461-8df58d1065b4', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:27:44', '2026-03-20 07:27:44'),
	('019d0b52-bcf0-7307-8461-8df58e0eb47e', '019d0b52-bcf0-7307-8461-8df58d1065b4', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in lighting category: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:27:44', '2026-03-20 07:27:44'),
	('019d0b53-0082-73c6-8fe4-920fa0730093', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'lighting products and audio products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:28:02', '2026-03-20 07:28:02'),
	('019d0b53-0082-73c6-8fe4-920fa0f3e83f', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Desk Lamp LED (Rs 1899.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:28:02', '2026-03-20 07:28:02'),
	('019d0b53-4990-7050-b0cb-3de769d027dd', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'lighting products and audio products under 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:28:20', '2026-03-20 07:28:20'),
	('019d0b53-4990-7050-b0cb-3de76a7a7cab', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories under Rs 4000: Bluetooth Speaker (Rs 2499.00), Desk Lamp LED (Rs 1899.00), Gaming Headset (Rs 3799.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:28:20', '2026-03-20 07:28:20'),
	('019d0b54-112d-71c4-bbe6-f9d44544fd70', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'lighting products and audio products above 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:29:12', '2026-03-20 07:29:12'),
	('019d0b54-112d-71c4-bbe6-f9d44639a1ec', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories above Rs 4000: Audio Interface 2-in-2-out (Rs 5999.00), Noise Cancelling Headphones (Rs 7999.00), USB Microphone (Rs 4499.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:29:12', '2026-03-20 07:29:12'),
	('019d0b54-cde8-7095-9611-dcfee66729d0', '019d0b54-cde6-7367-b223-9d339d308095', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show lighting and audio products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:00', '2026-03-20 07:30:00'),
	('019d0b54-cde8-7095-9611-dcfee704bafc', '019d0b54-cde6-7367-b223-9d339d308095', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Desk Lamp LED (Rs 1899.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:00', '2026-03-20 07:30:00'),
	('019d0b54-d084-7217-bc0f-68be2849e2f1', '019d0b54-d083-707d-b49a-098626751744', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products and audio products between 2000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:01', '2026-03-20 07:30:01'),
	('019d0b54-d084-7217-bc0f-68be2912ae35', '019d0b54-d083-707d-b49a-098626751744', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories between Rs 2000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:01', '2026-03-20 07:30:01'),
	('019d0b54-d2af-70ce-89c6-4bfc97dff973', '019d0b54-d2af-70ce-89c6-4bfc9777cebe', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Audio and gaming gear products under 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:01', '2026-03-20 07:30:01'),
	('019d0b54-d2af-70ce-89c6-4bfc984c89f5', '019d0b54-d2af-70ce-89c6-4bfc9777cebe', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Gaming gear categories under Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mouse Pad Large (Rs 1599.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:01', '2026-03-20 07:30:01'),
	('019d0b54-d4fb-7272-b6e9-0fbfc62fc169', '019d0b54-d4fb-7272-b6e9-0fbfc5e27dc3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me smart home and lighting items', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:02', '2026-03-20 07:30:02'),
	('019d0b54-d4fc-73eb-8398-08c8356f4149', '019d0b54-d4fb-7272-b6e9-0fbfc5e27dc3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Smart home, Lighting categories: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), Smart Power Strip (Rs 3499.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:02', '2026-03-20 07:30:02'),
	('019d0b54-d75d-720d-a11d-f2a1b4a62d50', '019d0b54-d75c-7198-b0d3-a17ae7afd416', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Products in electronics and audio', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:02', '2026-03-20 07:30:02'),
	('019d0b54-d75d-720d-a11d-f2a1b5029cdd', '019d0b54-d75c-7198-b0d3-a17ae7afd416', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Electronics, Audio categories: 4K Monitor 27in (Rs 24999.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Ergonomic Mouse (Rs 1299.00), Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mechanical Keyboard Gateron (Rs 5899.00), Mechanical Keyboard RGB (Rs 4499.00), Noise Cancelling Headphones (Rs 7999.00), USB 3.2 Gen 2 Hub (Rs 1599.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:02', '2026-03-20 07:30:02'),
	('019d0b54-d9f5-720a-b11a-0737dfe783ea', '019d0b54-d9f4-731e-8520-2874a56f79f4', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Accessories and cables', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:03', '2026-03-20 07:30:03'),
	('019d0b54-d9f5-720a-b11a-0737e0d30d08', '019d0b54-d9f4-731e-8520-2874a56f79f4', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:03', '2026-03-20 07:30:03'),
	('019d0b54-dc5f-72ae-86ad-0cb4b1af38cb', '019d0b54-dc5e-71b7-ac05-d4e31c367144', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:04', '2026-03-20 07:30:04'),
	('019d0b54-dc5f-72ae-86ad-0cb4b250f9bd', '019d0b54-dc5e-71b7-ac05-d4e31c367144', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in lighting category: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:04', '2026-03-20 07:30:04'),
	('019d0b55-1f64-71ae-a95c-2a7e390bb97b', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Accessories and cables', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:21', '2026-03-20 07:30:21'),
	('019d0b55-1f64-71ae-a95c-2a7e39f3ebb2', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:21', '2026-03-20 07:30:21'),
	('019d0b55-33c5-714f-a756-b8d7e8f1bca9', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Accessories and cables products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:26', '2026-03-20 07:30:26'),
	('019d0b55-33c5-714f-a756-b8d7e980f6d8', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Accessories, Cables & adapters categories: Desk Fan Portable (Rs 799.00), DisplayPort 1.4 Cable (Rs 1199.00), Ergonomic Mouse (Rs 1299.00), HDMI 2.1 Cable 5M (Rs 899.00), Monitor Screen Protector (Rs 499.00), Mouse Pad Large (Rs 1599.00), Phone Stand Metal (Rs 599.00), Resistance Bands Set (Rs 1299.00), Surge Protector 6-Outlet (Rs 1599.00), Thunderbolt 3 Dock (Rs 6499.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:26', '2026-03-20 07:30:26'),
	('019d0b55-987b-701f-ae9e-93a176cacf50', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Accessories and cables products under 1000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:30:52', '2026-03-20 07:30:52'),
	('019d0b55-987c-734b-8397-9ca62c12de51', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Accessories, Cables & adapters categories under Rs 1000: Desk Fan Portable (Rs 799.00), HDMI 2.1 Cable 5M (Rs 899.00), Monitor Screen Protector (Rs 499.00), Phone Stand Metal (Rs 599.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:30:52', '2026-03-20 07:30:52'),
	('019d0b56-e739-7380-890f-59a8be021138', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Cables & Adapters', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:32:17', '2026-03-20 07:32:17'),
	('019d0b56-e739-7380-890f-59a8be20eafc', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:32:17', '2026-03-20 07:32:17'),
	('019d0b56-fb14-70db-b01d-eec2a2c84bd7', '019d0b56-fb12-703d-8893-5010942c97b3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show lighting and audio products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:32:22', '2026-03-20 07:32:22'),
	('019d0b56-fb14-70db-b01d-eec2a2fa8fac', '019d0b56-fb12-703d-8893-5010942c97b3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Desk Lamp LED (Rs 1899.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:32:22', '2026-03-20 07:32:22'),
	('019d0b56-fdd6-7120-af94-cd1dc18839e4', '019d0b56-fdd5-72dc-9592-1d8124909546', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products and audio products between 2000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:32:23', '2026-03-20 07:32:23'),
	('019d0b56-fdd6-7120-af94-cd1dc1978cec', '019d0b56-fdd5-72dc-9592-1d8124909546', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Lighting categories between Rs 2000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:32:23', '2026-03-20 07:32:23'),
	('019d0b57-0026-73ce-8dfb-31adafe79d36', '019d0b57-0025-7111-bb84-e1522b0eb834', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Audio and gaming gear products under 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:32:24', '2026-03-20 07:32:24'),
	('019d0b57-0026-73ce-8dfb-31adb003be0e', '019d0b57-0025-7111-bb84-e1522b0eb834', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Audio, Gaming gear categories under Rs 4000: Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mouse Pad Large (Rs 1599.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:32:24', '2026-03-20 07:32:24'),
	('019d0b57-028b-70fb-8dbc-bf96290e0649', '019d0b57-028b-70fb-8dbc-bf9628333ac0', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Show me smart home and lighting items', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:32:24', '2026-03-20 07:32:24'),
	('019d0b57-028b-70fb-8dbc-bf9629ee3e97', '019d0b57-028b-70fb-8dbc-bf9628333ac0', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Smart home, Lighting categories: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00), Smart Power Strip (Rs 3499.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:32:24', '2026-03-20 07:32:24'),
	('019d0b57-04fd-73fb-8491-825c28aa57e2', '019d0b57-04fc-705b-89a5-42e6bc7aa85e', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Products in electronics and audio', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:32:25', '2026-03-20 07:32:25'),
	('019d0b57-04fd-73fb-8491-825c297a2d04', '019d0b57-04fc-705b-89a5-42e6bc7aa85e', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Electronics, Audio categories: 4K Monitor 27in (Rs 24999.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Ergonomic Mouse (Rs 1299.00), Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00), Mechanical Keyboard Gateron (Rs 5899.00), Mechanical Keyboard RGB (Rs 4499.00), Noise Cancelling Headphones (Rs 7999.00), USB 3.2 Gen 2 Hub (Rs 1599.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:32:25', '2026-03-20 07:32:25'),
	('019d0b57-075e-7012-b0f7-b9e0ed85f58e', '019d0b57-075d-7294-aa2a-e1db69a3f5d6', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Accessories and cables', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:32:26', '2026-03-20 07:32:26'),
	('019d0b57-075e-7012-b0f7-b9e0ee7f533a', '019d0b57-075d-7294-aa2a-e1db69a3f5d6', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:32:26', '2026-03-20 07:32:26'),
	('019d0b57-0a0e-70a3-92a3-ffcba9173b4b', '019d0b57-0a0d-73df-82ae-5c2b6cb199f8', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:32:26', '2026-03-20 07:32:26'),
	('019d0b57-0a0e-70a3-92a3-ffcba9e49bf4', '019d0b57-0a0d-73df-82ae-5c2b6cb199f8', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in lighting category: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:32:26', '2026-03-20 07:32:26'),
	('019d0b58-3fee-7346-9983-99ac5b3b2ab9', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'lighting, accessories, cables and audio products between 1000 to 4000', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-20 07:33:46', '2026-03-20 07:33:46'),
	('019d0b58-3fee-7346-9983-99ac5b3f19db', '019d0b1b-e2de-71c4-a5b7-1c8dcd2cb218', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in Accessories, Audio, Cables & adapters, Lighting categories between Rs 1000 and Rs 4000: Bluetooth Speaker (Rs 2499.00), Desk Lamp LED (Rs 1899.00), DisplayPort 1.4 Cable (Rs 1199.00), Ergonomic Mouse (Rs 1299.00), Gaming Headset (Rs 3799.00), Mouse Pad Large (Rs 1599.00), Panel Light RGB (Rs 3999.00), Resistance Bands Set (Rs 1299.00), Ring Light 10in (Rs 2299.00), Surge Protector 6-Outlet (Rs 1599.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-20 07:33:46', '2026-03-20 07:33:46'),
	('019d1e3d-261f-7176-b45e-ba2677c0b0fa', '019d1e3d-25dd-71da-939b-dba4ee9950e5', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my order list', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-23 23:36:57', '2026-03-23 23:36:57'),
	('019d1e3d-261f-7176-b45e-ba2678befcc6', '019d1e3d-25dd-71da-939b-dba4ee9950e5', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-23 23:36:57', '2026-03-23 23:36:57'),
	('019d1e3d-5590-7078-a3a1-a1824f12ee12', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my order list', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-23 23:37:09', '2026-03-23 23:37:09'),
	('019d1e3d-5590-7078-a3a1-a1824f82eee0', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-23 23:37:09', '2026-03-23 23:37:09'),
	('019d1e3d-85e4-7051-9e8c-dd15fbc2fed0', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my last 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-23 23:37:21', '2026-03-23 23:37:21'),
	('019d1e3d-85e4-7051-9e8c-dd15fc95ef69', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your last 2 orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-23 23:37:21', '2026-03-23 23:37:21'),
	('019d1e3e-20d6-73b9-8c53-e18e195de51c', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my first 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-23 23:38:01', '2026-03-23 23:38:01'),
	('019d1e3e-20d6-73b9-8c53-e18e19f5225b', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-23 23:38:01', '2026-03-23 23:38:01'),
	('019d1e3f-a44f-70c7-9923-b4ed4497d110', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my first 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-23 23:39:40', '2026-03-23 23:39:40'),
	('019d1e3f-a44f-70c7-9923-b4ed458d5168', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-23 23:39:40', '2026-03-23 23:39:40'),
	('019d1e42-1c87-70c1-902f-aa4fc01cdd72', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'first 3 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-23 23:42:22', '2026-03-23 23:42:22'),
	('019d1e42-1c88-70dc-b053-ac7760f12754', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-23 23:42:22', '2026-03-23 23:42:22'),
	('019d1e53-862e-71d5-9aac-0e33dd3b16d9', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my first 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 00:01:23', '2026-03-24 00:01:23'),
	('019d1e53-862e-71d5-9aac-0e33ddcd365c', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your first 2 orders: INV-1001: Wireless Keyboard x1, INV-1002: Noise Cancelling Headphones x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 00:01:23', '2026-03-24 00:01:23'),
	('019d1e53-fac4-7113-a7fc-f97665c7bbb1', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my first 5 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 00:01:53', '2026-03-24 00:01:53'),
	('019d1e53-fac5-704a-9819-b6f1bba83b6c', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your first 5 orders: INV-1001: Wireless Keyboard x1, INV-1002: Noise Cancelling Headphones x1, INV-1003: USB-C Hub 8-in-1 x2, INV-1004: Standing Desk Converter x1, INV-1005: Monitor Stand Riser x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 00:01:53', '2026-03-24 00:01:53'),
	('019d1e54-6951-73ab-bd02-f1bda0461453', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my 6th order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 00:02:21', '2026-03-24 00:02:21'),
	('019d1e54-6951-73ab-bd02-f1bda05af09b', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 00:02:21', '2026-03-24 00:02:21'),
	('019d1e89-3789-7048-a459-c9bed395c937', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Ring Light 10in x1 product invoice', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:00:02', '2026-03-24 01:00:02'),
	('019d1e89-378a-70df-b545-89d3092c61fc', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products: 4K Monitor 27in (Rs 24999.00), Adjustable Dumbbell Set (Rs 10499.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), CPU Cooler Tower (Rs 4199.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:00:02', '2026-03-24 01:00:02'),
	('019d1e89-a075-7077-8f74-0f9fe59461c1', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'light product', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:00:29', '2026-03-24 01:00:29'),
	('019d1e89-a075-7077-8f74-0f9fe5965ad4', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products: 4K Monitor 27in (Rs 24999.00), Adjustable Dumbbell Set (Rs 10499.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), CPU Cooler Tower (Rs 4199.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:00:29', '2026-03-24 01:00:29'),
	('019d1e8a-c20b-712f-8a55-9505e6c8678e', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Lighting category products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:01:43', '2026-03-24 01:01:43'),
	('019d1e8a-c20b-712f-8a55-9505e7763bbd', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in lighting category: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00), Ring Light 10in (Rs 2299.00), Smart LED Bulb (Rs 899.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:01:43', '2026-03-24 01:01:43'),
	('019d1e8b-805c-7082-8efc-aed140dc7c6f', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Ring Light 10in product invoice order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:02:32', '2026-03-24 01:02:32'),
	('019d1e8b-805d-7279-9c21-c4aae1c57eb4', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available products: 4K Monitor 27in (Rs 24999.00), Adjustable Dumbbell Set (Rs 10499.00), Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Cable Management Box (Rs 1099.00), CPU Cooler Tower (Rs 4199.00), Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00), Desk Organizer Set (Rs 899.00), DisplayPort 1.4 Cable (Rs 1199.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:02:32', '2026-03-24 01:02:32'),
	('019d1e8b-bc1a-727c-9b9f-397a8aaaf98d', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Ring Light 10in invoice', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:02:47', '2026-03-24 01:02:47'),
	('019d1e8b-bc1a-727c-9b9f-397a8b9dac4f', '019d1e3d-558d-72bb-89e1-cc7775df7775', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:02:47', '2026-03-24 01:02:47'),
	('019d1e92-812b-7356-a177-a96c1d88ba85', '019d1e92-8126-7159-8070-0b8690b20a43', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'hi', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:10:11', '2026-03-24 01:10:11'),
	('019d1e92-812b-7356-a177-a96c1e3d2aec', '019d1e92-8126-7159-8070-0b8690b20a43', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:10:11', '2026-03-24 01:10:11'),
	('019d1e92-a84e-738b-9ac9-d5aef635d3ed', '019d1e92-8126-7159-8070-0b8690b20a43', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'hello', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:10:21', '2026-03-24 01:10:21'),
	('019d1e92-a84e-738b-9ac9-d5aef6826e63', '019d1e92-8126-7159-8070-0b8690b20a43', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:10:21', '2026-03-24 01:10:21'),
	('019d1e92-ce7a-7390-875c-34585571568a', '019d1e92-8126-7159-8070-0b8690b20a43', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'all category', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:10:30', '2026-03-24 01:10:30'),
	('019d1e92-ce7a-7390-875c-345855a97442', '019d1e92-8126-7159-8070-0b8690b20a43', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available categories: Accessories, Audio, Cables & Adapters, Computer Components, Electronics, Ergonomic Furniture, Fitness, Gaming Gear, Home Office, Lighting.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:10:30', '2026-03-24 01:10:30'),
	('019d1e93-1bc2-70cf-87a8-2bc0637a2888', '019d1e92-8126-7159-8070-0b8690b20a43', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', '2 product from each category', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:10:50', '2026-03-24 01:10:50'),
	('019d1e93-1bc2-70cf-87a8-2bc0640d4206', '019d1e92-8126-7159-8070-0b8690b20a43', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', '2 products from each category: Accessories: Desk Fan Portable (Rs 799.00), Ergonomic Mouse (Rs 1299.00) | Audio: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00) | Cables & Adapters: DisplayPort 1.4 Cable (Rs 1199.00), HDMI 2.1 Cable 5M (Rs 899.00) | Computer Components: CPU Cooler Tower (Rs 4199.00), Graphics Card RTX 4070 (Rs 34999.00) | Electronics: 4K Monitor 27in (Rs 24999.00), Ergonomic Mouse (Rs 1299.00) | Ergonomic Furniture: Ergonomic Chair Cushion (Rs 2199.00), Standing Desk Converter (Rs 6999.00) | Fitness: Adjustable Dumbbell Set (Rs 10499.00), Foam Roller (Rs 1499.00) | Gaming Gear: Gaming Headset (Rs 3799.00), Gaming Mouse RGB (Rs 2999.00) | Home Office: Desk Fan Portable (Rs 799.00), Desk Lamp LED (Rs 1899.00) | Lighting: Desk Lamp LED (Rs 1899.00), Panel Light RGB (Rs 3999.00) | Mobile Devices: Phone Stand Metal (Rs 599.00), Portable Display 15.6in (Rs 8999.00) | Monitors & Displays: 4K Monitor 27in (Rs 24999.00), Monitor Arm Dual (Rs 3499.00) | Power Solutions: Power Bank 30000mAh (Rs 2899.00), Smart Power Strip (Rs 3499.00) | Smart Home: Panel Light RGB (Rs 3999.00), Smart LED Bulb (Rs 899.00) | Storage & Organization: Cable Management Box (Rs 1099.00), Desk Organizer Set (Rs 899.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:10:50', '2026-03-24 01:10:50'),
	('019d1eb6-409f-7054-8d87-0c9978985340', '019d1eb6-409b-7232-b79e-5ec6c244fc90', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'say audio "Hello"', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:49:13', '2026-03-24 01:49:13'),
	('019d1eb6-409f-7054-8d87-0c99798714c3', '019d1eb6-409b-7232-b79e-5ec6c244fc90', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:49:13', '2026-03-24 01:49:13'),
	('019d1ebe-244b-725f-8011-3aa12c6e2b11', '019d1ebe-2448-73aa-8316-619fa20802e2', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Give me last 2 order list', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 01:57:50', '2026-03-24 01:57:50'),
	('019d1ebe-244b-725f-8011-3aa12c843a04', '019d1ebe-2448-73aa-8316-619fa20802e2', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your last 2 orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 01:57:50', '2026-03-24 01:57:50'),
	('019d1ec6-0ad0-7122-a4ef-afa2513a33d6', '019d1ec6-0acd-701e-99d3-6d6d56c14339', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 02:06:28', '2026-03-24 02:06:28'),
	('019d1ec6-0ad0-7122-a4ef-afa2515e0a10', '019d1ec6-0acd-701e-99d3-6d6d56c14339', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 02:06:28', '2026-03-24 02:06:28'),
	('019d1ecd-3a6b-7354-80d7-4e7ecf35b6ac', '019d1ecd-3a66-7211-89c1-84c17ae32625', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'List of categories', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 02:14:19', '2026-03-24 02:14:19'),
	('019d1ecd-3a6b-7354-80d7-4e7ecfee1c60', '019d1ecd-3a66-7211-89c1-84c17ae32625', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Available categories: Accessories, Audio, Cables & Adapters, Computer Components, Electronics, Ergonomic Furniture, Fitness, Gaming Gear, Home Office, Lighting.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 02:14:19', '2026-03-24 02:14:19'),
	('019d1ecf-95d8-70f9-86db-21038d1f2068', '019d1ecd-3a66-7211-89c1-84c17ae32625', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Fitness Products', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 02:16:54', '2026-03-24 02:16:54'),
	('019d1ecf-95d8-70f9-86db-21038d7606f5', '019d1ecd-3a66-7211-89c1-84c17ae32625', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in fitness category: Adjustable Dumbbell Set (Rs 10499.00), Foam Roller (Rs 1499.00), Jump Rope Speed (Rs 899.00), Resistance Bands Set (Rs 1299.00), Yoga Mat Premium (Rs 1699.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 02:16:54', '2026-03-24 02:16:54'),
	('019d1ed2-e034-70fc-95aa-2d84e6f3dfe8', '019d1ecd-3a66-7211-89c1-84c17ae32625', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'ACCESSORIES PRODUCTS', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 02:20:29', '2026-03-24 02:20:29'),
	('019d1ed2-e034-70fc-95aa-2d84e7a976f3', '019d1ecd-3a66-7211-89c1-84c17ae32625', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in accessories category: Desk Fan Portable (Rs 799.00), Ergonomic Mouse (Rs 1299.00), HDMI 2.1 Cable 5M (Rs 899.00), Monitor Screen Protector (Rs 499.00), Mouse Pad Large (Rs 1599.00), Phone Stand Metal (Rs 599.00), Resistance Bands Set (Rs 1299.00), Surge Protector 6-Outlet (Rs 1599.00), USB 3.2 Gen 2 Hub (Rs 1599.00), USB-C Hub 8-in-1 (Rs 2999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 02:20:29', '2026-03-24 02:20:29'),
	('019d1ef1-b307-72c9-92d5-46a23f14f593', '019d1ef1-b2e0-725a-8be2-3934830df677', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'generate moon', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 02:54:09', '2026-03-24 02:54:09'),
	('019d1ef1-b307-72c9-92d5-46a23fddd7f4', '019d1ef1-b2e0-725a-8be2-3934830df677', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 02:54:09', '2026-03-24 02:54:09'),
	('019d1efa-7438-7164-ab38-e72e4afc60ac', '019d1ef1-b2e0-725a-8be2-3934830df677', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'draw a moon', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 03:03:43', '2026-03-24 03:03:43'),
	('019d1efa-7438-7164-ab38-e72e4b1246a3', '019d1ef1-b2e0-725a-8be2-3934830df677', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 03:03:43', '2026-03-24 03:03:43'),
	('019d1efa-cb56-7300-9b74-bff4e153861e', '019d1efa-cb53-72a7-ae09-1495bc2315c8', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Draw a moon', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 03:04:05', '2026-03-24 03:04:05'),
	('019d1efa-cb56-7300-9b74-bff4e1fc2cec', '019d1efa-cb53-72a7-ae09-1495bc2315c8', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 03:04:05', '2026-03-24 03:04:05'),
	('019d1f2b-46c5-711e-b208-a68479859157', '019d1f2b-46c0-72e4-8a4d-34ba364717d3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'audio product', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 03:57:03', '2026-03-24 03:57:03'),
	('019d1f2b-46c5-711e-b208-a68479b157ee', '019d1f2b-46c0-72e4-8a4d-34ba364717d3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Products in audio category: Audio Interface 2-in-2-out (Rs 5999.00), Bluetooth Speaker (Rs 2499.00), Gaming Headset (Rs 3799.00), Noise Cancelling Headphones (Rs 7999.00), USB Microphone (Rs 4499.00), Wireless Earbuds Pro (Rs 3999.00).', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 03:57:03', '2026-03-24 03:57:03'),
	('019d1f2b-96f2-7035-b148-548e80485a06', '019d1f2b-46c0-72e4-8a4d-34ba364717d3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Speaker price', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 03:57:23', '2026-03-24 03:57:23'),
	('019d1f2b-96f2-7035-b148-548e80c536ab', '019d1f2b-46c0-72e4-8a4d-34ba364717d3', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 03:57:23', '2026-03-24 03:57:23'),
	('019d1f2d-116e-7235-b18b-e7947fcf7f0b', '019d1f2d-116b-7245-a080-a5169103e971', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Draw a sunset', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 03:59:00', '2026-03-24 03:59:00'),
	('019d1f2d-116e-7235-b18b-e7947ffb07a2', '019d1f2d-116b-7245-a080-a5169103e971', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 03:59:00', '2026-03-24 03:59:00'),
	('019d1f3a-a7bc-71c6-8ade-77e2daadbe90', '019d1f3a-a7b5-73a9-b478-f5e5964b2c2d', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Draw a sunset', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 04:13:50', '2026-03-24 04:13:50'),
	('019d1f3a-a7bc-71c6-8ade-77e2dbaa537e', '019d1f3a-a7b5-73a9-b478-f5e5964b2c2d', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 04:13:50', '2026-03-24 04:13:50'),
	('019d1f43-9945-70a4-a055-02421c79280e', '019d1f43-993f-7037-86ff-c61bd8cf1ad9', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Draw a sunset', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 04:23:37', '2026-03-24 04:23:37'),
	('019d1f43-9945-70a4-a055-02421c8621e0', '019d1f43-993f-7037-86ff-c61bd8cf1ad9', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 04:23:37', '2026-03-24 04:23:37'),
	('019d1f4c-6573-71ab-84bc-66f8148a84dc', '019d1f4c-656c-730b-b284-fc24acce1b9a', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'Draw a moon', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 04:33:13', '2026-03-24 04:33:13'),
	('019d1f4c-6573-71ab-84bc-66f8155d4ca8', '019d1f4c-656c-730b-b284-fc24acce1b9a', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 04:33:13', '2026-03-24 04:33:13'),
	('019d1f6a-61ed-7262-8064-8e8450124dd9', '019d1f6a-61e4-7035-ac6e-443494f2fb46', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 05:05:58', '2026-03-24 05:05:58'),
	('019d1f6a-61ed-7262-8064-8e84503de34c', '019d1f6a-61e4-7035-ac6e-443494f2fb46', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 05:05:58', '2026-03-24 05:05:58'),
	('019d1f6f-9b88-73f8-892b-9d28a12a2915', '019d1f6f-9b83-7175-8563-edc01c898dbc', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my order', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 05:11:41', '2026-03-24 05:11:41'),
	('019d1f6f-9b88-73f8-892b-9d28a21fe8b1', '019d1f6f-9b83-7175-8563-edc01c898dbc', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your recent orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1, INV-1013: Portable Display 15.6in x1, INV-1012: Ring Light 10in x1, INV-1011: Power Bank 30000mAh x1, INV-1010: Mechanical Keyboard RGB x1, INV-1009: Gaming Mouse RGB x1, INV-1008: USB Microphone x1, INV-1007: Wireless Earbuds Pro x2, INV-1006: 4K Monitor 27in x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 05:11:41', '2026-03-24 05:11:41'),
	('019d1f7d-819d-71a9-b20e-eff96dac301d', '019d1f6f-9b83-7175-8563-edc01c898dbc', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'who is pm of india', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 05:26:52', '2026-03-24 05:26:52'),
	('019d1f7d-819d-71a9-b20e-eff96e22670c', '019d1f6f-9b83-7175-8563-edc01c898dbc', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'AI provider is temporarily unavailable. You can ask about categories, products, or your orders and I will fetch them from the database.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 05:26:52', '2026-03-24 05:26:52'),
	('019d1f7f-a697-73a8-8fac-3abbb7cd32fa', '019d1f6f-9b83-7175-8563-edc01c898dbc', 1, 'App\\Ai\\Agents\\SalesAssistant', 'user', 'my last 2 orders', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '[]', '2026-03-24 05:29:12', '2026-03-24 05:29:12'),
	('019d1f7f-a697-73a8-8fac-3abbb8ca9028', '019d1f6f-9b83-7175-8563-edc01c898dbc', 1, 'App\\Ai\\Agents\\SalesAssistant', 'assistant', 'Your last 2 orders: INV-1015: Ergonomic Chair Cushion x1, INV-1014: SSD 1TB NVMe x1.', NULL, NULL, NULL, 'text', '[]', '[]', '[]', '[]', '{"provider":"local","model":"fallback"}', '2026-03-24 05:29:12', '2026-03-24 05:29:12');
/*!40000 ALTER TABLE `agent_conversation_messages` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.audio_messages
DROP TABLE IF EXISTS `audio_messages`;
CREATE TABLE IF NOT EXISTS `audio_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_voice` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'female',
  `audio_instructions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_generated_at` timestamp NULL DEFAULT NULL,
  `audio_error` text COLLATE utf8mb4_unicode_ci,
  `source_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audio_messages_user_id_audio_generated_at_index` (`user_id`,`audio_generated_at`),
  KEY `audio_messages_user_id_audio_voice_index` (`user_id`,`audio_voice`),
  KEY `audio_messages_audio_path_index` (`audio_path`),
  KEY `audio_messages_audio_generated_at_index` (`audio_generated_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.audio_messages: 0 rows
/*!40000 ALTER TABLE `audio_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio_messages` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.cache: 0 rows
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.cache_locks: 0 rows
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.categories: 15 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
	(1, 'Electronics', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(2, 'Home Office', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(3, 'Accessories', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(4, 'Fitness', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(5, 'Audio', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(6, 'Cables & Adapters', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(7, 'Monitors & Displays', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(8, 'Storage & Organization', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(9, 'Mobile Devices', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(10, 'Smart Home', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(11, 'Gaming Gear', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(12, 'Ergonomic Furniture', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(13, 'Lighting', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(14, 'Power Solutions', '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(15, 'Computer Components', '2026-03-20 03:37:25', '2026-03-20 03:37:25');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.category_product
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_product_category_id_product_id_unique` (`category_id`,`product_id`),
  KEY `category_product_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.category_product: 89 rows
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL),
	(2, 2, 1, NULL, NULL),
	(3, 3, 1, NULL, NULL),
	(4, 1, 2, NULL, NULL),
	(5, 2, 2, NULL, NULL),
	(6, 3, 2, NULL, NULL),
	(7, 1, 3, NULL, NULL),
	(8, 5, 3, NULL, NULL),
	(9, 1, 4, NULL, NULL),
	(10, 3, 4, NULL, NULL),
	(11, 6, 4, NULL, NULL),
	(12, 6, 5, NULL, NULL),
	(13, 3, 5, NULL, NULL),
	(14, 6, 6, NULL, NULL),
	(15, 3, 6, NULL, NULL),
	(16, 1, 6, NULL, NULL),
	(17, 6, 7, NULL, NULL),
	(18, 2, 7, NULL, NULL),
	(19, 6, 8, NULL, NULL),
	(20, 4, 9, NULL, NULL),
	(21, 2, 10, NULL, NULL),
	(22, 12, 10, NULL, NULL),
	(23, 2, 11, NULL, NULL),
	(24, 13, 11, NULL, NULL),
	(25, 2, 12, NULL, NULL),
	(26, 8, 12, NULL, NULL),
	(27, 12, 13, NULL, NULL),
	(28, 2, 13, NULL, NULL),
	(29, 8, 14, NULL, NULL),
	(30, 2, 14, NULL, NULL),
	(31, 7, 15, NULL, NULL),
	(32, 1, 15, NULL, NULL),
	(33, 7, 16, NULL, NULL),
	(34, 11, 16, NULL, NULL),
	(35, 7, 17, NULL, NULL),
	(36, 9, 17, NULL, NULL),
	(37, 7, 18, NULL, NULL),
	(38, 2, 18, NULL, NULL),
	(39, 5, 19, NULL, NULL),
	(40, 1, 19, NULL, NULL),
	(41, 5, 20, NULL, NULL),
	(42, 5, 21, NULL, NULL),
	(43, 1, 21, NULL, NULL),
	(44, 5, 22, NULL, NULL),
	(45, 4, 23, NULL, NULL),
	(46, 4, 24, NULL, NULL),
	(47, 3, 24, NULL, NULL),
	(48, 4, 25, NULL, NULL),
	(49, 4, 26, NULL, NULL),
	(50, 9, 27, NULL, NULL),
	(51, 3, 27, NULL, NULL),
	(52, 9, 28, NULL, NULL),
	(53, 14, 28, NULL, NULL),
	(54, 10, 29, NULL, NULL),
	(55, 13, 29, NULL, NULL),
	(56, 10, 30, NULL, NULL),
	(57, 14, 30, NULL, NULL),
	(58, 11, 31, NULL, NULL),
	(59, 1, 31, NULL, NULL),
	(60, 11, 32, NULL, NULL),
	(61, 1, 32, NULL, NULL),
	(62, 11, 33, NULL, NULL),
	(63, 5, 33, NULL, NULL),
	(64, 11, 34, NULL, NULL),
	(65, 3, 34, NULL, NULL),
	(66, 14, 35, NULL, NULL),
	(67, 9, 35, NULL, NULL),
	(68, 14, 36, NULL, NULL),
	(69, 6, 36, NULL, NULL),
	(70, 14, 37, NULL, NULL),
	(71, 8, 38, NULL, NULL),
	(72, 15, 38, NULL, NULL),
	(73, 8, 39, NULL, NULL),
	(74, 8, 40, NULL, NULL),
	(75, 13, 41, NULL, NULL),
	(76, 13, 42, NULL, NULL),
	(77, 10, 42, NULL, NULL),
	(78, 15, 43, NULL, NULL),
	(79, 15, 44, NULL, NULL),
	(80, 15, 45, NULL, NULL),
	(81, 11, 46, NULL, NULL),
	(82, 1, 46, NULL, NULL),
	(83, 3, 47, NULL, NULL),
	(84, 2, 47, NULL, NULL),
	(85, 8, 48, NULL, NULL),
	(86, 14, 49, NULL, NULL),
	(87, 3, 49, NULL, NULL),
	(88, 3, 50, NULL, NULL),
	(89, 7, 50, NULL, NULL);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.failed_jobs: 0 rows
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.jobs: 0 rows
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.job_batches: 0 rows
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.migrations: 11 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_08_14_170933_add_two_factor_columns_to_users_table', 1),
	(5, '2026_02_06_000000_create_products_table', 1),
	(6, '2026_02_06_000001_create_categories_table', 1),
	(7, '2026_02_06_000002_create_category_product_table', 1),
	(8, '2026_02_06_000003_create_orders_table', 1),
	(9, '2026_03_19_092310_create_agent_conversations_table', 1),
	(10, '2026_02_19_create_audio_messages_table', 2),
	(11, '2026_03_24_add_image_support_to_messages', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `qty` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_product_id_foreign` (`product_id`),
  KEY `orders_invoice_id_index` (`invoice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.orders: 17 rows
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `invoice_id`, `user_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
	(1, 'INV-1001', 1, 1, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(2, 'INV-1002', 1, 3, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(3, 'INV-1003', 1, 4, 2, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(4, 'INV-1004', 1, 10, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(5, 'INV-1005', 1, 12, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(6, 'INV-1006', 1, 15, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(7, 'INV-1007', 1, 19, 2, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(8, 'INV-1008', 1, 21, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(9, 'INV-1009', 1, 31, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(10, 'INV-1010', 1, 32, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(11, 'INV-1011', 1, 35, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(12, 'INV-1012', 1, 41, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(13, 'INV-1013', 1, 17, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(14, 'INV-1014', 1, 38, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(15, 'INV-1015', 1, 13, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(16, 'INV-2001', 2, 2, 1, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(17, 'INV-2002', 2, 11, 2, '2026-03-20 03:37:25', '2026-03-20 03:37:25');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.password_reset_tokens: 0 rows
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `embedding` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.products: 50 rows
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `title`, `price`, `stock`, `description`, `embedding`, `created_at`, `updated_at`) VALUES
	(1, 'Wireless Keyboard', 2499.00, 40, 'Compact mechanical keyboard with backlight.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(2, 'Ergonomic Mouse', 1299.00, 55, 'Vertical ergonomic mouse for long work sessions.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(3, 'Noise Cancelling Headphones', 7999.00, 24, 'Over-ear bluetooth headphones with active noise cancellation.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(4, 'USB-C Hub 8-in-1', 2999.00, 65, 'Multiport USB-C hub with HDMI and card reader.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(5, 'HDMI 2.1 Cable 5M', 899.00, 120, '5-meter HDMI 2.1 cable for 4K 120Hz video.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(6, 'USB 3.2 Gen 2 Hub', 1599.00, 45, 'Fast USB hub with multiple ports.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(7, 'Thunderbolt 3 Dock', 6499.00, 18, 'Universal docking station with full connectivity.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(8, 'DisplayPort 1.4 Cable', 1199.00, 80, 'Premium DisplayPort cable for high-res monitors.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(9, 'Adjustable Dumbbell Set', 10499.00, 12, 'Pair of space-saving adjustable dumbbells.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(10, 'Standing Desk Converter', 6999.00, 18, 'Desk riser with keyboard tray for sit-stand workflow.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(11, 'Desk Lamp LED', 1899.00, 35, 'Dimmable LED desk lamp with USB port.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(12, 'Monitor Stand Riser', 1299.00, 50, 'Adjustable monitor stand with storage.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(13, 'Ergonomic Chair Cushion', 2199.00, 28, 'Memory foam seat cushion for better posture.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(14, 'Desk Organizer Set', 899.00, 75, '5-piece wood desk organizer set.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(15, '4K Monitor 27in', 24999.00, 8, '27-inch 4K UHD monitor with color accuracy.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(16, 'Ultrawide Curved Monitor', 19999.00, 10, '34-inch ultrawide curved gaming monitor.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(17, 'Portable Display 15.6in', 8999.00, 22, 'USB-C portable display for mobile professionals.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(18, 'Monitor Arm Dual', 3499.00, 16, 'Dual monitor articulating arm mount.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(19, 'Wireless Earbuds Pro', 3999.00, 42, 'Premium wireless earbuds with ANC and case.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(20, 'Bluetooth Speaker', 2499.00, 58, 'Portable waterproof Bluetooth speaker.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(21, 'USB Microphone', 4499.00, 34, 'Professional USB condenser microphone for streaming.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(22, 'Audio Interface 2-in-2-out', 5999.00, 19, 'Compact USB audio interface for music production.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(23, 'Yoga Mat Premium', 1699.00, 66, 'Non-slip premium TPE yoga mat.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(24, 'Resistance Bands Set', 1299.00, 89, '5-piece resistance loop band set.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(25, 'Jump Rope Speed', 899.00, 72, 'Steel wire speed jump rope.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(26, 'Foam Roller', 1499.00, 43, 'High-density foam roller for muscle recovery.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(27, 'Phone Stand Metal', 599.00, 95, 'Adjustable aluminum phone stand.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(28, 'Wireless Charging Pad', 1299.00, 51, 'Fast wireless charging pad for all Qi devices.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(29, 'Smart LED Bulb', 899.00, 63, 'WiFi-controlled RGB smart bulb.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(30, 'Smart Power Strip', 3499.00, 27, '4-outlet smart power strip with timer control.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(31, 'Gaming Mouse RGB', 2999.00, 38, 'High-precision gaming mouse with RGB lighting.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(32, 'Mechanical Keyboard RGB', 4499.00, 25, 'Cherry MX mechanical gaming keyboard.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(33, 'Gaming Headset', 3799.00, 31, '7.1 surround sound gaming headset.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(34, 'Mouse Pad Large', 1599.00, 67, 'XXL gaming mouse pad with rubber base.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(35, 'Power Bank 30000mAh', 2899.00, 44, 'Large capacity portable charger with dual USB-C.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(36, 'USB-C Fast Charger', 1199.00, 76, '65W USB-C fast charger for laptop and phone.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(37, 'Solar Power Bank', 2199.00, 23, 'Solar-powered portable charger.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(38, 'SSD 1TB NVMe', 9999.00, 15, '1TB NVMe SSD for fast storage.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(39, 'External HDD 4TB', 5999.00, 21, '4TB portable external hard drive.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(40, 'Organizer Box Set', 1499.00, 82, '6-piece plastic storage box set.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(41, 'Ring Light 10in', 2299.00, 39, '10-inch ring light with phone holder.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(42, 'Panel Light RGB', 3999.00, 17, 'Modular RGB panel light system.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(43, 'RAM 32GB DDR5', 8999.00, 12, '32GB DDR5 memory kit.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(44, 'CPU Cooler Tower', 4199.00, 28, 'High-performance air CPU cooler.', NULL, '2026-03-20 03:37:25', '2026-03-20 03:38:57'),
	(45, 'Graphics Card RTX 4070', 34999.00, 5, 'High-end 12GB graphics card for gaming and 3D work.', NULL, '2026-03-20 03:38:57', '2026-03-20 03:38:57'),
	(46, 'Mechanical Keyboard Gateron', 5899.00, 14, 'Gaming keyboard with Gateron switches.', NULL, '2026-03-20 03:38:57', '2026-03-20 03:38:57'),
	(47, 'Desk Fan Portable', 799.00, 88, 'Compact portable USB desk fan.', NULL, '2026-03-20 03:38:57', '2026-03-20 03:38:57'),
	(48, 'Cable Management Box', 1099.00, 97, 'Plastic cable organizer box for desk.', NULL, '2026-03-20 03:38:57', '2026-03-20 03:38:57'),
	(49, 'Surge Protector 6-Outlet', 1599.00, 34, '6-outlet surge protector with USB ports.', NULL, '2026-03-20 03:38:57', '2026-03-20 03:38:57'),
	(50, 'Monitor Screen Protector', 499.00, 123, 'Anti-glare screen protector for monitors.', NULL, '2026-03-20 03:38:57', '2026-03-20 03:38:57');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.sessions: 27 rows
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('WSFDgsmoMeMCuVJdSu2FbhcDMPSNxg39REQcHOSX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJBNmRWNURqcHNxcGppNUhmVHFsRmM1NTd0c1VQN1ptbERkMEFMVlF4IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJ1cmwiOltdLCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2NoYXRib3QiLCJyb3V0ZSI6ImNoYXRib3QifSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjF9', 1774011826),
	('S8Fkkm00jaGYXOigDLUCr7eQpzLfL5CyTXGfYA9M', NULL, NULL, '', 'eyJfdG9rZW4iOiJoQmNZQUMyRzlWQ3lFRGxUcWM4ZVhyb1BFdE9xYlVxeVpSRktLMzhOIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774008448),
	('wyZw6HzGTGHelGsxi3UlAXI3ncJRcxDgxShJ8ZiL', NULL, NULL, '', 'eyJfdG9rZW4iOiJObjFqQVFjMGU1MldQMTVaTTF3MXB0dFRudGFHNGxZcFNjcXhFZk56IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774008473),
	('FLajAF0R00TAYaOK5MgFsktxFZqpwiZADLHhshWe', NULL, NULL, '', 'eyJfdG9rZW4iOiI1N1hBaTBqdVFLTzMzczNDekM2dWdrQnVSUmh6RUdtYjBBSFVGWWJlIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774008507),
	('WphO5vFxKVTGO6VCVumQGZPCrFbyOOdWqx3NDCtB', NULL, NULL, '', 'eyJfdG9rZW4iOiJXNzJvT3dnbU5tWUI3Y08wWjdFRkVSYkJtYjdIUGVla1ltMHVEMkRSIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774008531),
	('eKeC2ItI1Iip0Av5JDxch1hr9EC39kUUu5d0Qs7g', NULL, NULL, '', 'eyJfdG9rZW4iOiJxcmVkbWpTbHI5aDl6aWVoYXIzdjNuSWRqZGtzcjVMcnptRklhamd1IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774008558),
	('YBCyu8OQyZMgl8D42hwfsxkeGF71WyENfjR6RvNa', NULL, NULL, '', 'eyJfdG9rZW4iOiJKR2JpbHJuSTBxV1JBdlhhbkJBTEVMWktDRUFwVWdYVDhQZGFuaHZhIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011305),
	('bcLmCKldZ8rKvRERSew8qOTZ5KnZ65jqHWbXflRp', NULL, NULL, '', 'eyJfdG9rZW4iOiJnMmMydzZFRTdWdkthV0tiZXIwWXRFWjVMZGt0V0l4YmJZekRUVHplIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011335),
	('zUuEtk5V17nlVrnx0zY5dfbETrXk1iNE7fNzQxDl', NULL, NULL, '', 'eyJfdG9rZW4iOiJVeEtrdHNJeXJTeGFKeUJYTDhSVmV5V0RSMHY3MWVja2hiRHNpREh6IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011350),
	('K6NVAjjgJAvekV1D2PSfFfwk6J8gzRCa5khbhQms', NULL, NULL, '', 'eyJfdG9rZW4iOiI0ZEtkSmV3TERkY0Q3SDkyWUFqVEhxQmRZQmYyNURZWFlrYlJDc2FMIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011358),
	('cA8fs4e5owQu4ObqXnSQKmhFoFbRnSCpdJhRvg6j', NULL, NULL, '', 'eyJfdG9rZW4iOiI1WWtjQ2p3b3BlbkVTSTNNeHpVV0tBSDJDNTZVMnZ0SE5ncExBWTBOIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011368),
	('2BeSBCBnLSZDXMaKENSB00Pemy3mnM0aa6ajzXR6', NULL, NULL, '', 'eyJfdG9rZW4iOiJ0d3R3cWdSSGtGeVVlV3Q4WlpMczVIeW5haktUeVVMV2dkZEZMdndSIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011378),
	('rprA5ocsGggFkTG6DKIOYhVgkXz08bavVYjJSHpN', NULL, NULL, '', 'eyJfdG9rZW4iOiJlSHhXR3VwVFpjQ2NlYlY1OTluMVdDY0NOaUtIMHZzY0p1TU95UTg0IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011449),
	('3lT1BOJq0YfK1IOLqP8osSHTBcMGdjUzd4k2WB2s', NULL, NULL, '', 'eyJfdG9rZW4iOiJBMWVIUFpWWVBOS2Q2elNxYmZyenVsM2dZZFhGYm54dzhaOWY3eUdKIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011452),
	('DOo0oxkSlt8ofZCcXVI1tEEBS4Cn4M4JGRaVMnjd', NULL, NULL, '', 'eyJfdG9rZW4iOiJDRUw3am1Id3pISGU4Y21xQlVVVHlGbFJiVDh1TkRGT2U3eXdFVTFOIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011517),
	('7c8mWWGaYWJYNNk5625Nfna8BSOjUd39KQQwkDhH', NULL, NULL, '', 'eyJfdG9rZW4iOiI4N1RFSU1KbGZPOU1lVWtKU1I4QmVrZWZWT0lDNVVTT09hVlZzSkplIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011727),
	('0nNUJc1OtY4O1sLoTfZrqseI2ISrQ6uNvRaGUU0e', NULL, NULL, '', 'eyJfdG9rZW4iOiI3c2lmUXplWkI0djNNZ2pCZHpZY0NVOU5Tc2VoS25HVU5GTmhyM2t1IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1774011991),
	('JuG5e8vH0vgUzwMPD6sPJ22vaMZzmPzizxJigu0m', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJUTlFqd1VKcnZoeFkwRXJla01WZEFnNWRuazBsZ0Uyc0dXVmJzc3g1IiwidXJsIjpbXSwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9jaGF0Ym90Iiwicm91dGUiOiJjaGF0Ym90In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjF9', 1774349952),
	('OdW4AEtlm92QMk1GWtUrCedSBlUzsuMvlqLjmNAN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-IN) WindowsPowerShell/5.1.26100.7920', 'eyJfdG9rZW4iOiI2aXN0VG03NjQzaFhvREpBS0xyaE5wZ2p2MG9GYkh1cW5hSkdXNWdoIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1774337413),
	('cYCdmgombeMv1wgGPUEP98RTIisajVbyIIhEE6EC', NULL, '127.0.0.1', '', 'eyJfdG9rZW4iOiJWSEtHb2JHUDJzTmNHZWtvN01zMldIa1RKT3hFOEZPZHNXTVUxSTVrIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1774337659),
	('H37AilWIT9afhi72uOCqG87LrWGWMPtItCvIv4WK', NULL, '127.0.0.1', '', 'eyJfdG9rZW4iOiI0aG9vUndFOWRBMGZjOFRUQTNyTUY4bWhOaVdYMWZKbTJUak1WYWloIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1774339249),
	('aC1U2XcSHFdSpJnDQ49G6dVC2DZKtJI2ty99QRHY', NULL, '127.0.0.1', '', 'eyJfdG9rZW4iOiJxQ0N0RXRBRGJUWG9ONHhrRUNnOTJUemRoZm9TWElYeUhmTklWbnRFIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1774340271),
	('m0vG7hqwNnk42Z5hPLSPBFkE53ncz1XcpU3WePOL', NULL, '127.0.0.1', '', 'eyJfdG9rZW4iOiJlY0ExWUdCTGh4bHhwUE5QZG5ST2JIcFhWQnFpTnlxUXZPb0hTNGxBIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1774340271),
	('ea1HHVDa8PHsF7EOvkPzeci9kd5TP1H3J7n0x0GS', NULL, '127.0.0.1', '', 'eyJfdG9rZW4iOiJ0RE1kU1JyQlo0WldtUWV2cVJRT0RONWc3dEVOaDlONTFJUFdqU1NDIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1774340271),
	('uoHIXHLRZfxk8HvRLJoO6goyRCXCbCVEGJUBtENG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ6eE1kcEhnS3pOUzFlMVBzelp5V1IwR3dNOVg3djk2TGNYcndrR2RWIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1774434722),
	('QyQ84xcwzZez3K17pyJt4GxyLO1PIfISP8XelWpi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJvWWhUb3VXbkIwcFV4eGM0WWhhbGlRY1dWOHR2alFBSkx5T0N1VlllIiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2NoYXRib3QifSwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1774442762),
	('dPI4DJz0mkGIHcX4c1W0jzMC8OncxaoNYbHaSzLb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJtTlVqdUNoVzQ3R1NQWnhQNmJyU2FDVlUwM2dnRWhUNHdTQVhJbFRkIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1774503072);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Dumping structure for table ai_sdk.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ai_sdk.users: 3 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(4, 'Himanshu', 'himanshu@mail.com', NULL, '$2y$12$z6xg/Ya0W/MigD4xDwzju.Ld4KlNB7fjJJPYaRsdw/ZTThphX2QoS', NULL, NULL, NULL, NULL, '2026-03-20 03:37:24', '2026-03-20 03:37:24'),
	(2, 'Buyer User', 'buyer@example.com', NULL, '$2y$12$3wnJj2GRU8ZO9lAnMBMJpuI2OomvJiuOp7vw1/xypG82JigQJ.lIy', NULL, NULL, NULL, NULL, '2026-03-20 03:37:25', '2026-03-20 03:37:25'),
	(1, 'Himanshu Sonwane', 'himanshusonwane61@gmail.com', NULL, '$2y$12$NliLgB1pc395R6kAATk0ZuP/iCTGtzF7cNpIO.CXF4nyRwVLNdGFK', NULL, NULL, NULL, NULL, '2026-03-20 03:56:56', '2026-03-20 03:56:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
