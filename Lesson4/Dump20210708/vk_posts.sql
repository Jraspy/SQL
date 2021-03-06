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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned DEFAULT NULL COMMENT 'Ссылка на идентификатор пользователя который опубликовал пост',
  `community_id` int unsigned DEFAULT NULL COMMENT 'Ссылка на дентификатор пользователя который опубликовал пост',
  `post_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Текст произвольной длины',
  `visibility` int unsigned NOT NULL COMMENT 'Ссылка на вариант видимости поста',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время публикации поста',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_post_user_id` (`user_id`),
  KEY `fk_post_community_id` (`community_id`),
  KEY `fk_post_visibility_id` (`visibility`),
  CONSTRAINT `fk_post_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_post_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_post_visibility_id` FOREIGN KEY (`visibility`) REFERENCES `visibility` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Посты пользователей и групп';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,NULL,1,'2018-04-20 20:29:46','1971-07-22 00:37:40'),(2,2,2,NULL,2,'2015-04-30 17:59:32','1978-11-29 05:46:44'),(3,3,3,NULL,3,'2011-03-01 17:46:03','1978-11-14 15:35:49'),(4,4,4,NULL,1,'1972-02-21 22:10:30','2020-01-18 17:41:21'),(5,5,5,NULL,2,'1978-02-28 23:13:33','1998-02-23 04:50:56'),(6,6,6,NULL,3,'1994-01-04 08:46:39','1977-08-29 18:33:36'),(7,7,7,NULL,1,'1971-12-10 10:39:45','1979-10-04 16:48:52'),(8,8,8,NULL,2,'2021-02-15 23:02:14','1982-06-09 16:45:05'),(9,9,9,NULL,3,'1993-09-05 05:16:46','1989-10-31 12:57:55'),(10,10,10,NULL,1,'1994-08-17 05:05:44','1977-03-23 07:49:33'),(11,11,1,NULL,2,'2003-02-08 21:22:15','2003-01-07 06:03:21'),(12,12,2,NULL,3,'1972-04-18 00:58:27','2005-04-11 08:33:39'),(13,13,3,NULL,1,'1978-08-04 03:47:41','2007-10-05 09:17:23'),(14,14,4,NULL,2,'2012-01-26 01:08:00','1981-09-27 08:36:53'),(15,15,5,NULL,3,'1979-12-25 06:07:36','1989-09-26 07:37:09'),(16,16,6,NULL,1,'1993-07-06 15:26:12','1988-07-27 23:28:56'),(17,17,7,NULL,2,'1996-07-18 14:48:41','2017-01-13 05:45:16'),(18,18,8,NULL,3,'1985-04-02 17:53:24','1973-02-09 07:00:00'),(19,19,9,NULL,1,'1975-04-27 07:31:12','1984-12-13 21:16:46'),(20,20,10,NULL,2,'2002-06-23 04:09:27','1990-04-25 01:12:19'),(21,21,1,NULL,3,'1990-09-05 19:50:08','1985-05-10 21:39:18'),(22,22,2,NULL,1,'2000-02-21 07:28:43','1998-05-16 21:24:16'),(23,23,3,NULL,2,'1993-11-25 05:06:23','1991-06-19 16:19:01'),(24,24,4,NULL,3,'1973-03-25 16:42:22','2012-04-05 14:50:35'),(25,25,5,NULL,1,'2015-05-06 02:53:59','2014-08-30 18:40:38'),(26,26,6,NULL,2,'1993-03-22 16:51:24','2010-09-29 05:15:30'),(27,27,7,NULL,3,'1988-08-16 14:47:20','1978-11-12 22:41:25'),(28,28,8,NULL,1,'1973-08-14 14:03:27','2008-06-09 17:09:22'),(29,29,9,NULL,2,'2011-01-19 15:41:47','1985-07-25 04:17:01'),(30,30,10,NULL,3,'2003-04-15 12:55:55','1974-06-12 02:28:44'),(31,31,1,NULL,1,'1972-10-16 16:31:33','1991-12-05 01:05:47'),(32,32,2,NULL,2,'1993-09-01 06:20:44','2018-04-15 16:34:25'),(33,33,3,NULL,3,'1975-04-05 08:37:53','1973-11-19 07:43:10'),(34,34,4,NULL,1,'1972-01-30 12:22:13','1977-05-22 12:16:20'),(35,35,5,NULL,2,'1990-11-06 03:01:34','2016-12-01 05:26:10'),(36,36,6,NULL,3,'2014-06-10 02:09:29','1979-12-05 23:46:08'),(37,37,7,NULL,1,'2016-09-07 03:29:46','1981-12-25 13:11:36'),(38,38,8,NULL,2,'1978-11-17 11:24:06','2001-03-22 21:42:06'),(39,39,9,NULL,3,'2012-10-13 03:39:38','1987-10-29 18:14:19'),(40,40,10,NULL,1,'1994-01-06 03:22:04','2016-04-02 13:49:25'),(41,41,1,NULL,2,'1995-10-14 20:41:38','1971-05-29 14:31:35'),(42,42,2,NULL,3,'1978-02-10 20:26:14','1994-01-18 23:30:17'),(43,43,3,NULL,1,'2004-10-18 19:09:34','2013-03-13 23:42:11'),(44,44,4,NULL,2,'2005-02-28 02:58:40','2001-12-23 00:46:05'),(45,45,5,NULL,3,'1992-06-08 05:59:42','1999-10-02 13:21:15'),(46,46,6,NULL,1,'2003-06-02 10:04:46','1971-11-12 23:05:34'),(47,47,7,NULL,2,'1985-05-15 06:54:22','2019-10-22 19:39:00'),(48,48,8,NULL,3,'2010-12-17 08:30:39','2005-07-27 09:36:51'),(49,49,9,NULL,1,'1970-05-18 14:11:36','2015-08-22 14:44:03'),(50,50,10,NULL,2,'1990-06-19 04:51:10','1978-05-30 18:54:02'),(51,51,1,NULL,3,'1980-11-16 19:28:42','1992-03-04 13:37:13'),(52,52,2,NULL,1,'2007-03-24 10:17:52','1982-09-06 05:15:23'),(53,53,3,NULL,2,'1994-03-24 02:17:49','1974-07-31 16:03:26'),(54,54,4,NULL,3,'2014-12-11 09:22:23','1997-03-20 18:00:18'),(55,55,5,NULL,1,'1976-01-25 05:15:48','1991-04-30 12:05:21'),(56,56,6,NULL,2,'1990-02-19 13:33:40','1970-09-16 04:46:10'),(57,57,7,NULL,3,'1993-06-30 10:22:23','1993-04-30 11:38:30'),(58,58,8,NULL,1,'1976-01-12 21:36:49','1980-09-21 12:36:57'),(59,59,9,NULL,2,'2012-03-17 15:28:58','1993-06-28 09:13:06'),(60,60,10,NULL,3,'1970-11-27 20:18:02','1982-08-18 00:53:39'),(61,61,1,NULL,1,'2005-02-11 06:11:47','1986-11-22 08:19:27'),(62,62,2,NULL,2,'1986-12-13 09:53:37','1976-10-15 22:51:52'),(63,63,3,NULL,3,'2004-08-04 22:34:53','1995-06-06 10:57:33'),(64,64,4,NULL,1,'2002-02-24 11:46:08','1972-08-27 12:10:27'),(65,65,5,NULL,2,'1986-10-14 04:51:12','1971-04-01 12:41:08'),(66,66,6,NULL,3,'1995-02-18 08:53:21','2013-04-16 22:01:10'),(67,67,7,NULL,1,'1991-01-20 11:19:46','2008-04-06 05:48:27'),(68,68,8,NULL,2,'1975-10-20 12:00:03','1970-07-09 10:39:10'),(69,69,9,NULL,3,'2018-05-12 07:19:19','1999-08-05 11:36:13'),(70,70,10,NULL,1,'1992-08-03 03:53:53','2019-09-24 13:36:47'),(71,71,1,NULL,2,'2008-02-01 12:27:09','1973-11-08 22:10:56'),(72,72,2,NULL,3,'2000-04-15 16:45:13','1976-08-18 07:09:51'),(73,73,3,NULL,1,'1997-09-12 18:26:09','1991-09-16 19:26:31'),(74,74,4,NULL,2,'1974-10-18 05:16:33','1970-04-02 12:00:36'),(75,75,5,NULL,3,'2009-12-04 05:36:19','1982-12-19 15:38:58'),(76,76,6,NULL,1,'1972-07-06 02:27:58','2019-11-11 07:26:31'),(77,77,7,NULL,2,'1992-06-22 06:00:34','2013-03-30 19:08:10'),(78,78,8,NULL,3,'1996-10-25 11:05:32','1994-11-12 19:08:51'),(79,79,9,NULL,1,'2001-05-10 08:15:29','1986-04-30 02:49:18'),(80,80,10,NULL,2,'2007-01-01 15:47:50','1985-12-28 01:14:21'),(81,81,1,NULL,3,'2007-12-16 15:03:40','1987-09-09 04:23:24'),(82,82,2,NULL,1,'2007-02-22 03:30:50','1974-12-11 01:58:34'),(83,83,3,NULL,2,'1982-02-21 12:01:46','2015-06-28 12:38:53'),(84,84,4,NULL,3,'2015-01-13 22:36:05','2017-08-23 03:02:08'),(85,85,5,NULL,1,'1985-10-25 03:17:13','2010-06-16 19:52:16'),(86,86,6,NULL,2,'2018-02-02 01:27:03','1983-09-20 15:51:17'),(87,87,7,NULL,3,'1990-01-12 06:13:06','1988-07-18 16:40:42'),(88,88,8,NULL,1,'1973-05-21 20:38:21','1975-05-21 00:00:07'),(89,89,9,NULL,2,'1983-07-16 14:08:25','1981-12-18 07:33:03'),(90,90,10,NULL,3,'2001-10-14 21:42:42','2010-11-12 13:33:40'),(91,91,1,NULL,1,'1985-05-31 18:35:13','1990-02-08 08:59:27'),(92,92,2,NULL,2,'1977-08-16 07:39:01','2001-08-27 05:21:02'),(93,93,3,NULL,3,'1970-04-25 11:18:20','1997-03-06 18:20:25'),(94,94,4,NULL,1,'1998-05-19 02:30:20','1978-11-25 15:06:20'),(95,95,5,NULL,2,'1974-03-31 20:59:27','2011-11-09 03:59:38'),(96,96,6,NULL,3,'1988-03-02 17:41:34','2018-05-18 07:01:19'),(97,97,7,NULL,1,'1998-04-06 09:05:19','1973-08-13 10:07:59'),(98,98,8,NULL,2,'2010-01-12 10:44:52','1987-10-30 14:14:11'),(99,99,9,NULL,3,'1985-05-11 21:09:52','1981-10-17 02:44:05'),(100,100,10,NULL,1,'1985-12-15 10:14:06','2011-08-27 04:37:04');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-08 15:37:55
