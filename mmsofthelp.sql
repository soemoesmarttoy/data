-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: mmsofthelp
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `com_id` int NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `com_id` (`com_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (24,'Payment Type(ငွေးပေးချေမှုပုံစံ)',0,''),(25,'ကုန်+ကား',0,''),(26,'ကား',0,''),(27,'ကုန်ထားရှိမည့်နေရာ',0,''),(28,'အိတ်အရေအတွက်',0,''),(29,'အလုပ်အမျိုးအစား',0,''),(31,'စပါး',19,'item'),(32,'ဆန်',19,'item'),(33,'ဆန်လတ်',19,'item');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(250) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (0,'Placeholder','',''),(19,'MMSoftHelp','09254286153','Yangon'),(21,'Smarttoy','1234','Taungoo'),(24,'Aung Rice Mill','123456789','Taungoo');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `com_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `com_id` (`com_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (6,'Customer','123456789',19);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cat_id` int NOT NULL,
  `com_id` int NOT NULL,
  `type` varchar(25) NOT NULL,
  `qty` float NOT NULL,
  `unit_price` float NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `com_id` (`com_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (23,'ငွေကြိုပေး',24,0,'pay',0,0,'2022-03-15 02:23:59'),(24,'အ‌ကြွေး',24,0,'pay',0,0,'2022-03-15 02:23:59'),(25,'လက်ငင်းရှင်း',24,0,'pay',0,0,'2022-03-15 02:25:31'),(43,'ဗျော့ထွန်း',31,19,'item',100,8000,'2022-03-19 02:42:35'),(44,'ဂိုဒေါင်၁',27,19,'place',1,100000000,'2022-03-19 02:43:15'),(45,'စပါးမျိုးစစ်',29,19,'unit',46,100,'2022-03-19 02:44:32'),(46,'စပါးအလေးချိန်',29,19,'unit',0,100,'2022-03-19 02:44:58'),(47,'ဆင်းသုခ',31,19,'item',100,6700,'2022-03-19 02:52:40'),(48,'ဂိုဒေါင်၂',27,19,'place',1,100000000,'2022-03-19 02:58:14'),(49,'ဆန်စက်',27,19,'place',1,10000000,'2022-03-19 02:58:31'),(50,'စပါးထည့်',29,19,'unit',0,100,'2022-03-19 04:16:50'),(51,'ကြိတ်စာရင်း',29,19,'unit',0,100,'2022-03-19 04:17:23');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `com_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cus_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `item_id` int NOT NULL,
  `unit_price` float NOT NULL,
  `qty` float NOT NULL,
  `pay_type_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `com_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `com_id` (`com_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Products','Rice and others',21),(2,'ဆက်သွယ်ရန်','ဖုန်း ၀၉၁၂၃၄၅၆၇၈၉\r\nအီးမေးလ် ‌abc@mail.com\r\nလိပ်စာ ၁၂၃,  ၁၂၃ လမ်း, ၁၂၃ ့',21),(15,'ကျွန်ုပ်တို့အကြောင်း','MMSoftHelp ကို နည်းပညာဆိုင်ရာ အခက်အခဲများကို ကူညီဖြေရှင်းပေးရန်နှင့် စျေးနှုန်းသက်သာသော ဝန်ဆောင်မှုများကို ‌‌‌‌‌‌‌‌‌‌‌‌‌‌‌‌‌‌‌‌‌ပေးရန် ရည်ရွယ်ချက်ဖြင့် 2022 ခုနစ်တွင် စတင်တည်ထောင်ခဲ့ပါသည်။',19),(16,'ဆက်သွယ်ရန်','<p><a href=\"mailto:soemoesmarttoy@gmail.com\">soemoesmarttoy@gmail.com</a></p><p>+959254286153</p>',19);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `address` varchar(250) NOT NULL,
  `com_id` int NOT NULL,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `com_id` (`com_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'smt@mail.com','1234','1234','Yangon',19,'admin'),(6,'smarttoy@gmail.com','1234','1234','Singapore',21,'admin'),(7,'soemoethein@gmail.com','1234','1234','Singapore',21,'Sales Manager'),(9,'aung@aung.com','1234','1234567890','Taungoo',24,'admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-19  7:28:47
