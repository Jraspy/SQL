-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Группы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'sed','2003-02-25 04:00:01','2000-06-23 17:34:36'),(2,'atque','2013-06-02 10:07:26','1977-07-01 08:36:40'),(3,'omnis','2007-07-03 20:36:57','2005-05-24 05:10:49'),(4,'dolor','1975-02-08 20:21:44','1975-09-01 15:25:12'),(5,'et','1992-04-28 19:45:40','1992-04-19 06:12:50'),(6,'voluptas','1978-06-18 11:26:30','2009-01-03 05:32:28'),(7,'provident','2006-04-05 10:56:16','2006-08-28 16:26:46'),(8,'distinctio','2008-10-13 14:40:25','1984-11-28 21:33:38'),(9,'dolorem','1990-09-13 12:32:31','1993-01-29 22:16:53'),(10,'consequatur','1979-06-01 16:57:07','2001-02-11 05:49:04');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на группу',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Составной первичный ключ',
  KEY `fk_cu_user_id` (`user_id`),
  CONSTRAINT `fk_cu_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_cu_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,1,'1978-03-30 12:06:56'),(1,11,'2011-01-08 02:47:57'),(1,21,'2000-04-21 00:33:18'),(2,2,'2004-04-16 19:06:50'),(2,12,'1978-05-04 01:51:23'),(2,22,'2018-06-18 10:34:47'),(3,3,'2017-06-27 19:16:20'),(3,13,'1983-06-13 21:08:15'),(3,23,'1982-07-25 04:38:31'),(4,4,'2011-07-15 22:44:53'),(4,14,'2006-04-23 21:52:38'),(4,24,'1977-08-24 03:26:43'),(5,5,'1993-06-21 02:40:13'),(5,15,'1997-05-30 16:42:15'),(5,25,'1989-06-02 08:56:16'),(6,6,'2014-01-04 14:49:53'),(6,16,'2010-07-03 02:42:34'),(6,26,'1993-10-01 05:00:28'),(7,7,'1991-01-14 00:28:21'),(7,17,'2000-05-26 23:31:03'),(7,27,'1974-09-01 21:45:14'),(8,8,'2006-02-06 12:54:05'),(8,18,'1995-04-03 22:45:01'),(8,28,'1977-10-13 22:54:48'),(9,9,'2014-09-27 23:05:56'),(9,19,'1998-11-21 23:33:31'),(9,29,'2021-05-30 13:21:39'),(10,10,'1989-01-18 23:44:09'),(10,20,'2007-08-09 04:32:26'),(10,30,'1975-06-28 01:25:32');
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_types`
--

DROP TABLE IF EXISTS `entity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя сущности',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Справочная таблица с перечнем сущностей, которым можно поставить лайк';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_types`
--

LOCK TABLES `entity_types` WRITE;
/*!40000 ALTER TABLE `entity_types` DISABLE KEYS */;
INSERT INTO `entity_types` VALUES (1,'consequatur'),(2,'autem'),(3,'aut');
/*!40000 ALTER TABLE `entity_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `friendship_status` enum('FRIENDSHIP','FOLLOWING','BLOCKED') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Cтатус (текущее состояние) отношений',
  `requested_at` datetime DEFAULT current_timestamp() COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичный ключ',
  KEY `fk_friendship_friend_id` (`friend_id`),
  CONSTRAINT `fk_friendship_friend_id` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friendship_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица дружбы пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (1,1,'FOLLOWING','2007-02-17 17:33:42','2013-04-24 06:46:16','1979-11-28 11:09:36','1997-12-14 19:14:41'),(2,2,'FOLLOWING','1971-05-22 22:08:22','1985-03-25 04:10:35','1985-02-25 20:30:44','1998-01-18 11:12:34'),(3,3,'FRIENDSHIP','2016-12-03 08:33:51','1994-10-28 05:50:47','2020-07-18 22:03:56','1986-11-08 20:47:55'),(4,4,'FOLLOWING','1981-07-25 09:14:31','2021-05-21 04:19:55','1992-01-22 05:06:14','1980-02-05 01:09:06'),(5,5,'FOLLOWING','1976-01-17 09:30:35','2016-03-05 23:16:42','2005-08-20 10:42:25','1987-08-24 05:51:41'),(6,6,'FRIENDSHIP','2003-05-09 19:40:11','1991-04-15 16:57:09','1975-08-09 21:26:57','1987-02-25 01:46:03'),(7,7,'BLOCKED','2021-07-07 04:52:59','2002-10-12 07:50:28','1980-06-04 09:36:36','1977-10-11 08:25:24'),(8,8,'FRIENDSHIP','1977-02-05 16:32:01','1988-05-15 09:15:42','2012-01-04 18:51:00','1974-05-22 05:32:38'),(9,9,'FOLLOWING','1972-05-08 04:18:47','1977-10-25 17:39:10','1999-05-27 02:28:58','1970-04-17 20:27:39'),(10,10,'FRIENDSHIP','1974-01-16 14:50:20','2018-12-28 19:54:39','1978-01-18 09:59:29','1988-02-02 22:14:37'),(11,11,'FRIENDSHIP','2006-05-07 07:03:54','1998-07-29 17:32:50','1976-03-21 04:30:09','1998-07-19 02:53:22'),(12,12,'FOLLOWING','2016-11-15 14:13:52','1973-04-28 20:19:29','1987-02-20 21:19:28','2000-08-12 08:10:45'),(13,13,'FOLLOWING','2011-07-27 00:21:47','2019-02-25 14:32:43','2014-02-13 19:50:42','1992-03-07 13:27:38'),(14,14,'BLOCKED','1979-10-13 08:47:27','2014-12-18 13:13:29','1981-02-21 09:19:41','1987-06-29 03:58:31'),(15,15,'FRIENDSHIP','1983-04-18 20:58:06','1978-09-22 02:16:45','1984-12-08 20:47:05','2015-06-12 22:51:02'),(16,16,'BLOCKED','1998-02-28 01:04:27','1985-05-03 17:54:58','1978-02-24 04:09:36','1989-07-09 19:42:28'),(17,17,'FOLLOWING','1987-05-30 20:15:06','1970-01-09 17:26:30','1993-06-28 16:25:11','2019-07-21 23:05:55'),(18,18,'FOLLOWING','2000-04-09 17:44:07','1982-10-10 23:14:16','1981-05-28 17:36:14','1983-04-07 17:48:26'),(19,19,'BLOCKED','2007-04-01 21:01:13','2003-02-10 12:43:30','2010-06-20 17:29:16','2011-12-19 12:57:17'),(20,20,'FOLLOWING','1992-03-29 16:32:54','1977-06-26 09:07:01','2021-07-08 00:43:15','2013-11-20 23:25:45'),(21,21,'BLOCKED','2012-03-15 07:41:48','1991-08-22 17:14:20','1985-01-16 07:29:56','2011-10-07 11:20:37'),(22,22,'FRIENDSHIP','2018-05-19 09:28:53','1978-12-13 22:06:42','2005-06-27 04:06:23','2021-02-20 13:29:45'),(23,23,'FRIENDSHIP','1986-11-10 16:04:21','1974-02-05 08:09:18','1988-07-29 03:27:22','1984-09-10 00:45:20'),(24,24,'FRIENDSHIP','1973-07-20 22:48:31','1976-05-16 22:01:48','2013-06-20 08:52:09','1980-08-30 19:20:44'),(25,25,'BLOCKED','2016-06-22 19:06:02','1983-06-21 03:18:14','2014-08-25 10:24:19','2011-09-26 06:09:30'),(26,26,'FOLLOWING','1993-07-30 14:08:52','1991-01-01 09:41:35','1970-01-20 13:30:23','2021-03-25 08:48:00'),(27,27,'FRIENDSHIP','1985-12-25 15:15:45','2019-07-17 00:40:03','1981-09-22 17:47:41','2000-03-05 00:59:38'),(28,28,'FRIENDSHIP','2006-03-26 23:58:29','1989-01-24 16:47:22','2020-11-18 14:31:50','1979-01-18 11:07:42'),(29,29,'FOLLOWING','2006-05-04 21:43:38','1970-04-11 16:02:19','2013-07-11 23:03:13','2004-04-06 15:10:12'),(30,30,'FRIENDSHIP','1992-04-15 02:35:59','2019-11-28 07:00:09','1993-06-28 06:39:55','2006-10-26 23:24:13'),(31,31,'FOLLOWING','1988-11-17 22:12:30','1991-08-18 22:24:46','1995-02-08 05:08:25','2001-10-11 16:21:28'),(32,32,'BLOCKED','2004-01-16 14:55:44','2006-11-05 00:25:18','1984-02-01 12:59:01','1972-12-14 12:00:56'),(33,33,'BLOCKED','2005-04-11 03:55:44','1986-02-05 01:12:32','1981-12-05 02:30:21','1973-08-05 20:02:44'),(34,34,'BLOCKED','1992-07-05 08:46:30','1989-03-03 04:03:39','1971-02-20 04:22:24','2009-03-04 00:23:02'),(35,35,'FOLLOWING','2012-02-27 17:44:07','1970-06-18 02:20:03','1971-04-28 19:09:14','1974-06-27 00:12:47'),(36,36,'FOLLOWING','2016-12-24 04:05:42','1981-07-15 23:44:32','2016-12-23 08:58:46','2004-07-12 14:45:31'),(37,37,'BLOCKED','2019-07-27 02:05:28','1999-05-22 11:39:52','1980-06-27 17:45:09','2012-05-05 05:19:41'),(38,38,'FRIENDSHIP','2012-03-25 18:34:47','1977-08-19 08:45:30','1989-02-26 01:15:35','1970-01-13 12:49:03'),(39,39,'FRIENDSHIP','1999-09-17 17:04:51','2003-12-23 21:07:14','1980-10-31 01:54:07','1989-09-20 05:21:25'),(40,40,'BLOCKED','1977-02-19 18:38:24','2006-03-01 16:06:33','2005-10-29 13:29:39','1977-01-30 23:27:11'),(41,41,'BLOCKED','1977-11-13 03:18:42','1994-12-03 12:55:54','2000-10-29 07:40:51','1986-07-05 06:45:02'),(42,42,'FOLLOWING','2005-12-21 03:24:44','1986-10-28 09:58:43','1999-04-11 17:45:13','1981-01-08 11:11:33'),(43,43,'FOLLOWING','2006-02-02 06:01:20','1970-09-17 20:02:43','1985-09-01 09:05:23','2013-09-29 14:26:18'),(44,44,'BLOCKED','1986-09-01 23:05:05','1985-02-27 05:20:20','1992-12-24 18:01:08','1974-10-19 15:36:20'),(45,45,'BLOCKED','2009-09-05 19:09:55','1993-07-29 09:46:13','1994-12-05 06:30:13','1986-06-10 08:29:03');
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя лайкнувшего пост',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на другую сущность',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_likes_entity_name` (`entity_id`),
  CONSTRAINT `fk_likes_entity_name` FOREIGN KEY (`entity_id`) REFERENCES `entity_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица лайков';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (41,1,1,'2012-07-07 07:01:18','1989-02-16 02:22:08'),(42,2,2,'1972-07-17 19:05:57','2002-07-16 15:37:16'),(43,3,3,'2005-08-21 12:01:47','1994-11-02 09:14:49');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `media_type` int(10) unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `link` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ссылка на файл',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
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

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип медиайла',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип медиа контента';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'pariatur'),(2,'fugit'),(3,'quas'),(4,'debitis'),(5,'eligendi');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `message_header` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Заголовок сообщения',
  `message_body` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_delivered` tinyint(1) NOT NULL COMMENT 'Признак доставки',
  `was_edited` tinyint(1) NOT NULL COMMENT 'Признак правки заголовка или тела сообщения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_messages_from_user_id` (`from_user_id`),
  KEY `fk_messages_to_user_id` (`to_user_id`),
  CONSTRAINT `fk_messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица сообщений пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Quo et repellendus nobis quia dolore voluptatem consequuntur. Ad adipisci voluptate perspiciatis accusamus delectus. Unde aut aut qui quis non molestias aspernatur.','Non ipsum eos nihil tenetur. Dolorum eos et corrupti ut sed.',1,0,'1997-08-26 23:56:24','1992-07-02 18:07:58'),(2,2,2,'Sit corporis dolor beatae accusamus illum voluptates. Reprehenderit est rerum debitis doloremque. Ut itaque id quo molestias provident aperiam sint. Non illo inventore cupiditate odit. Quasi molestias quod consequatur cupiditate tempore rem iusto.','Sit necessitatibus illum esse necessitatibus est nisi neque. Exercitationem hic voluptatum qui vel est aliquid delectus voluptatem. Quo quas debitis quis qui nesciunt odit hic itaque.',0,0,'2005-12-03 11:25:34','1977-09-24 05:53:34'),(3,3,3,'Tempore quae deserunt doloremque quia deserunt aut. Ea error soluta est et. Necessitatibus voluptates accusantium recusandae rerum in non.','Illum fugiat dignissimos alias excepturi est. Iste autem aut nostrum recusandae. A deleniti eius eum minima numquam. Ipsam incidunt sed vero.',0,0,'1973-02-22 00:42:14','1992-05-17 12:17:05'),(4,4,4,'Et doloremque aut aut ipsa. Qui culpa rem et molestias. Non voluptas ipsum exercitationem corporis voluptatem omnis.','Repudiandae ipsa natus neque quos est. Omnis veniam facilis sint illo blanditiis neque. Placeat et nam laborum a eos amet eligendi corrupti. Soluta et mollitia blanditiis et expedita.',0,0,'1970-05-27 19:04:02','2011-02-11 15:35:31'),(5,5,5,'Hic temporibus voluptatem quos. Natus sit quod ab aut illo. Nihil temporibus aspernatur voluptatem dolorem esse. Molestiae amet similique explicabo ullam nihil laboriosam. Quis id sint quisquam qui similique praesentium.','Quo dolore quisquam alias maiores dolor quod quam. Omnis fuga doloribus voluptatem debitis earum assumenda id eius. Autem quaerat omnis vel est voluptas dolorem. Enim facilis qui aut blanditiis ducimus. Voluptas repellat aut a vero sed et.',0,0,'1972-07-26 09:30:00','1990-09-14 11:22:18'),(6,6,6,'Impedit in laboriosam adipisci corrupti repellat eos cupiditate exercitationem. Eos maiores est odio ut alias. Quas aut earum eligendi rerum. Id sunt architecto sunt aut dolorem ab quia. Quis nostrum illum quaerat nostrum et in eum.','Natus architecto ratione dolores totam libero qui. Soluta consectetur ab libero aut officia. At aut animi odit illo eius officia. Velit repudiandae in ratione ipsam ut veritatis sed.',1,0,'2004-04-24 09:18:03','1979-07-20 14:28:16'),(7,7,7,'Possimus quod quo dolor ut illum aperiam ducimus. Nemo et expedita hic dolores dolorum perspiciatis. Magnam ipsam nam officia asperiores sed.','Ut ducimus sed voluptatum nesciunt. Eum placeat eum blanditiis accusamus. Voluptatem possimus accusamus ut nulla et. Alias voluptatem consequuntur iusto ex est nam. Ratione rerum sed dolor ab qui.',1,0,'1986-01-18 05:05:47','1974-12-18 02:39:26'),(8,8,8,'Magni et non ut expedita accusantium provident explicabo. Nihil quibusdam omnis pariatur. Similique laborum qui repellat nobis omnis.','Ut maxime fugit quia iure neque. Sunt aut optio et illum et. Placeat voluptas dolores quas architecto nostrum vel. Quo velit magni ullam odit iste.',0,0,'1997-09-24 16:59:04','1972-02-27 08:14:14'),(9,9,9,'Provident rerum qui sint dolorum vero est et. Laudantium rerum et quaerat qui molestiae fuga fugiat alias.','Ratione natus quos ut tempora non velit est molestiae. Magnam vel repellat sed omnis optio omnis impedit. Voluptatibus eius incidunt ullam nihil.',0,0,'1970-04-14 07:42:29','1971-08-11 06:17:35'),(10,10,10,'Beatae vero sed voluptatem possimus iste quis officiis. Beatae corporis ea quia in. Libero perferendis accusantium qui corrupti laborum aut voluptatum repellendus.','Sunt ex veritatis est mollitia sint a voluptatem ut. Non ut voluptatem voluptates. Quia et voluptas voluptatibus debitis neque. Rem dignissimos hic tempora modi explicabo modi totam corrupti.',0,0,'1971-03-23 11:01:40','1989-05-29 02:29:26'),(11,11,11,'Quaerat illo inventore sed accusantium accusamus. Consectetur velit nihil culpa molestiae est ad non sed. Dolorem consectetur itaque praesentium quibusdam numquam pariatur earum.','Eligendi accusamus nisi omnis vel. Et aut itaque quo dolores corrupti. Laboriosam consectetur maiores architecto dolorem id. Iusto deserunt porro ut est modi sint dolorum et. Repudiandae ipsa voluptate quibusdam officiis.',0,0,'1988-05-07 03:39:29','2003-07-13 10:20:36'),(12,12,12,'Nisi voluptatem laboriosam similique voluptatem harum distinctio in. Error facere autem provident est sunt. Voluptatem maxime accusamus nesciunt totam. Deserunt et id voluptatum similique.','Enim quisquam dolorem natus repudiandae in et. Dolores maiores quibusdam hic iure. Dolores qui enim tempore vitae.',1,0,'2004-06-11 05:21:06','1982-09-13 14:39:51'),(13,13,13,'Nihil enim esse quam dolorem minima blanditiis consequatur. Sapiente natus aut sequi ullam culpa accusantium. Sint ipsum sunt et commodi ea. Repellendus quidem nobis distinctio exercitationem sunt et numquam.','Dolorem quis explicabo ratione possimus magni accusamus. Est voluptas qui qui ut ducimus. Ipsa sit deserunt pariatur omnis. Doloremque qui non et dicta nisi.',0,0,'1977-06-08 03:22:54','2004-11-28 19:42:22'),(14,14,14,'Minima accusantium illo et et qui ducimus et enim. Et sed tempore voluptatum hic reiciendis occaecati aut. Ut quod ducimus fugit reiciendis ut dolor quos.','Sunt explicabo magnam qui pariatur molestias. Fuga velit quo doloribus qui quia. Aspernatur ipsa tempora animi officia quam est. Quos libero non quis illo.',1,0,'2016-12-14 00:31:12','1973-11-11 13:24:10'),(15,15,15,'Rem qui aliquam est dolor quisquam. Laborum rem necessitatibus quibusdam harum ipsa possimus qui. Quasi consequuntur distinctio sint.','Accusamus consequatur incidunt officiis nihil. Voluptatibus similique aperiam eum. Dolor suscipit aut modi quae consequatur libero doloribus.',1,0,'2001-01-11 14:55:17','2002-09-30 03:51:14'),(16,16,16,'Aperiam architecto vitae non perferendis. Nemo blanditiis pariatur nihil possimus eveniet doloremque. Consequuntur omnis qui odit ea. Omnis suscipit et rerum maxime.','Id aspernatur quibusdam ab mollitia quisquam enim. Doloremque voluptas rem incidunt commodi necessitatibus doloribus sequi. Impedit laboriosam optio provident impedit. A officiis molestias quis beatae similique ut.',0,0,'2004-07-03 23:02:52','1992-11-11 23:22:45'),(17,17,17,'Quia praesentium molestiae nesciunt in culpa. Iure consequatur dolorem corporis quaerat error. Fugit earum recusandae aut iusto iure enim rerum.','Earum repellendus et autem minima eligendi autem aspernatur. Ut officiis ut atque ut delectus est. Consectetur id rerum et unde recusandae et dolores. Omnis voluptatum eos voluptatibus et non. Sit accusantium a enim aliquid est.',0,0,'2011-08-18 23:13:20','2010-03-31 19:14:06'),(18,18,18,'Voluptate ut eius enim labore. Aperiam voluptas autem exercitationem qui. Esse error repellat ex earum minima est. Voluptatibus eos quia eaque laboriosam enim.','Unde est asperiores temporibus autem sed tenetur est. Qui eius quos saepe corrupti ab et.',1,0,'2014-11-03 00:46:53','1973-10-02 05:19:57'),(19,19,19,'Praesentium sed dolores laudantium rerum maxime cupiditate quisquam. Beatae quibusdam deserunt modi id itaque.','Laudantium molestiae labore sunt deserunt necessitatibus. Incidunt quis voluptatem dolor sit aut provident consequatur.',0,0,'1973-07-12 05:24:00','2009-08-17 00:42:23'),(20,20,20,'Eius et accusantium aut atque eius. Ea debitis qui et itaque recusandae enim. Sequi voluptas aspernatur a velit placeat nihil alias. Quasi omnis alias consequatur sunt.','Aut asperiores natus recusandae voluptate. At quis autem voluptas ullam enim sed. Perferendis nesciunt optio est quos sed.',1,0,'1995-10-13 01:45:17','2001-07-14 17:00:20'),(21,21,21,'Tenetur illum ut ab et voluptates quos et. Eius qui esse iure odit. Et magnam sit necessitatibus accusamus. Quia dolorem ipsum eum ipsam labore voluptatem tempora.','Consectetur voluptas ut repellendus voluptatem voluptatum. Beatae autem et dolore nihil. Temporibus omnis expedita delectus placeat impedit in. Natus nostrum est non et.',1,0,'2000-09-02 22:43:02','2000-04-20 03:05:07'),(22,22,22,'Eligendi dolore dolorum perferendis. Inventore hic omnis omnis nemo sint deserunt. Aperiam consectetur modi fugit rem similique velit aliquid.','Temporibus quam architecto dolorem incidunt nobis. Est atque ipsum eius voluptate voluptas assumenda voluptas.',0,0,'1982-03-25 15:20:04','2017-02-23 09:30:33'),(23,23,23,'Minima accusamus consequatur nulla officiis neque dolores a beatae. Quia amet impedit illum eveniet nobis dignissimos. Et perspiciatis repellat expedita qui earum quia expedita quo. Sed dicta quis reprehenderit magni.','Est aut quasi doloremque excepturi id. Deserunt neque dolorum neque sequi voluptatem dolorum ut alias. Vel rem magni culpa dolorem aspernatur porro et rerum.',1,0,'1987-10-07 05:46:02','1988-12-04 09:12:11'),(24,24,24,'Est beatae sunt aut autem deserunt veniam ipsa. Impedit placeat sit pariatur perferendis minus sunt.','Et aut molestiae sint cupiditate quod ut neque ullam. Debitis sed beatae est necessitatibus dolorem modi laborum dicta. Quo fuga nostrum consequatur. Voluptate distinctio assumenda aperiam unde.',1,0,'2001-05-30 22:46:44','1990-07-10 16:31:26'),(25,25,25,'Eos facilis itaque neque ut aut occaecati. Et est rerum ut dolorem occaecati deserunt omnis. Qui molestiae possimus exercitationem sint et voluptas et qui. Numquam nulla nobis voluptatem similique est qui. Nobis odit eos eum ut.','Corporis ut illo iusto sit voluptatem modi ut. Aut quae quia ex maiores. Praesentium neque quos cupiditate quod totam eos provident.',0,0,'2011-09-28 11:51:57','2010-04-21 23:07:27'),(26,26,26,'Sunt aut et qui reiciendis molestiae. Asperiores iusto excepturi qui suscipit excepturi repudiandae culpa earum. Corrupti animi praesentium sequi in quae quae. Repellendus eius est non ipsum quis ea.','Sit voluptatem aut et aut. Ut eum et a nemo reprehenderit iure aliquam sint.',1,0,'1983-10-20 12:52:25','1993-03-10 08:13:39'),(27,27,27,'At voluptas vel quae accusantium. Laudantium eveniet veritatis laboriosam consectetur. Incidunt laudantium ea sapiente quo et. Totam a deserunt quisquam suscipit perferendis.','Ea repellendus aut quia id consequatur autem ratione. Ut amet unde consequatur. Deleniti quos voluptate possimus sunt rem deleniti laborum corporis.',0,0,'1993-08-18 06:00:16','1983-03-23 19:49:55'),(28,28,28,'Incidunt labore adipisci quaerat quia totam. Dignissimos laborum non dolor voluptate odio qui. Quidem incidunt et mollitia consequatur nesciunt consequatur aperiam sunt. Distinctio tenetur ipsum consequatur sed sit.','Non optio reprehenderit assumenda. Deleniti sit quia qui minima quis. Rem rerum illo nam consequatur. Ipsum fugiat explicabo earum dolorem perferendis est alias eligendi.',0,0,'2004-06-26 23:05:51','1994-11-28 05:31:44'),(29,29,29,'Ducimus perferendis et doloremque blanditiis voluptatum ex sunt. Quae est aut pariatur nesciunt rerum. Perspiciatis et est illum tempore debitis asperiores repellat. Et earum nobis et ea consequatur.','Ducimus dolores voluptate quidem et optio architecto harum. Perferendis nihil repudiandae quibusdam id eos consequatur deserunt. Perspiciatis accusamus aliquam eaque natus quis illum. Rerum autem qui ipsam fuga nostrum laboriosam veniam.',1,0,'2002-02-16 23:22:11','2019-02-26 04:40:21'),(30,30,30,'Deleniti porro ad illo quia. Quasi est aliquid eum voluptatem placeat at ducimus. Tenetur optio placeat quo aut consequatur nemo tenetur.','Aut facere placeat nesciunt aliquam quia enim. Odit tenetur et soluta ipsa excepturi.',0,0,'1986-04-28 14:09:43','1980-03-20 18:10:43'),(31,31,31,'Vero repellendus laborum aliquid similique voluptatem nesciunt alias. Nam ipsam qui voluptas fuga aut ut. Consequuntur unde qui quia quia.','Quae alias rem illo ipsam est voluptate nulla. Sit dolores expedita soluta mollitia nam. Sint sed corporis voluptas dicta reprehenderit fugit iusto esse. Provident neque natus ipsam temporibus occaecati.',1,0,'1987-01-13 00:52:26','1993-03-06 23:24:34'),(32,32,32,'Harum sed eius incidunt blanditiis voluptas eos. Odit sed voluptas aut. Neque quas quasi neque et. Nisi temporibus debitis consectetur aliquam esse.','Harum tempore asperiores est hic facere eum temporibus. Accusantium esse ut enim rerum deleniti.',1,0,'2015-03-31 17:02:27','2019-01-11 06:06:53'),(33,33,33,'Dolorem id beatae quod odio rem consequatur vel. Maiores ea eius rerum facere nam nemo. Repellat alias consequatur est tempora tempora soluta doloremque.','Reprehenderit error accusamus ab quis accusamus aut sapiente. Molestias consequuntur illum voluptas sed repellat est debitis. Enim omnis inventore consequatur autem blanditiis aut. Suscipit modi iure assumenda veritatis ea dolor sit. Itaque saepe cum consectetur quas.',0,0,'1992-01-18 01:17:53','1983-01-16 12:01:41'),(34,34,34,'Aperiam maiores aut quos qui consequuntur inventore qui. Et architecto odit unde quo ut. Nulla ipsum consequatur dignissimos aliquid placeat reprehenderit.','Suscipit consequatur rem deserunt minus fuga blanditiis. Voluptatum id nobis repellendus sed et aut odio odit. Est est eius ullam et ut molestias ipsum eos. Ut vel nam sit animi deleniti. Ut magni illum omnis ratione eveniet voluptatem.',0,0,'1976-12-07 17:42:55','1989-10-04 17:27:38'),(35,35,35,'Ducimus atque labore in nam non. Natus deserunt iste delectus dolor quia quia ut. Dicta numquam eos fugiat animi ad. Voluptas omnis sit similique libero magni.','Maxime nesciunt ullam commodi id. Nesciunt laboriosam non nostrum. Repellendus non possimus distinctio asperiores. Neque quam saepe veniam ut error autem nobis.',0,0,'2006-08-15 04:01:46','2002-08-17 16:31:02'),(36,36,36,'Qui facere voluptas fuga temporibus cum dignissimos. Quasi rem soluta distinctio animi eligendi quis. Quis harum ad totam consequuntur. Occaecati asperiores minus nihil eveniet inventore repellendus.','Enim doloremque repudiandae exercitationem libero delectus repellendus qui dolor. Voluptate ipsam enim voluptates officiis aut et. Laborum ullam odio cum tempore voluptas dolorem. Ad corporis sit quod omnis nobis autem. Aliquid atque ab recusandae rem.',1,0,'1981-01-31 09:54:24','1971-08-20 13:16:24'),(37,37,37,'Veniam assumenda amet voluptatibus. Id sunt in eligendi expedita magni fugiat dolorem. Non quaerat dolorum officiis exercitationem itaque repellat culpa. Ut nobis culpa odit dolorem alias in nemo.','Sit voluptatum explicabo et. Neque qui ipsa quia labore minima voluptatum. Optio esse a voluptatem adipisci natus excepturi amet quia. Officiis autem aut ab molestias architecto enim commodi.',1,0,'2019-12-07 14:49:51','1994-11-07 12:33:01'),(38,38,38,'Quis est aut quasi consectetur. Reprehenderit est unde possimus unde. Esse ex a enim aliquid et voluptas. Explicabo eaque provident ut molestiae quibusdam facilis.','Sit ut ullam ut mollitia. Eveniet nobis exercitationem minima quisquam enim animi consequatur. Nihil officiis corrupti tempora illo laborum. Doloremque neque et repellendus incidunt quas est.',1,0,'1974-10-10 23:48:08','1996-11-03 00:41:39'),(39,39,39,'Voluptatem est id ipsum nihil consectetur perspiciatis. Dolor provident fugiat non non voluptatem aut dolor magni. Eos id ipsum modi veniam aliquam explicabo. Voluptatum est nisi ducimus velit necessitatibus.','Dignissimos fugit saepe quibusdam possimus omnis voluptates. Esse vel dolorem aspernatur nisi. Temporibus quam voluptatibus mollitia reiciendis reprehenderit voluptatem sunt.',0,0,'1985-12-05 08:21:43','2017-06-19 18:17:41'),(40,40,40,'Reiciendis distinctio consequatur accusantium dolores vitae. Modi sequi eaque laboriosam sunt libero.','Et perspiciatis laboriosam quasi tempore. Quasi aut saepe sed. Qui eius qui voluptas adipisci provident asperiores qui. Qui fugiat qui eos doloribus eaque delectus.',1,0,'1971-06-21 11:20:55','1981-10-08 13:29:58'),(41,41,41,'Eos occaecati quam sint eum ipsa consequatur. Soluta et ipsa cupiditate vitae distinctio saepe. Ut quidem unde ad sunt eligendi animi eos. Praesentium illo impedit aut.','Dolore quasi dolores laudantium vero. Ex praesentium eaque tempora occaecati voluptatem. Impedit at vero cumque sint aut sint similique. Eveniet culpa ea voluptatem alias voluptates enim voluptas.',0,0,'2019-08-16 19:50:49','2021-06-12 22:34:14'),(42,42,42,'Reiciendis ut qui quos illo non in. Veniam error deserunt dolores rerum. Non qui facere sit et quidem et minima at. Reiciendis quia minima sed.','Ut adipisci dignissimos saepe aliquid. Aut minus et maxime a. Qui qui eligendi qui assumenda quia dolore. Illum eius provident quibusdam ab ut veritatis qui.',0,0,'1994-10-26 16:16:25','2003-06-21 09:12:02'),(43,43,43,'Sed enim illo eligendi recusandae est harum. Eos inventore tempora illo aut. Voluptates voluptatem amet error minus. Ipsa odio atque officiis voluptas.','Rerum magni asperiores et. Ex tempora assumenda voluptatum ullam sint eos. Eos iste eos in fuga voluptatem et.',0,0,'2015-08-30 05:33:20','1973-03-15 14:13:34'),(44,44,44,'Quaerat vel nihil est soluta. Enim aut repellat sint quisquam. Corrupti ipsa nam inventore minima dolores ducimus expedita reprehenderit.','Vel debitis minus et minus deleniti. Cumque eos eius et architecto perspiciatis aut numquam expedita. Et dolor quis at sunt.',1,0,'1984-05-20 22:42:48','1978-04-14 05:13:52'),(45,45,45,'Minus at sequi cumque quisquam repudiandae quam quas. Est molestias voluptate reprehenderit sequi aut. Corrupti voluptatum eius autem amet itaque eaque quis. Dolorem labore saepe quasi et similique reprehenderit dicta et.','Dolor tempora sit dolorem possimus eveniet. Sint qui debitis voluptatum exercitationem accusantium error. Praesentium amet asperiores et unde. Consequatur possimus a voluptatem dolorum.',1,0,'1983-02-06 22:00:43','1973-10-13 06:01:59'),(46,46,46,'In officiis repellat voluptatem quo. In omnis enim placeat sit voluptates. Corporis rem excepturi commodi aspernatur architecto odio aut. Laudantium tenetur ex incidunt odit voluptate perferendis est. Sapiente deserunt qui minima doloremque.','Accusantium aut qui voluptatem et. Et et odio mollitia ut fugiat ab inventore sit. Est earum nulla earum voluptatem voluptas sed illo ad. Sit iste vel iusto praesentium quas minus eius. Repellendus quia dolores quia qui.',1,0,'2000-05-25 09:54:39','1999-08-30 11:21:56'),(47,47,47,'Veniam eos nobis provident laudantium qui culpa consequatur qui. Itaque tenetur mollitia ullam dignissimos eos sint. Omnis ut dolor eum officia id. Iure dolor repellendus aut laborum aliquam atque facere.','Ullam velit assumenda dolorem. A consequatur facilis quos ipsam aliquam. Fugiat qui et non soluta error.',0,0,'2015-08-15 05:05:13','2011-06-18 13:00:33'),(48,48,48,'Ut nihil modi suscipit. Aspernatur sed perferendis officia at in. Nihil ea et quo et et.','Facere enim nostrum eos quae. Rerum eaque deleniti ipsam magni vitae velit omnis. Esse et explicabo sapiente sed consequatur.',0,0,'2000-12-24 09:26:07','2020-01-11 20:22:18'),(49,49,49,'Praesentium autem dolorem quo aut. Non aut et unde ut qui. Animi esse quia consequatur ea similique et illum.','Nihil nihil autem praesentium dolor necessitatibus enim magni. Rerum enim cupiditate odit eligendi eos. Placeat aliquid odit non incidunt. Non at delectus rerum.',1,0,'2008-04-14 00:53:11','1997-07-28 12:36:46'),(50,50,50,'Odit saepe quibusdam repudiandae dolorem. Enim minima quo unde aut dolor qui fuga et. Perferendis debitis odio ea saepe nam voluptatem et quos. Mollitia corporis pariatur laboriosam earum rerum similique nihil.','Est ea quia enim temporibus iste. Nemo quos eos tempore inventore est vel. Dolorum est delectus quas ut aut et repudiandae. Reprehenderit sed eos non odio eum. Libero omnis tenetur labore id libero incidunt sunt.',0,0,'2012-07-08 18:33:45','2001-09-20 03:56:20'),(51,51,51,'Facilis minima ut totam unde voluptatem qui quo aliquam. Omnis rem omnis dolorem voluptas. Asperiores recusandae labore rerum omnis.','Dolores soluta repudiandae aut quaerat. Reiciendis vitae exercitationem harum et quaerat quod. Ratione veritatis tempora ut quisquam dignissimos vero quia. Consequatur sunt voluptas voluptas non vel aut.',0,0,'2007-03-15 03:19:16','2021-05-13 10:11:22'),(52,52,52,'Quis rem culpa ab asperiores sit quo. Neque delectus non quia veniam atque natus.','Repudiandae nostrum cum magnam. Itaque doloribus perspiciatis quod non dolor autem et. Omnis quis autem reiciendis occaecati quibusdam maxime voluptatem. Quae voluptatibus porro rerum.',0,0,'2008-06-20 19:21:05','1974-03-05 18:34:10'),(53,53,53,'Nisi maxime consequatur aliquam. Quo harum doloribus sed inventore fugit consectetur iusto magni. Et minima sit et ullam. Saepe autem nemo magni soluta exercitationem voluptas.','Incidunt itaque cum doloremque. Et maxime dolorem eligendi dolorem ut ab. Id quasi ab fugit omnis ipsam in.',0,0,'1978-05-21 16:49:50','1973-03-25 18:44:38'),(54,54,54,'Impedit numquam quas qui corporis quia maiores et reprehenderit. Sapiente esse blanditiis omnis in.','Et quaerat est dolorum odio. Et unde iusto quia aspernatur quidem porro. Rem totam eum quasi quis dolores. Voluptate architecto mollitia aspernatur nemo dignissimos sed.',0,0,'2016-07-05 20:10:24','1996-07-30 06:01:52'),(55,55,55,'Quas placeat eius cupiditate explicabo architecto. Ea necessitatibus et sint. Omnis eos adipisci a sint. Perspiciatis autem et dolor dignissimos quisquam officia. Quo quis earum ea asperiores quo minima porro.','Et ea et asperiores. Assumenda et eaque quidem soluta natus. Iusto perferendis laboriosam nobis provident harum nihil.',1,0,'2015-07-16 21:46:21','2002-11-07 17:36:02'),(56,56,56,'Quia quibusdam voluptatem voluptatem illo. Fugiat nisi itaque est qui dolorum. In maiores sequi et exercitationem error.','Voluptatem tempore est eaque enim voluptatem. Voluptatum rem eligendi autem saepe asperiores non voluptatem. Eveniet perferendis soluta harum vitae corrupti.',0,0,'1979-04-04 23:51:09','1997-07-03 07:13:46'),(57,57,57,'Qui assumenda facilis labore ullam. Eum rerum voluptatem ea debitis similique ipsum et voluptatum. Non voluptas aut error dolores.','Cupiditate inventore sapiente aut vero quis hic. Voluptate eveniet omnis iste quia modi et sed sed. Quod et error nemo facere.',1,0,'1993-01-02 17:02:04','2014-06-17 00:22:17'),(58,58,58,'Et sequi facilis laboriosam et minus non doloremque. Facilis maiores qui labore et ipsam modi est. Sed eum aut molestiae dolorum ut doloribus odit.','Id assumenda sit et natus. Nemo dolore officia molestiae corporis sunt qui aut. Unde ipsam incidunt possimus molestiae.',1,0,'1979-07-18 07:33:51','2003-12-05 09:42:07'),(59,59,59,'Recusandae ut tempora est qui accusantium sunt. Placeat facilis reprehenderit natus ea. Qui excepturi incidunt nulla adipisci. Voluptatem non et eos velit.','Qui repellendus sint sit vero. Amet voluptatem quisquam est natus quos. Et omnis quidem consequatur quisquam molestias explicabo quis.',0,0,'2014-12-13 21:31:34','1981-11-28 12:09:56'),(60,60,60,'Dignissimos autem tempore quo deserunt vero. Quidem incidunt dolores dolorem dolor. Soluta possimus perferendis et exercitationem. Exercitationem molestias natus eos et non quos veritatis et.','Perferendis ut voluptas quis eaque. Voluptatem accusamus sit atque animi ad maxime soluta. Veritatis corrupti omnis cumque deleniti iusto. Cupiditate in ut expedita ea architecto.',0,0,'1978-04-04 08:36:38','2011-07-13 14:33:47'),(61,61,61,'Perspiciatis quis necessitatibus hic inventore corrupti. Minus expedita deleniti dolorum doloremque. Voluptatem quod maxime corrupti voluptas dolorem repudiandae qui omnis.','Eius quidem dolorem id accusamus odit. Qui molestiae impedit dolorem est.',0,0,'1992-01-31 05:55:46','1996-06-22 20:06:46'),(62,62,62,'Voluptatem molestiae quo quia cum sit eos. Consequatur officiis incidunt modi perspiciatis provident possimus debitis. Quia fugit magni ea sunt. Qui qui maiores eveniet totam repellendus. Maiores explicabo neque dolorem aut vel natus.','Dolorem aut quasi nesciunt eos ut. Et voluptatum quia sed voluptatem dolorem vel. Iusto veritatis aperiam sint incidunt officiis voluptatibus.',1,0,'1972-11-17 03:44:45','2004-08-23 16:42:22'),(63,63,63,'Pariatur qui dolores voluptas saepe alias culpa. Quasi alias repellat rerum exercitationem est. Aliquam aut illo dolores culpa architecto.','Id aliquam placeat et cumque voluptates expedita quis. Quasi voluptas rerum deleniti occaecati. Recusandae et et dolore omnis est laborum omnis. Quia repudiandae quae temporibus vel.',0,0,'1981-07-28 14:19:58','1999-06-20 14:12:16'),(64,64,64,'Autem facere sit cum consectetur eveniet. Temporibus sed non tenetur in omnis.','Distinctio veritatis omnis ut modi velit nisi similique et. Qui deserunt non et corrupti soluta. At doloribus non hic et rerum asperiores voluptatem odio.',0,0,'1971-10-07 09:23:18','2005-03-14 01:49:24'),(65,65,65,'Laborum impedit architecto in a alias fugit. Dolor distinctio placeat excepturi natus illum est velit.','Mollitia ut minima enim modi qui. Eos facilis nostrum asperiores officiis aut aspernatur officia. Dolore libero accusamus earum qui. Sint fugiat inventore repudiandae repellendus.',1,0,'2000-05-09 10:32:41','2000-02-24 20:09:57'),(66,66,66,'Odit amet tempora at expedita officia recusandae. Et minima qui et rem. Consequuntur sint in ut ipsum porro adipisci voluptas vel. Et quia magni eius est.','At voluptatum omnis temporibus voluptatem deleniti officia ex debitis. Incidunt et voluptates omnis ab sint aspernatur quod qui.',0,0,'1983-11-09 22:12:04','1971-04-03 15:21:42'),(67,67,67,'Natus molestiae ut ut neque. Magni deserunt sunt qui sequi est sit. At reiciendis ipsa nulla maiores tempora rerum iusto. Saepe dicta quo sed.','Sequi delectus distinctio fugiat velit. Officia quidem asperiores sed aperiam fugiat nihil vero. Quod quisquam maiores ratione blanditiis. Saepe dolor numquam quo temporibus non nesciunt.',1,0,'1971-11-11 13:54:31','2006-09-04 06:54:56');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_media`
--

DROP TABLE IF EXISTS `messages_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_media` (
  `message_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор сообшения',
  `media_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор медиа',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
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

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на идентификатор пользователя который опубликовал пост',
  `community_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на дентификатор пользователя который опубликовал пост',
  `post_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Текст произвольной длины',
  `visibility` int(10) unsigned NOT NULL COMMENT 'Ссылка на вариант видимости поста',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время публикации поста',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
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

--
-- Table structure for table `posts_media`
--

DROP TABLE IF EXISTS `posts_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_media` (
  `post_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор поста',
  `media_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на идентификатор медиа',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`post_id`,`media_id`),
  KEY `fk_pm_media_id` (`media_id`),
  CONSTRAINT `fk_pm_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_pm_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Связь постов и медиа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_media`
--

LOCK TABLES `posts_media` WRITE;
/*!40000 ALTER TABLE `posts_media` DISABLE KEYS */;
INSERT INTO `posts_media` VALUES (1,1,'2000-12-20 04:58:29','1995-12-05 17:00:46'),(2,2,'2020-06-08 12:00:34','2007-09-07 16:26:51'),(3,3,'1988-12-16 07:05:37','2012-05-21 00:04:12'),(4,4,'2013-09-16 17:48:16','1977-10-12 03:15:08'),(5,5,'1974-04-30 06:38:01','2020-09-02 21:35:51'),(6,6,'1976-07-17 23:37:36','1976-09-01 05:25:31'),(7,7,'1970-07-15 07:48:17','2012-10-30 12:49:47'),(8,8,'1981-01-13 13:32:37','2012-12-29 17:13:32'),(9,9,'2015-06-18 21:54:44','2007-03-01 01:05:33'),(10,10,'1988-12-29 18:38:48','2017-08-25 05:40:21'),(11,11,'1982-07-31 20:28:20','2010-08-02 17:34:01'),(12,12,'2017-11-28 12:55:49','2020-01-19 19:33:03'),(13,13,'1978-07-20 07:43:41','1977-05-26 20:36:44'),(14,14,'2017-02-06 13:10:13','1987-02-13 23:17:09'),(15,15,'1975-10-30 03:19:43','2006-08-07 16:25:31'),(16,16,'1982-01-02 18:48:42','2015-11-29 13:10:24'),(17,17,'1990-08-29 06:26:36','1977-04-20 16:36:28'),(18,18,'2019-07-23 10:25:01','1985-09-28 20:24:45'),(19,19,'1984-07-05 02:21:53','2020-11-20 06:45:16'),(20,20,'1998-03-27 02:16:20','1976-04-11 13:36:02'),(21,21,'2007-05-27 09:34:10','1970-07-21 15:43:43'),(22,22,'1993-10-18 04:07:13','1971-09-18 08:13:41'),(23,23,'2012-04-30 12:03:53','2006-11-04 19:59:48'),(24,24,'1995-12-26 07:06:33','1987-02-09 08:03:59'),(25,25,'2002-01-15 03:06:24','1979-11-05 12:25:22'),(26,26,'1975-11-05 08:38:40','2008-07-14 02:03:02'),(27,27,'2000-05-25 02:50:44','2012-11-12 06:34:34'),(28,28,'2013-06-19 14:12:34','1974-12-04 07:31:29'),(29,29,'2010-09-13 09:00:30','1983-12-24 09:46:39'),(30,30,'1976-10-10 18:00:59','2016-07-03 07:27:33'),(31,1,'2000-11-04 05:04:05','1994-01-27 02:43:32'),(32,2,'1980-10-12 10:35:19','2000-04-20 00:37:02'),(33,3,'1975-01-13 04:31:40','1991-08-10 10:31:59'),(34,4,'2013-11-11 05:50:21','1993-09-12 16:01:16'),(35,5,'1984-04-16 23:01:41','1984-03-04 01:06:36'),(36,6,'2010-05-01 13:07:33','1975-05-08 10:38:33'),(37,7,'1974-11-11 09:23:30','1971-06-02 02:44:54'),(38,8,'1979-10-14 18:19:12','2017-04-04 05:04:35'),(39,9,'2008-11-23 10:04:29','2012-06-16 20:10:01'),(40,10,'2016-05-10 22:55:58','2007-11-02 11:11:35'),(41,11,'2004-05-31 08:18:23','1984-08-26 19:40:44'),(42,12,'1994-03-26 19:41:10','1976-01-07 06:33:28'),(43,13,'2000-05-13 06:27:10','2019-06-24 00:11:56'),(44,14,'2005-05-31 04:21:06','2020-10-23 17:32:33'),(45,15,'2012-03-14 10:16:41','2006-01-13 08:28:15'),(46,16,'1981-06-09 23:28:39','1977-07-13 03:06:27'),(47,17,'2018-01-22 08:08:21','1987-02-21 14:34:49'),(48,18,'1974-12-05 14:04:16','1992-09-15 07:37:03'),(49,19,'1971-07-11 10:02:28','2010-06-24 17:10:56'),(50,20,'2008-03-15 22:29:09','2013-05-20 19:30:13'),(51,21,'1986-08-01 03:03:46','1993-08-14 06:44:19'),(52,22,'1978-09-28 04:28:57','2013-10-05 22:12:56'),(53,23,'1974-01-13 12:22:53','1976-08-23 05:35:23'),(54,24,'1990-10-13 16:54:26','1990-01-12 01:57:34');
/*!40000 ALTER TABLE `posts_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `birth_date` date DEFAULT NULL COMMENT 'Дата рождения',
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `status` enum('ONLINE','OFFLINE','INACTIVE') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Текущий статус',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица профилей пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'Trace','Volkman','2008-04-11','Lesotho','South Frida','ONLINE','1978-06-05 22:20:47','1986-06-05 05:49:04'),(2,2,'Sylvia','Wisozk','1970-08-21','Benin','Bayerborough','OFFLINE','2010-05-25 20:55:34','1975-11-18 19:38:50'),(3,3,'Schuyler','Stroman','2003-07-22','Mongolia','Ziemannbury','OFFLINE','2017-02-21 10:49:15','1978-09-02 16:25:11'),(4,4,'Brigitte','Kihn','1985-11-15','Madagascar','Arjunton','OFFLINE','1987-02-28 02:56:21','1987-03-07 14:35:29'),(5,5,'Gerardo','Hintz','1989-08-31','Italy','New Caterinatown','INACTIVE','1995-01-19 06:52:55','1974-12-15 19:36:54'),(6,6,'Milton','Flatley','2015-12-09','Congo','Kristybury','ONLINE','2008-01-11 05:54:00','1985-01-14 16:54:26'),(7,7,'Mustafa','Robel','2004-09-13','Lebanon','Demetrismouth','OFFLINE','1986-09-26 00:45:29','1991-08-05 02:39:19'),(8,8,'Marc','Senger','1986-02-20','Denmark','North Penelope','INACTIVE','2009-11-09 10:36:01','1996-04-15 17:18:18'),(9,9,'Deangelo','Rodriguez','1995-03-31','South Georgia and the South Sandwich Islands','South Kiarra','ONLINE','1981-05-03 14:43:15','1987-05-11 17:48:08'),(10,10,'Candido','Kshlerin','1987-11-15','Venezuela','Port Bradlyberg','ONLINE','2019-10-21 23:55:27','1991-08-15 09:49:47'),(11,11,'Zoila','Feeney','1980-03-26','Ethiopia','Ryderberg','OFFLINE','1997-06-23 05:52:38','2010-04-14 15:36:21'),(12,12,'Florine','Stehr','2010-01-26','Lao People\'s Democratic Republic','New Leslyhaven','OFFLINE','1992-04-17 02:18:30','2005-01-02 11:46:47'),(13,13,'Otto','Casper','2004-01-29','Reunion','Lake Jalenchester','OFFLINE','2020-09-03 07:20:23','1989-09-03 13:23:40'),(14,14,'Lonzo','Lang','1976-05-24','Burundi','North Barry','OFFLINE','2018-09-02 22:26:31','2003-11-19 19:00:50'),(15,15,'Winifred','Bernier','1988-06-12','Lithuania','Estefaniabury','OFFLINE','1980-02-29 01:42:12','1976-09-18 17:52:14'),(16,16,'Jaleel','Stark','1984-06-28','Brazil','Lyricchester','ONLINE','2016-07-24 03:25:41','2021-06-22 05:36:03'),(17,17,'Talia','Gorczany','2008-11-26','South Georgia and the South Sandwich Islands','South Juddmouth','OFFLINE','1984-08-05 11:08:45','1977-01-07 20:31:33'),(18,18,'Shawna','Schoen','2020-07-08','Central African Republic','Roxanneberg','OFFLINE','2020-01-23 05:16:40','2019-08-01 01:56:31'),(19,19,'Mariano','West','2020-08-27','Gibraltar','Moenmouth','ONLINE','1976-10-27 10:22:33','2010-01-16 10:56:55'),(20,20,'Janie','Larson','1978-04-14','Ghana','East Jillian','ONLINE','2015-04-17 10:47:20','2005-12-10 13:17:55'),(21,21,'Westley','Lowe','2018-03-31','Central African Republic','West Annalise','OFFLINE','2019-02-19 16:03:37','1979-08-29 22:01:11'),(22,22,'Rickey','Predovic','1993-01-21','Zimbabwe','Lake Tyson','INACTIVE','2010-08-17 22:02:36','1982-09-01 09:54:06'),(23,23,'Ericka','Raynor','2017-05-03','Ethiopia','Johnathanville','OFFLINE','2017-06-01 20:15:30','2012-06-23 21:02:26'),(24,24,'Wilfred','Bernier','2019-04-21','Yemen','Lake Newtonberg','ONLINE','1976-03-16 19:19:27','2002-08-08 23:29:19'),(25,25,'Viviane','Roberts','1975-12-10','Cook Islands','Port Dariobury','OFFLINE','1982-08-08 06:05:20','1987-11-14 18:31:47'),(26,26,'Corrine','Quigley','1990-02-24','Western Sahara','New Leonard','ONLINE','1991-01-30 18:24:12','2017-01-15 03:08:56'),(27,27,'Marlon','Flatley','2000-11-29','Panama','Goldnershire','ONLINE','1995-09-30 06:39:08','1973-10-07 05:34:59'),(28,28,'Rosemarie','Cronin','2001-01-06','Tokelau','Corkeryshire','OFFLINE','1970-02-06 18:22:03','1998-11-11 10:01:34'),(29,29,'Kiarra','Witting','1987-09-14','Liechtenstein','North Randal','INACTIVE','1975-06-11 15:37:49','1991-11-24 16:09:12'),(30,30,'Cynthia','DuBuque','1984-02-12','Libyan Arab Jamahiriya','Macejkovicbury','ONLINE','2004-09-04 03:41:31','1980-12-05 23:18:36'),(31,31,'Arianna','Schaefer','2011-08-08','Costa Rica','New Dedric','INACTIVE','1982-08-18 17:52:07','1982-07-14 23:34:17'),(32,32,'Jennifer','Bergnaum','1995-09-09','Netherlands Antilles','West Candelario','OFFLINE','1984-08-17 14:12:32','1985-06-25 13:29:27'),(33,33,'Dillon','Bartoletti','2019-04-02','Mexico','Skilesmouth','ONLINE','2009-11-02 05:35:34','1999-03-24 15:26:45'),(34,34,'Hermina','Reichel','2017-10-31','Swaziland','Bernadineton','OFFLINE','2003-09-16 15:43:17','1985-06-06 20:54:37'),(35,35,'Tomasa','Harvey','2018-02-17','Serbia','Tillmanborough','ONLINE','1970-07-14 18:40:26','1984-09-20 01:28:31'),(36,36,'Tito','Lockman','2013-09-22','Bouvet Island (Bouvetoya)','Prosaccoshire','ONLINE','1996-02-15 04:17:51','1974-12-20 02:55:27'),(37,37,'Eleazar','Cummerata','1994-07-25','Brunei Darussalam','South Metafurt','INACTIVE','1996-07-20 17:34:42','1993-01-16 09:13:52'),(38,38,'Carroll','Macejkovic','2001-03-14','Kyrgyz Republic','Susanachester','INACTIVE','1988-03-27 01:59:07','1988-07-28 21:40:10'),(39,39,'Leanna','Herzog','1985-12-05','Burundi','Hintzville','OFFLINE','1977-11-29 08:40:38','1986-02-26 03:51:55'),(40,40,'Kenyatta','Runolfsson','1994-05-06','Colombia','Lake Esther','OFFLINE','1998-03-31 04:38:24','2004-12-21 20:27:50'),(41,41,'Wyatt','Reinger','1996-12-24','Armenia','Lake Erynland','ONLINE','1987-08-30 20:32:13','1993-05-01 00:06:55'),(42,42,'Rudy','Rice','2018-12-27','Canada','Murphyburgh','OFFLINE','1991-12-06 03:13:47','1994-10-27 03:02:53'),(43,43,'Guadalupe','Krajcik','1972-09-08','Montenegro','New Robertaside','ONLINE','1982-06-16 05:58:24','2015-07-04 00:45:23'),(44,44,'Brittany','Steuber','1994-02-09','Saint Kitts and Nevis','Lucilehaven','ONLINE','2016-02-06 23:57:31','1981-02-19 15:32:04'),(45,45,'Gerda','Collins','2009-02-23','Angola','Port Mikeshire','OFFLINE','2004-07-19 08:58:02','2011-07-01 12:17:48'),(46,46,'Kelsie','Parker','1992-02-04','Norfolk Island','Hoppeberg','ONLINE','1985-11-05 05:23:39','1980-10-18 12:21:28'),(47,47,'Tanner','Armstrong','1999-05-18','Azerbaijan','Port Molly','OFFLINE','2014-12-16 20:25:46','1989-09-19 20:54:13'),(48,48,'Mariana','Powlowski','2014-11-09','Saint Barthelemy','Strackemouth','INACTIVE','2000-12-30 00:54:49','2003-02-01 15:35:32'),(49,49,'Delbert','Harvey','1987-01-21','Northern Mariana Islands','West Josuemouth','ONLINE','1983-03-16 15:58:19','1978-12-27 05:44:11'),(50,50,'Kyle','Boyer','2003-11-16','Japan','Toymouth','INACTIVE','2003-05-25 13:06:03','2002-10-26 12:04:31'),(51,51,'Berta','McDermott','1970-12-05','Cape Verde','Leolaberg','ONLINE','1979-12-01 21:17:30','2002-12-24 07:45:44'),(52,52,'Garret','Kunze','1993-10-04','Cook Islands','Lake Lorineside','ONLINE','1988-04-15 03:36:08','1998-06-29 12:56:08'),(53,53,'Alessia','Kunde','2012-10-10','Samoa','Yasminchester','INACTIVE','1992-04-17 07:59:17','1996-11-01 11:34:51'),(54,54,'Ciara','Effertz','1980-11-26','New Caledonia','Sabinastad','OFFLINE','2020-11-24 08:38:14','1978-01-11 20:25:28'),(55,55,'Vena','Osinski','2007-04-29','Spain','Mullerview','ONLINE','2000-10-24 09:14:22','1997-03-03 14:07:48'),(56,56,'Sadie','O\'Hara','1971-12-10','Saint Pierre and Miquelon','Port Laurelmouth','INACTIVE','2016-02-20 22:03:35','1979-02-18 00:46:38'),(57,57,'Tracy','Heidenreich','2010-10-11','El Salvador','Doyleland','OFFLINE','2001-08-08 13:53:09','1972-02-28 10:31:34'),(58,58,'Hank','Kirlin','1996-12-03','Montenegro','Gleasonview','INACTIVE','2009-02-27 23:41:20','1972-12-30 16:55:07'),(59,59,'Garrison','Ullrich','2006-02-07','Zambia','New Matteoville','INACTIVE','2008-09-27 01:00:01','1996-07-25 09:23:30'),(60,60,'Mara','Koepp','2000-04-30','Tanzania','Baumbachbury','ONLINE','2001-02-12 15:27:09','2018-06-23 22:40:03'),(61,61,'Jailyn','Pacocha','1989-01-26','Liberia','South Anabelleborough','ONLINE','2018-10-14 02:58:15','1996-12-31 05:56:33'),(62,62,'Laurence','Hirthe','1999-08-02','Lesotho','East Janessaton','INACTIVE','2002-06-28 10:24:56','1978-08-14 14:38:46'),(63,63,'Spencer','Collier','1996-12-02','Jordan','Makennaview','ONLINE','1997-03-04 19:27:54','2001-05-15 17:03:03'),(64,64,'Nasir','Will','1990-06-16','Syrian Arab Republic','Ovatown','INACTIVE','1991-10-06 14:38:20','2015-11-07 21:25:31'),(65,65,'Lowell','Kuvalis','1989-03-02','Northern Mariana Islands','Mireilleland','OFFLINE','2009-08-16 20:02:13','1991-12-20 05:15:50'),(66,66,'Arlene','Schimmel','2019-02-03','Guatemala','Schummbury','OFFLINE','2005-02-13 02:21:44','2011-03-28 04:34:19'),(67,67,'Dallas','Schmeler','2001-02-16','United Arab Emirates','Mullerstad','INACTIVE','2016-01-16 19:03:12','2010-09-10 11:54:48'),(68,68,'Marley','McLaughlin','2001-04-14','India','Danielview','OFFLINE','1976-03-21 23:26:47','2019-10-13 20:41:47'),(69,69,'Trent','Fritsch','1997-12-14','Denmark','Kleinfurt','OFFLINE','1971-07-23 14:02:54','1995-09-29 12:54:51'),(70,70,'Amber','Tromp','2017-11-16','Hungary','East Nelle','ONLINE','2020-01-26 07:51:10','2007-04-16 06:41:52'),(71,71,'Shaylee','Grimes','1982-04-30','Mayotte','Simeonfort','ONLINE','2021-01-15 15:45:45','1980-04-27 19:40:15'),(72,72,'Kasey','Crooks','1992-09-10','Saint Vincent and the Grenadines','West Agnesmouth','OFFLINE','1970-07-19 02:55:03','2017-06-19 16:42:08'),(73,73,'Jairo','Casper','1991-07-08','Liberia','New Onieport','ONLINE','1975-09-03 04:31:07','1975-12-19 11:37:09'),(74,74,'Ned','Dicki','2011-11-27','Panama','Klingfurt','ONLINE','2006-10-31 07:43:21','2014-03-31 17:43:57'),(75,75,'Hortense','Kuhn','2011-09-01','Vanuatu','Boscoborough','OFFLINE','1975-07-15 10:21:06','1999-10-21 02:03:50'),(76,76,'Hunter','Langworth','2006-05-14','Colombia','Altenwerthview','OFFLINE','2006-02-20 16:51:09','2005-12-21 06:15:46'),(77,77,'Jadon','Olson','2007-04-15','United States of America','Port Jensen','INACTIVE','1972-08-10 20:51:22','1984-10-22 20:51:28'),(78,78,'Geo','Fahey','2008-07-31','Oman','Nickbury','ONLINE','2014-06-06 11:37:34','1978-01-03 02:05:59'),(79,79,'Jaunita','Graham','1994-07-28','Jordan','Langland','OFFLINE','2020-12-21 22:24:35','1999-02-14 09:43:21'),(80,80,'Mylene','Lind','2000-10-11','Togo','Tyreeview','ONLINE','1986-01-26 13:10:09','1971-06-30 11:07:55'),(81,81,'Regan','Dare','1981-10-17','Norway','McClureburgh','ONLINE','2002-08-08 11:45:52','2004-07-09 08:10:09'),(82,82,'Noemy','Klocko','2020-01-19','Svalbard & Jan Mayen Islands','North Vickie','INACTIVE','1975-07-14 06:59:06','2015-05-18 18:41:55'),(83,83,'Lane','Thiel','2010-07-24','Luxembourg','Muellertown','ONLINE','1974-05-13 23:41:41','1994-02-17 02:27:11'),(84,84,'Sophia','Bechtelar','2021-05-23','Macao','Schummberg','INACTIVE','1989-10-25 10:20:37','2009-01-22 03:39:43'),(85,85,'Leonor','Miller','2015-11-23','Greenland','Lake Laurianneshire','ONLINE','1980-07-24 12:22:58','1985-11-28 11:27:42'),(86,86,'Caitlyn','Barton','1975-07-02','Barbados','Sanfordtown','INACTIVE','1987-12-19 11:23:17','1993-02-08 13:35:01'),(87,87,'Chanel','Runte','2019-09-19','Gabon','Bartolettiborough','INACTIVE','2003-11-19 06:58:45','2007-11-13 21:53:38'),(88,88,'Josiane','Turner','2000-05-25','China','Stammton','OFFLINE','1974-07-23 18:54:52','2010-12-13 10:34:33'),(89,89,'Markus','Hauck','1992-08-16','Macao','Reymundomouth','INACTIVE','2002-02-25 12:37:54','2018-10-20 23:06:48'),(90,90,'Cathy','Bergstrom','1973-10-30','Tanzania','Smithfurt','INACTIVE','1980-01-03 04:33:55','1978-11-05 13:15:04'),(91,91,'Vernie','Witting','1987-08-16','Pitcairn Islands','West Macihaven','OFFLINE','1993-11-24 07:54:45','2020-11-08 12:10:43'),(92,92,'Enrico','Lynch','2014-08-26','Mongolia','North Vern','OFFLINE','1988-03-12 22:00:47','1971-01-18 21:20:27'),(93,93,'Arne','Gottlieb','1983-07-18','Cook Islands','North Jalon','OFFLINE','1979-06-24 20:51:44','1988-03-23 19:08:23'),(94,94,'Elisha','Sawayn','1976-04-16','Cook Islands','Beiermouth','ONLINE','2017-03-19 05:23:57','1971-05-13 09:43:58'),(95,95,'Glen','Kiehn','1989-04-12','Kiribati','Kuphalhaven','ONLINE','2001-05-08 09:16:08','1989-05-29 23:40:36'),(96,96,'Jerome','Mann','1987-07-25','Cayman Islands','Lake Freemanshire','ONLINE','1970-08-14 08:38:37','1976-09-25 11:26:24'),(97,97,'Dina','Kozey','2008-10-04','Vietnam','Lake Gayle','INACTIVE','1994-07-20 14:14:37','1979-01-19 19:25:37'),(98,98,'Verla','Kuvalis','2016-05-24','Cyprus','Meaganland','OFFLINE','1999-12-30 06:14:06','2019-01-10 03:03:32'),(99,99,'Denis','Kshlerin','1984-10-11','Slovakia (Slovak Republic)','North Elizabeth','INACTIVE','2019-04-16 02:03:44','2010-09-23 00:23:23'),(100,100,'Roxanne','Kertzmann','1991-02-18','Senegal','West Shyann','OFFLINE','2012-12-23 15:26:20','2001-07-05 00:20:49');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tromp.oscar@example.com','(851)813-5454','1978-11-13 15:58:05','2002-03-02 02:19:15'),(2,'ocorwin@example.org','1-928-549-4172','1994-04-12 05:52:56','1983-10-28 23:07:36'),(3,'kade45@example.net','+83(1)3458648149','1995-01-01 15:11:58','2002-03-23 10:33:51'),(4,'berry.rohan@example.org','03351312397','2005-07-20 23:19:27','1981-05-14 12:18:49'),(5,'dcrona@example.com','1-175-134-5374x451','1988-07-26 22:26:12','2010-05-18 01:49:50'),(6,'ghessel@example.com','942.242.7652x509','2005-09-28 22:46:34','1974-12-08 10:28:10'),(7,'fkiehn@example.org','243-139-7411','1988-11-07 12:40:39','2021-04-09 21:30:45'),(8,'camron.batz@example.com','815.759.6297','1970-08-30 04:15:18','2010-08-21 03:34:46'),(9,'skerluke@example.org','1-106-689-5486x202','2000-08-11 23:49:40','2009-10-20 20:24:17'),(10,'imuller@example.org','(333)261-9491x36750','1981-10-12 07:23:55','2004-03-15 12:30:43'),(11,'o\'hara.howard@example.com','1-765-107-2159x28639','1995-07-27 08:03:55','1970-11-30 15:15:43'),(12,'ykemmer@example.org','(315)381-3878x8867','1985-01-09 17:39:41','1987-08-01 22:18:10'),(13,'grimes.aditya@example.org','136-466-5362','2020-02-21 08:24:05','1993-01-19 11:31:57'),(14,'chaz43@example.org','1-094-895-3891','2019-01-22 16:33:28','2000-09-30 06:13:33'),(15,'jaden05@example.net','1-565-464-7538x02146','2001-06-10 19:09:59','1981-04-17 05:57:03'),(16,'adele.weimann@example.org','1-542-917-8669x0817','1998-12-03 06:07:48','1979-03-03 20:13:40'),(17,'murazik.dashawn@example.net','(306)086-7169x166','2016-12-24 00:22:35','2011-10-30 00:20:54'),(18,'xbechtelar@example.org','891.511.1162','1995-10-30 11:51:25','1993-04-10 21:33:10'),(19,'prohaska.gudrun@example.net','(547)843-7355x218','1982-01-13 11:11:07','2020-08-16 00:55:19'),(20,'dickinson.bart@example.net','844-500-1003x4035','2012-08-16 08:35:44','1971-06-26 17:32:05'),(21,'demarcus.wintheiser@example.com','1-557-569-3442x40781','2003-07-13 21:46:52','1994-03-22 22:50:25'),(22,'cpouros@example.net','1-279-266-2203','2010-05-11 17:44:21','1970-09-19 02:46:02'),(23,'maurine79@example.com','146-785-4226x180','1981-02-01 04:57:08','2014-01-07 18:52:27'),(24,'arau@example.net','(128)044-6206','1978-07-27 03:53:48','1978-01-24 16:27:23'),(25,'kassulke.jesus@example.org','939-915-2283x93000','1991-03-23 17:05:42','1977-06-12 19:41:16'),(26,'rice.gabriel@example.org','750-847-4712','1971-04-01 08:39:19','2003-03-01 03:57:25'),(27,'abbey60@example.net','060.091.9459x768','1996-05-30 03:58:38','1971-08-13 01:48:24'),(28,'kulas.maye@example.net','1-281-330-5175','2007-06-05 08:20:45','1990-05-24 18:00:09'),(29,'ydicki@example.com','07097795509','2013-03-29 21:49:25','1977-08-08 14:23:52'),(30,'ebert.nichole@example.org','(843)245-5673x5966','1985-06-28 01:21:24','1991-03-30 18:16:12'),(31,'prosacco.art@example.com','1-762-676-2953x80577','2015-01-20 14:40:23','2000-09-04 00:16:50'),(32,'paucek.julianne@example.com','1-820-941-4266','2012-08-03 21:10:28','2019-10-05 06:47:24'),(33,'aupton@example.com','04455917105','2014-06-23 22:55:00','2020-05-06 17:03:24'),(34,'matilde.emard@example.net','07856322764','1994-01-04 17:50:09','1987-12-01 03:04:52'),(35,'alexandrea.dicki@example.org','(704)575-4808x8742','2017-02-28 03:18:50','1996-06-21 12:26:40'),(36,'darron95@example.org','138-306-3075x5169','2004-03-13 17:51:42','1997-12-22 02:13:56'),(37,'abdul.farrell@example.com','1-786-648-1246x22011','2015-05-15 17:48:55','1972-05-01 18:25:16'),(38,'orval61@example.org','(584)221-0749','2001-08-27 01:08:20','2014-04-16 03:06:26'),(39,'wtrantow@example.com','(394)556-1449','2009-08-20 22:56:51','1988-11-30 12:25:37'),(40,'kira03@example.com','+14(6)5767634151','1997-12-12 00:37:31','1984-12-26 02:05:26'),(41,'tromp.bart@example.net','(717)870-5513x15179','1982-07-26 14:44:33','1976-05-08 20:49:22'),(42,'skyla35@example.net','1-629-500-3336','1973-08-25 11:27:21','2014-11-01 07:41:36'),(43,'kuvalis.rashawn@example.com','1-897-672-3115','1975-07-25 00:56:02','1991-04-07 22:10:04'),(44,'hortense23@example.org','(605)892-0634x576','1978-09-28 23:50:01','1980-11-11 05:23:50'),(45,'abernathy.helmer@example.org','1-008-257-2214x710','1983-04-30 01:06:48','2018-10-25 00:21:47'),(46,'jeff35@example.org','1-051-751-4504x023','1988-09-12 12:48:54','1994-09-02 21:27:07'),(47,'frederik01@example.com','655.871.3447x8767','2018-12-10 11:12:33','1972-04-07 02:19:13'),(48,'idenesik@example.net','1-008-728-2568','2003-07-17 23:56:42','1999-11-22 04:31:38'),(49,'kathryn99@example.com','388.048.7263','2007-11-23 06:36:16','2009-12-24 07:38:22'),(50,'dhahn@example.net','(851)909-0961','1971-07-29 04:48:06','1998-01-09 16:57:39'),(51,'stehr.vicenta@example.net','+60(9)5848724032','1972-05-17 01:52:00','1976-10-17 10:19:07'),(52,'eaufderhar@example.net','154.615.1071x88242','1970-06-25 03:06:17','2014-10-10 03:38:03'),(53,'igutmann@example.org','857.837.8116x79366','1986-09-30 18:05:10','2009-05-05 10:47:09'),(54,'graham.iva@example.net','1-572-375-5606x515','2011-09-18 02:51:37','1976-10-07 13:13:42'),(55,'beulah65@example.com','258-183-6627x46311','1983-01-10 12:44:56','1985-05-19 05:54:45'),(56,'citlalli84@example.net','+66(5)6782515726','2018-03-08 02:45:32','2011-03-16 14:24:35'),(57,'gussie.hegmann@example.com','517.616.8433','1974-12-18 07:10:06','1980-12-31 22:53:16'),(58,'wilmer.stehr@example.net','+27(8)8398192928','2004-10-20 19:32:36','1985-03-01 05:40:58'),(59,'ashly31@example.org','576-481-7876x27808','1997-06-18 18:37:45','2016-03-09 13:46:15'),(60,'friedrich11@example.org','296-090-5082','1986-09-29 22:25:19','1982-06-03 06:44:40'),(61,'hackett.dwight@example.com','(140)916-5798x04857','2015-08-12 11:21:20','1984-09-22 12:59:21'),(62,'corkery.leila@example.net','1-924-822-9557x6675','2002-01-29 09:24:18','2008-04-29 10:26:42'),(63,'heloise10@example.org','623.372.7303','1972-05-22 10:46:25','2008-02-16 21:44:54'),(64,'barton.randal@example.net','+37(0)8519350378','1978-01-03 13:08:26','2008-12-06 08:32:28'),(65,'mwisoky@example.com','583-081-7805x576','2002-10-26 14:51:04','1971-01-09 02:43:31'),(66,'ckunze@example.com','(808)984-0860x0024','2015-01-20 13:38:09','2008-08-28 20:31:24'),(67,'imelda.stehr@example.org','(443)414-7537x80800','2003-11-17 02:19:33','1994-11-28 03:28:37'),(68,'skyla.berge@example.com','1-697-165-3752','1994-04-19 23:26:44','1982-10-08 17:03:05'),(69,'pfeffer.arielle@example.com','(693)936-6528x28422','2001-12-18 06:50:55','1973-05-04 21:23:26'),(70,'anderson.rahul@example.org','(574)905-3499x061','2000-09-08 10:13:02','1975-07-21 12:42:16'),(71,'adelbert80@example.com','02824441896','1995-08-09 09:37:19','1996-09-27 06:26:12'),(72,'jay59@example.com','1-373-469-2658x0484','2000-05-29 23:06:03','2003-01-07 23:42:40'),(73,'alyson79@example.net','181.015.3969','1978-01-04 07:37:56','1985-11-18 17:01:44'),(74,'marquardt.wilton@example.net','(787)591-6443x8008','2004-11-26 09:43:27','2008-09-12 07:27:07'),(75,'lucie.greenfelder@example.com','(072)427-2590x40790','1978-01-26 18:56:58','2021-05-13 17:24:14'),(76,'ustehr@example.net','03143787467','2009-07-03 15:36:20','2001-03-06 08:00:52'),(77,'blanca.smith@example.net','297.753.0969','1982-03-01 02:25:20','2011-05-02 13:06:39'),(78,'adams.manuel@example.org','483.833.9705x26707','2005-07-17 07:14:50','2017-12-19 06:43:29'),(79,'aufderhar.viviane@example.org','791.545.3509x89218','2012-03-02 06:14:59','1991-01-16 20:17:57'),(80,'graham.maybell@example.net','197.826.6052x8714','1971-03-28 05:44:14','1975-03-22 11:49:43'),(81,'akrajcik@example.org','07171317023','1984-09-10 22:53:23','2019-02-04 13:46:14'),(82,'amelia.thiel@example.org','(504)187-8393','2016-10-11 17:37:51','1984-06-17 22:19:44'),(83,'simonis.halie@example.net','782-730-5214x116','1975-08-28 10:12:25','1971-08-07 07:05:02'),(84,'yundt.jessyca@example.net','460.265.7028','2004-02-12 09:53:23','2008-07-03 07:14:00'),(85,'mills.eli@example.net','117-631-8925x752','2010-05-13 11:56:16','1974-05-27 06:26:20'),(86,'reynolds.golda@example.com','152.728.0490','2007-06-15 10:34:11','1977-07-28 18:18:46'),(87,'furman.ullrich@example.net','1-066-229-6688x76954','1986-06-26 07:45:07','2018-02-06 07:31:41'),(88,'ottis94@example.org','+72(2)0024118192','1989-12-27 19:19:21','1972-06-03 05:33:21'),(89,'rafaela11@example.com','1-963-659-4078x375','2011-01-19 23:41:26','1985-08-07 00:19:41'),(90,'kayley39@example.net','(135)722-0104x3979','2021-02-02 13:28:26','2011-05-21 14:09:06'),(91,'orunolfsson@example.org','232-913-9344x044','1976-12-07 03:29:15','1971-11-30 16:19:56'),(92,'nolan.karlee@example.net','800-255-9884','1990-02-08 03:56:52','1998-12-16 19:14:51'),(93,'rosalia.barton@example.org','922-330-8294','2001-07-10 14:37:33','2017-05-24 13:53:26'),(94,'anjali.hansen@example.org','229.892.7341','1995-07-11 16:51:25','2018-05-15 19:49:52'),(95,'bruen.edgar@example.org','843-822-8336x95299','1984-07-14 17:04:28','1983-09-15 13:33:53'),(96,'jkoch@example.org','100.500.6418x14910','1983-08-02 13:11:31','2013-03-06 23:51:46'),(97,'geffertz@example.com','1-528-958-0262','2012-07-01 13:48:29','1980-12-24 20:02:54'),(98,'labadie.herman@example.org','624.030.9844','2012-07-19 14:57:59','1993-09-11 04:14:57'),(99,'robel.alysha@example.net','437.617.5255x94655','2018-10-04 19:49:12','2007-02-05 03:44:48'),(100,'talon.crona@example.com','+97(0)0147720868','1973-06-22 03:59:38','1979-06-22 07:21:12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visibility`
--

DROP TABLE IF EXISTS `visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visibility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип видимости',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Справочник вариантов видимости объектов на странице';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visibility`
--

LOCK TABLES `visibility` WRITE;
/*!40000 ALTER TABLE `visibility` DISABLE KEYS */;
INSERT INTO `visibility` VALUES (1,'l'),(2,'t'),(3,'f');
/*!40000 ALTER TABLE `visibility` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-08 12:16:36
