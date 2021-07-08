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
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `media_type` int unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `link` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ссылка на файл',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_media_type_id` (`media_type`),
  CONSTRAINT `fk_media_type_id` FOREIGN KEY (`media_type`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Медиа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,'http://block.net/','1976-05-06 13:14:54','1982-08-18 14:14:30'),(2,2,'http://www.oreilly.com/','2006-10-08 10:38:28','1987-08-17 22:23:22'),(3,3,'http://www.deckow.org/','1998-07-18 03:48:17','2020-08-03 02:45:04'),(4,4,'http://www.paucek.org/','2002-06-29 16:04:33','2002-04-30 00:36:35'),(5,5,'http://www.grantcrist.biz/','1984-12-31 09:09:17','1998-01-19 03:30:38'),(6,1,'http://lebsackyundt.info/','2012-09-21 04:13:02','1983-05-03 18:37:08'),(7,2,'http://www.cronaturcotte.com/','1986-11-20 19:13:27','1976-05-25 21:40:41'),(8,3,'http://daniel.com/','2015-10-20 19:06:32','1979-12-31 11:28:46'),(9,4,'http://www.dubuque.com/','2015-09-04 06:44:31','1998-06-08 10:54:18'),(10,5,'http://lang.com/','1986-04-26 14:14:13','1978-09-17 15:53:03'),(11,1,'http://leuschke.com/','1992-08-02 09:29:36','1975-05-04 08:00:03'),(12,2,'http://www.macejkovic.com/','2017-08-18 22:00:57','2009-04-23 05:44:21'),(13,3,'http://stokes.com/','1970-09-17 21:37:37','1979-01-04 16:50:12'),(14,4,'http://kutch.org/','1988-01-11 21:18:34','1982-02-10 10:28:39'),(15,5,'http://www.rice.com/','2011-10-17 15:46:45','1979-10-25 06:12:21'),(16,1,'http://www.crooksweimann.com/','1988-01-11 10:04:02','2001-04-11 22:29:49'),(17,2,'http://www.purdycole.info/','2012-05-13 23:46:37','1994-09-08 03:30:09'),(18,3,'http://stark.com/','2009-02-21 06:56:19','2020-06-29 14:03:44'),(19,4,'http://beckerpaucek.com/','2014-12-28 02:57:32','1970-10-18 13:33:24'),(20,5,'http://corwin.com/','2017-10-21 16:22:55','1994-08-29 11:36:50'),(21,1,'http://goldnercorkery.biz/','1985-12-07 00:11:04','1982-03-29 23:50:21'),(22,2,'http://mayert.net/','2017-10-18 22:14:44','2008-04-24 21:36:19'),(23,3,'http://www.tremblay.info/','2006-02-17 21:31:49','2006-07-31 12:47:09'),(24,4,'http://www.fisher.com/','1993-08-02 19:41:28','1989-02-05 05:20:34'),(25,5,'http://schroederrice.org/','1974-11-11 12:49:39','1983-04-05 11:47:31'),(26,1,'http://ward.com/','2001-08-10 15:19:14','2010-10-27 00:25:56'),(27,2,'http://www.hammeshessel.com/','2001-02-22 15:30:32','1990-01-01 10:54:46'),(28,3,'http://pollich.com/','2009-04-22 14:54:47','2021-05-21 17:58:47'),(29,4,'http://abbott.com/','1993-02-28 10:16:55','1981-07-24 02:07:56'),(30,5,'http://www.schumm.biz/','2008-11-06 08:24:46','1986-07-01 11:31:18');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-08 15:38:00
