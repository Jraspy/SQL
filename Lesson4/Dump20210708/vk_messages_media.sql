-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `messages_media`
--

DROP TABLE IF EXISTS `messages_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages_media` (
  `message_id` int unsigned NOT NULL COMMENT 'Ссылка на идентификатор сообшения',
  `media_id` int unsigned NOT NULL COMMENT 'Ссылка на идентификатор медиа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`message_id`,`media_id`),
  KEY `fk_mm_media_id` (`media_id`),
  CONSTRAINT `fk_mm_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_mm_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Связь сообщений и медиа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_media`
--

LOCK TABLES `messages_media` WRITE;
/*!40000 ALTER TABLE `messages_media` DISABLE KEYS */;
INSERT INTO `messages_media` VALUES (1,1,'2016-05-05 17:01:10','1971-11-05 09:22:18'),(2,2,'2004-04-29 08:51:51','1970-09-07 05:45:47'),(3,3,'2001-06-26 07:59:30','2013-09-04 19:19:27'),(4,4,'2010-08-30 01:40:01','1986-08-23 00:56:27'),(5,5,'2002-04-10 17:00:49','1979-11-11 01:29:49'),(6,6,'1977-10-07 20:55:58','2011-11-19 22:35:01'),(7,7,'1997-12-25 11:40:53','1981-07-27 23:46:28'),(8,8,'1975-09-26 18:41:18','2009-12-28 01:15:13'),(9,9,'2013-01-08 15:15:58','2018-11-06 18:40:52'),(10,10,'1981-06-30 21:52:43','1980-04-16 10:35:32'),(11,11,'1989-02-26 19:34:54','2015-06-11 15:37:52'),(12,12,'1998-04-16 04:06:42','1999-07-06 15:58:58'),(13,13,'2012-04-19 18:19:56','1991-05-21 01:00:10'),(14,14,'1982-10-10 23:25:45','2007-08-12 21:46:28'),(15,15,'1993-08-18 02:13:33','2003-12-15 22:05:08');
/*!40000 ALTER TABLE `messages_media` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-08 15:37:57
