-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: coinnext_dev
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gauth_key` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `gauth_key` (`gauth_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'wongthomas@me.com','e59108500ebb8f5b2c675b27f95cd948c9db46db206de8915e1373fdfed8159f','KVDTQKCXFBHGGJKKN5RWQNBMLATEA4TG','2014-11-23 21:37:21','2014-11-23 21:37:21');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_stats`
--

DROP TABLE IF EXISTS `auth_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_stats`
--

LOCK TABLES `auth_stats` WRITE;
/*!40000 ALTER TABLE `auth_stats` DISABLE KEYS */;
INSERT INTO `auth_stats` VALUES (1,1,2130706433,'2014-11-10 09:18:11','2014-11-10 09:18:11'),(2,2,2130706433,'2014-11-10 09:38:22','2014-11-10 09:38:22'),(3,2,2130706433,'2014-11-10 09:40:52','2014-11-10 09:40:52'),(4,3,2130706433,'2014-11-10 13:24:27','2014-11-10 13:24:27'),(5,2,2130706433,'2014-11-10 20:33:48','2014-11-10 20:33:48'),(6,4,2130706433,'2014-11-23 20:57:43','2014-11-23 20:57:43'),(7,4,2130706433,'2014-11-23 20:59:12','2014-11-23 20:59:12'),(8,1,2130706433,'2014-12-08 21:50:00','2014-12-08 21:50:00'),(9,1,90670343,'2014-12-08 22:12:56','2014-12-08 22:12:56'),(10,2,2130706433,'2014-12-14 15:33:59','2014-12-14 15:33:59'),(11,2,1482260400,'2014-12-14 22:00:19','2014-12-14 22:00:19'),(12,1,90670343,'2014-12-15 00:28:06','2014-12-15 00:28:06'),(13,1,90670343,'2015-01-20 22:36:47','2015-01-20 22:36:47'),(14,1,90670343,'2015-01-20 23:03:25','2015-01-20 23:03:25'),(15,4,90670343,'2015-01-20 23:04:26','2015-01-20 23:04:26'),(16,5,90670343,'2015-01-20 23:05:45','2015-01-20 23:05:45');
/*!40000 ALTER TABLE `auth_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_stats`
--

DROP TABLE IF EXISTS `market_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `last_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `yesterday_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `day_high` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `day_low` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `top_bid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `top_ask` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `volume1` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `volume2` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `growth_ratio` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `today` datetime DEFAULT NULL,
  `status` int(10) unsigned NOT NULL COMMENT 'enabled, disabled',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_stats`
--

LOCK TABLES `market_stats` WRITE;
/*!40000 ALTER TABLE `market_stats` DISABLE KEYS */;
INSERT INTO `market_stats` VALUES (1,1,0,0,0,0,0,0,0,0,0,NULL,1,'2014-11-09 20:59:09','2014-11-09 20:59:09'),(2,2,0,0,0,0,0,0,0,0,0,NULL,1,'2014-11-09 20:59:09','2014-11-09 20:59:09');
/*!40000 ALTER TABLE `market_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_logs`
--

DROP TABLE IF EXISTS `order_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `matched_amount` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `result_amount` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `fee` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `unit_price` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'open, partiallyCompleted, completed',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_logs`
--

LOCK TABLES `order_logs` WRITE;
/*!40000 ALTER TABLE `order_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT 'market, limit',
  `action` int(10) unsigned NOT NULL COMMENT 'buy, sell',
  `buy_currency` int(10) unsigned NOT NULL,
  `sell_currency` int(10) unsigned NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `matched_amount` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `result_amount` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `fee` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `unit_price` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'open, partiallyCompleted, completed',
  `in_queue` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `close_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(10) unsigned NOT NULL,
  `log` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `wallet_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(64) DEFAULT NULL,
  `currency` int(10) unsigned NOT NULL,
  `address` varchar(34) NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `fee` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `status` int(10) unsigned DEFAULT '1' COMMENT 'pending, processed, canceled',
  `remote_ip` int(11) DEFAULT NULL,
  `fraud` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_stats`
--

DROP TABLE IF EXISTS `trade_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `open_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `close_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `high_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `low_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `volume` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `exchange_volume` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_stats`
--

LOCK TABLES `trade_stats` WRITE;
/*!40000 ALTER TABLE `trade_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `wallet_id` int(10) unsigned DEFAULT NULL,
  `currency` int(10) unsigned NOT NULL,
  `account` varchar(50) DEFAULT NULL,
  `fee` bigint(20) unsigned DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `address` varchar(34) NOT NULL,
  `amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `category` int(10) unsigned NOT NULL COMMENT 'send, receive',
  `txid` varchar(64) NOT NULL,
  `confirmations` int(10) unsigned DEFAULT '0',
  `balance_loaded` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,NULL,NULL,2,'0',0,'P5VmSt4mQp49sKjtgBUeXVE6Q9rXaLpDDj',1000000000,2,'a2c79e57d61a8d035b5c1e338cc3950d70bdd007c2db576153781cbcd83d42c5',15008,0,'2015-01-20 22:44:37','2015-02-01 17:19:51'),(2,5,8,2,'wallet_8',0,'NqeBThK6H6B5D4B56bHto4Q2Qwrr6JsXne',1000000000,2,'3dc993faaa27449d0f7f6bf814a3cc6ce106669f2842cf5b5e52b0f242afaad2',14990,1,'2015-01-20 23:06:50','2015-02-01 17:19:51');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT 'email_confirmation, google_auth, change_password',
  `token` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
INSERT INTO `user_tokens` VALUES (1,1,1,'80e6c63fe9dbdbffdef71eaaf43288ffc9ec4c9bae8ae3320775e231be2b7061',0,'2014-11-10 09:18:11','2014-11-10 09:18:41'),(2,2,1,'91b9e96fd50149f866f82912b884f80e36254983efafd591ace7a7fa65112012',0,'2014-11-10 09:38:22','2014-11-10 09:40:33'),(3,3,1,'ac715906e6ebde2e9cd75644bff740d3b26d7f353cb94a8bfc4902a3f6a9165a',0,'2014-11-10 13:24:27','2014-11-10 13:26:10'),(4,4,1,'3554284b96e4ca575a4cf50c24729d565f7601f3c928bb4863361e6cb0e560cc',0,'2014-11-23 20:57:42','2014-11-23 20:59:03'),(5,1,3,'b28a65cf06c9cf21726440b6d0e5673c3366c929b372a0188ab4e1a11d36936e',0,'2014-12-08 21:49:00','2014-12-08 21:49:49'),(6,5,1,'ba8a580dc1487385793c209dc257ec01d26887f4c9c4e094076056cf03077813',1,'2015-01-20 23:05:44','2015-01-20 23:05:44');
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `chat_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `email_auth_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'be6baef2-97a0-4bf4-a80e-d5daeec9ef68','thojeniphone@gmail.com','e59108500ebb8f5b2c675b27f95cd948c9db46db206de8915e1373fdfed8159f','Pasofgung',1,1,1,'2014-11-10 09:18:11','2014-12-08 21:49:49'),(2,'e0e9e551-72d2-4313-b244-e21719c88ab7','wmc@lxccoin.com','652b3065674cbc06516ea2bfbe98c4d1cb50c34f36f9cc91e74004affc8062d3','Kjakan',1,1,1,'2014-11-10 09:38:22','2014-12-14 22:00:51'),(3,'9bb827a1-2784-4a17-8d9d-c16d2a6ec6b5','ceo@lxccoin.com','104c8eb7b8aa85f849e3f80217ab53a56c574bb7ad90f898ad95737adb450543','Giekosor',1,1,1,'2014-11-10 13:24:27','2014-11-10 13:26:09'),(4,'80ff8741-b686-421a-85a3-75544903b221','wongthomas@me.com','9e964dc1374c20905db4a3f07334617bf370179b624cfd143a98cae94ecaf131','ThomasWong',1,1,1,'2014-11-23 20:57:42','2014-11-23 20:59:31'),(5,'536aa406-6376-45b3-a66e-85f1e7463bf9','cto@lxccoin.com','9e964dc1374c20905db4a3f07334617bf370179b624cfd143a98cae94ecaf131','Subibrol',0,1,1,'2015-01-20 23:05:44','2015-01-20 23:05:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_health`
--

DROP TABLE IF EXISTS `wallet_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_health` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` int(10) unsigned NOT NULL,
  `blocks` int(10) unsigned NOT NULL DEFAULT '0',
  `connections` int(10) unsigned NOT NULL DEFAULT '0',
  `last_updated` datetime DEFAULT NULL,
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'normal, delayed, blocked, inactive',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_health`
--

LOCK TABLES `wallet_health` WRITE;
/*!40000 ALTER TABLE `wallet_health` DISABLE KEYS */;
INSERT INTO `wallet_health` VALUES (1,1,341514,96,'2015-02-01 17:14:54',0,1,'2014-11-09 20:54:33','2015-02-01 17:19:54'),(2,2,95874,5,'2015-02-01 17:14:50',2000000000,1,'2014-11-09 20:54:36','2015-02-01 17:19:51');
/*!40000 ALTER TABLE `wallet_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `currency` int(10) unsigned NOT NULL,
  `address` varchar(34) DEFAULT NULL,
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `hold_balance` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'FLOAT x 100000000',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,1,1,'1H3bPPJMiuGAtarbFVo6MUZ1PWG3pWien4',0,0,'2014-11-10 09:18:11','2014-12-15 00:29:25'),(2,2,1,NULL,0,0,'2014-11-10 09:38:22','2014-11-10 09:38:22'),(3,3,1,NULL,0,0,'2014-11-10 13:24:27','2014-11-10 13:24:27'),(4,4,1,NULL,0,0,'2014-11-23 20:57:42','2014-11-23 20:57:42'),(5,4,2,'18WfYTteVLLYiN4HADcjLcVUMCrXo334uN',0,0,'2014-11-23 21:09:54','2014-11-23 21:15:45'),(6,1,2,'1Dhpw3Rx1hJBhGCYGkchKFUTMjZN7BH4jx',0,0,'2014-12-15 00:28:58','2015-01-20 22:37:05'),(7,5,1,NULL,0,0,'2015-01-20 23:05:44','2015-01-20 23:05:44'),(8,5,2,'NqeBThK6H6B5D4B56bHto4Q2Qwrr6JsXne',1000000000,0,'2015-01-20 23:06:24','2015-01-20 23:29:28');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-02 12:24:16
