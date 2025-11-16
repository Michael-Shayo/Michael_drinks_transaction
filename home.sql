-- MySQL dump 10.13  Distrib 8.4.4, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: home
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add drinks store',7,'add_drinksstore'),(26,'Can change drinks store',7,'change_drinksstore'),(27,'Can delete drinks store',7,'delete_drinksstore'),(28,'Can view drinks store',7,'view_drinksstore'),(29,'Can add statistics',8,'add_statistics'),(30,'Can change statistics',8,'change_statistics'),(31,'Can delete statistics',8,'delete_statistics'),(32,'Can view statistics',8,'view_statistics'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add transaction',10,'add_transaction'),(38,'Can change transaction',10,'change_transaction'),(39,'Can delete transaction',10,'delete_transaction'),(40,'Can view transaction',10,'view_transaction'),(41,'Can add expenditure',11,'add_expenditure'),(42,'Can change expenditure',11,'change_expenditure'),(43,'Can delete expenditure',11,'delete_expenditure'),(44,'Can view expenditure',11,'view_expenditure');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$rZFiVRDgGnzo0NpHICWheO$mycY6CeA3gQPewFht6kcTwe1NoFYpxAtQen6rkjxETo=','2025-11-15 22:02:01.996754',1,'michael','','','shayomichael@gmail.com',1,1,'2025-11-14 23:05:57.655597'),(2,'pbkdf2_sha256$870000$MKozyD0jAn0keiTVYZyjhp$DT3BJVk8JyNW4/t95uQzsJFYwwD5glgBEQRetJqde+8=','2025-11-15 09:32:22.511688',0,'antony','antony','kanti','antony@gmail.com',0,1,'2025-11-15 09:32:02.532944'),(3,'pbkdf2_sha256$870000$ivXVKEzCUjJ43o5qSL4rcY$qSDl991SczNQFfiIec2WvQRgenzef628QUyBmZWePR8=',NULL,0,'obalda','Obalda ','kombe','obalda@gmail',0,1,'2025-11-15 19:50:38.478096'),(4,'pbkdf2_sha256$870000$PQjci40yqrbYpu2HaFkmjj$ivf6ZlFFDG8iXj/s0UVWVSfMyGxieURlQ9HSRpn5WjU=',NULL,0,'abdul','abdul','','abdul@gmail',0,1,'2025-11-15 19:52:29.078854'),(5,'pbkdf2_sha256$870000$9KzHLfsL81CL96QyaALWVj$SvaxiqH85BtBZBTUPCehO9QyOImXWVZBXRmv/C38QRs=',NULL,0,'lucy','lucy','selitus','lucy@gmail.com',0,1,'2025-11-15 19:55:03.786474'),(6,'pbkdf2_sha256$870000$EZ5I1aFP4KhRio0oDAPDbv$fc1VHo35k3E0c00CZ3Ib1zXGMdAYb59Kfi9BQeU2Ymk=',NULL,0,'venance','venance','','venance@gmail.com',0,1,'2025-11-15 19:57:04.850725'),(7,'pbkdf2_sha256$870000$BKoznoQoYTm6llmPZtmVfX$F1gIoeDOXKjD0icAx9P2pUi7LKQkNBlrBu8jN9igxlo=',NULL,0,'neema','neema','','neema@gmail.com',0,1,'2025-11-15 19:59:57.559901'),(8,'pbkdf2_sha256$870000$BapedgN8zznPDS6fNDCDnZ$4w0vri/wnYeAApLHAEtJCC9aJ3YO9AZmmGgqvkKlOoM=',NULL,0,'Beatrice','Beatrice','Abasi','beatrice@gmail.com',0,1,'2025-11-15 20:07:55.488707'),(9,'pbkdf2_sha256$870000$1eGyHaGxP1wT2PGCAnUxEE$ZLQdmnbIhLcpOnUM1U0TwhjiuDWzaJXIIRW45jZ1KmY=',NULL,0,'Gift','Gift','Dodo','gift@gmail.com',0,1,'2025-11-15 20:11:31.141666'),(10,'pbkdf2_sha256$870000$ioAuZX6K5jiSQyRgpA96ul$GJO/IOFaDpT7lklkzfHyYMCxK+f+aRgqKU0bchX47kc=',NULL,0,'benjamin','Benjamin','','benjamin@gmail.com',0,1,'2025-11-15 20:18:58.260740'),(11,'pbkdf2_sha256$870000$SxeYkET4oEUiWw4eLpVN4y$gsw+HgPtnGQUHxKZqX1imsr6xTtJkdPtAJKF/zBCwyA=',NULL,0,'Frorence','Frorence','','Frorence@gmail.com',0,1,'2025-11-15 20:21:44.480720'),(12,'pbkdf2_sha256$870000$t12b8XxRNC8cnWUCJqA6vw$GfoVhUFJTK9DpL1S2QFcu1WpQNf0uvw8NWzDm02vM/E=',NULL,0,'Sara','Sara','Mshana','Sara@gmail.com',0,1,'2025-11-15 20:33:15.746351'),(13,'pbkdf2_sha256$870000$ZTvATblDxZbYorvALqg2oa$Zd+9kw6hHTwyYXzabIyAW3XaaQiwaqyStwwTvt/ZsUs=',NULL,0,'Sia','Sia','Urassa','sia@gmail.com',0,1,'2025-11-15 20:35:18.581946'),(14,'pbkdf2_sha256$870000$VS2CrFfdhjPWcri2A0loLI$I5N8uNW2i0QZzl4iBoaPJtM8xVTsIx8+oQqT1igRH/0=','2025-11-16 00:36:50.999300',0,'Omary','Omary','Said','omary@gmail.com',0,1,'2025-11-15 20:38:33.726012'),(15,'pbkdf2_sha256$870000$HY6p09k88FUnfODpfNdR4M$jXs/T5x+08J9lz6EhiSZ+gDbNSEkGCNBAWNeDRhrPtc=',NULL,0,'Asia','Asia','Yusuph','asia@gmail.com',0,1,'2025-11-15 20:39:58.116701'),(16,'pbkdf2_sha256$870000$iyXML9o72zb6Lq7r9FLlg4$KGBSjiG8X5c682y/+QpAOoF6rhpHasvpGm4YQ2S2W1U=',NULL,0,'Flora','Flora','Julius','flora@gmail.com',0,1,'2025-11-15 20:43:04.678017'),(17,'pbkdf2_sha256$870000$qBD6MJhZMU5ym3IgCtZQDs$tABWaylFw52706p3g6lq7buNYrfLNaWauXJ85utmG6o=',NULL,0,'Beda','Beda','','beda@gmail.com',0,1,'2025-11-15 20:45:47.869903'),(18,'pbkdf2_sha256$870000$2Auf9k7yXLIR9QcE4RQxbm$ukyMgRxGdW2/4IaQMU1B9mvxv88aZR8dT74DhSjHtuQ=',NULL,0,'CARREN','CARREN','Abasi','carren@gmail.com',0,1,'2025-11-15 20:53:26.929858');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-11-15 10:59:54.904744','5',' TRANSACTION MADE BY antony STATUS = declined',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',10,1),(2,'2025-11-15 11:55:13.535984','2','payments,Amount50000',1,'[{\"added\": {}}]',11,1),(3,'2025-11-15 22:32:19.537626','1','SODA:866, WATER: 589',2,'[{\"changed\": {\"fields\": [\"Price per soda\"]}}]',7,1),(4,'2025-11-15 22:32:53.491081','1','SODA:866, WATER: 589',2,'[{\"changed\": {\"fields\": [\"Price per soda\"]}}]',7,1),(5,'2025-11-15 22:55:31.492740','3','office,Amount : 5000',1,'[{\"added\": {}}]',11,1),(6,'2025-11-16 04:15:54.009506','10',' TRANSACTION MADE BY michael STATUS = confirmed',2,'[]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','drinksstore'),(11,'main','expenditure'),(9,'main','profile'),(8,'main','statistics'),(10,'main','transaction'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-11-14 23:04:18.187898'),(2,'auth','0001_initial','2025-11-14 23:04:30.060656'),(3,'admin','0001_initial','2025-11-14 23:04:32.719897'),(4,'admin','0002_logentry_remove_auto_add','2025-11-14 23:04:32.809885'),(5,'admin','0003_logentry_add_action_flag_choices','2025-11-14 23:04:32.958997'),(6,'contenttypes','0002_remove_content_type_name','2025-11-14 23:04:35.068127'),(7,'auth','0002_alter_permission_name_max_length','2025-11-14 23:04:35.998753'),(8,'auth','0003_alter_user_email_max_length','2025-11-14 23:04:36.263717'),(9,'auth','0004_alter_user_username_opts','2025-11-14 23:04:36.338683'),(10,'auth','0005_alter_user_last_login_null','2025-11-14 23:04:37.188728'),(11,'auth','0006_require_contenttypes_0002','2025-11-14 23:04:37.235726'),(12,'auth','0007_alter_validators_add_error_messages','2025-11-14 23:04:37.302722'),(13,'auth','0008_alter_user_username_max_length','2025-11-14 23:04:38.279810'),(14,'auth','0009_alter_user_last_name_max_length','2025-11-14 23:04:49.178418'),(15,'auth','0010_alter_group_name_max_length','2025-11-14 23:04:49.763215'),(16,'auth','0011_update_proxy_permissions','2025-11-14 23:04:49.840210'),(17,'auth','0012_alter_user_first_name_max_length','2025-11-14 23:04:50.909886'),(18,'main','0001_initial','2025-11-14 23:04:57.921222'),(19,'sessions','0001_initial','2025-11-14 23:04:58.868055'),(20,'main','0002_drinksstore_price_per_soda_and_more','2025-11-14 23:18:51.486042'),(21,'main','0003_expenditure','2025-11-15 00:53:49.223208'),(22,'main','0004_alter_statistics_trip_date','2025-11-15 09:52:39.165691'),(23,'main','0005_alter_expenditure_info_and_more','2025-11-15 11:50:38.240512'),(24,'main','0006_alter_expenditure_created_on_and_more','2025-11-16 06:38:47.107625');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('d0ph3jn8sf09opk11e0jldqz8m80ofxm','.eJxVjEEOwiAQRe_C2hCGFpi6dO8ZyDCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-juIsQJx-t0D8SHUH8U711iS3ui5zkLsiD9rltcX0vBzu30GhXr41a452AAQDaECrrKNSaAxNdmTnRmQXASjj4Cg4S0A666RsYod50kG8P7mMNzw:1vKOLK:M6IKlsZ7ax1Xvhxj_AYSM0e4QWJ9hakalOxwz32rrAU','2025-11-29 22:02:02.317058'),('rkor9otd3hre9tedo357axthzus9gdms','.eJxVjDsOwjAQBe_iGln-4Q8lPWew1rs2DiBbipMKcXcSKQW0b-bNm0VYlxrXkec4Ebswadjpd0yAz9x2Qg9o986xt2WeEt8VftDBb53y63q4f4EKo25vZVB7Cd560mSsRiWcOJOCoosBG7yl4AwIl6TUhMqVbLPe-igDAgj2-QLxnzgm:1vKQlD:miXJ-_xzpK0G3J20OYjov0l5m44HBqQpMcq_KNhnU-4','2025-11-30 00:36:55.923745');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_drinksstore`
--

DROP TABLE IF EXISTS `main_drinksstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_drinksstore` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `soda_store` int NOT NULL,
  `water_store` int NOT NULL,
  `price_per_soda` int NOT NULL,
  `price_per_water` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_drinksstore`
--

LOCK TABLES `main_drinksstore` WRITE;
/*!40000 ALTER TABLE `main_drinksstore` DISABLE KEYS */;
INSERT INTO `main_drinksstore` VALUES (1,852,583,11500,5000);
/*!40000 ALTER TABLE `main_drinksstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_expenditure`
--

DROP TABLE IF EXISTS `main_expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_expenditure` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expend_type` varchar(100) NOT NULL,
  `info` longtext NOT NULL,
  `value_amount` int NOT NULL,
  `created_on` date NOT NULL,
  `approved_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_expenditure_approved_by_id_c054bdaa_fk_auth_user_id` (`approved_by_id`),
  CONSTRAINT `main_expenditure_approved_by_id_c054bdaa_fk_auth_user_id` FOREIGN KEY (`approved_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_expenditure`
--

LOCK TABLES `main_expenditure` WRITE;
/*!40000 ALTER TABLE `main_expenditure` DISABLE KEYS */;
INSERT INTO `main_expenditure` VALUES (2,'payments','take perfume from silvia',50000,'2025-11-15',1),(3,'office','BUYING DAFTARI',5000,'2025-11-15',1);
/*!40000 ALTER TABLE `main_expenditure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_profile`
--

DROP TABLE IF EXISTS `main_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `main_profile_user_id_b40d720a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_profile`
--

LOCK TABLES `main_profile` WRITE;
/*!40000 ALTER TABLE `main_profile` DISABLE KEYS */;
INSERT INTO `main_profile` VALUES (1,'0785943642',2),(2,'0789988686',3),(3,'0783791123',4),(4,'0758037062',5),(5,'0787407025',6),(6,'0759474295',7),(7,'000000000',8),(8,'0749951552',9),(9,'0747227822',10),(10,'0699071661',11),(11,'0678458614',12),(12,'00000',13),(13,'0678296713',14),(14,'000000000',15),(15,'000000',16),(16,'0624809834',17),(17,'000000000',18);
/*!40000 ALTER TABLE `main_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_statistics`
--

DROP TABLE IF EXISTS `main_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `trip_date` date NOT NULL,
  `car_id` varchar(10) NOT NULL,
  `start` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `passenger_number` int NOT NULL,
  `return_trip_date` date NOT NULL,
  `return_start` varchar(255) NOT NULL,
  `return_destination` varchar(255) NOT NULL,
  `return_passenger_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_statistics`
--

LOCK TABLES `main_statistics` WRITE;
/*!40000 ALTER TABLE `main_statistics` DISABLE KEYS */;
INSERT INTO `main_statistics` VALUES (1,'2025-11-13','T 280DZX','DAR-ES-SALAAM','TARAKEA',56,'2025-11-13','TARAKEA','DAR-ES-SALAAM',45),(2,'2025-11-04','T 280DZX','DAR-ES-SALAAM','TARAKEA',54,'2025-10-28','KIOMBOI','SINGIDA',45),(3,'2025-11-19','T 331DYR','TARAKEA','BABATI',65,'2025-11-19','TARAKEA','KIOMBOI',54),(4,'2025-11-19','T 331DYR','TARAKEA','BABATI',65,'2025-11-19','TARAKEA','KIOMBOI',54),(5,'2025-11-19','T 331DYR','TARAKEA','BABATI',65,'2025-11-19','TARAKEA','KIOMBOI',54),(6,'2025-11-12','T 331DYR','SINGIDA','KIOMBOI',65,'2025-10-29','BABATI','BABATI',54),(7,'2025-11-13','T 183EJM','DAR-ES-SALAAM','BABATI',45,'2025-11-15','BABATI','DAR-ES-SALAAM',50),(8,'2025-11-19','T 280DZX','TARAKEA','SINGIDA',56,'2025-11-04','SINGIDA','MOSHI',87),(9,'2025-11-13','T 195DVA','KIOMBOI','DAR-ES-SALAAM',34,'2025-11-15','KIOMBOI','DAR-ES-SALAAM',54),(10,'2025-11-15','T 989ECJ','TARAKEA','KIOMBOI',50,'2025-11-16','KIOMBOI','TARAKEA',40);
/*!40000 ALTER TABLE `main_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_transaction`
--

DROP TABLE IF EXISTS `main_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `car_id` varchar(10) NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `soda_amount` int NOT NULL,
  `water_amount` int NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` time(6) NOT NULL,
  `created_on` date NOT NULL,
  `confirmed_by_id` int DEFAULT NULL,
  `tripstatics_id` bigint DEFAULT NULL,
  `user_id` int NOT NULL,
  `total_price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_transaction_confirmed_by_id_d469d4bb_fk_auth_user_id` (`confirmed_by_id`),
  KEY `main_transaction_tripstatics_id_431efcb3_fk_main_statistics_id` (`tripstatics_id`),
  KEY `main_transaction_user_id_fd91d649_fk_auth_user_id` (`user_id`),
  CONSTRAINT `main_transaction_confirmed_by_id_d469d4bb_fk_auth_user_id` FOREIGN KEY (`confirmed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `main_transaction_tripstatics_id_431efcb3_fk_main_statistics_id` FOREIGN KEY (`tripstatics_id`) REFERENCES `main_statistics` (`id`),
  CONSTRAINT `main_transaction_user_id_fd91d649_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_transaction`
--

LOCK TABLES `main_transaction` WRITE;
/*!40000 ALTER TABLE `main_transaction` DISABLE KEYS */;
INSERT INTO `main_transaction` VALUES (1,'T 280DZX','take',8,2,'confirmed','15:09:59.224023','2025-11-14',1,1,1,0),(2,'T 884DEE','add',600,300,'confirmed','15:32:23.892564','2025-11-14',1,NULL,1,0),(3,'T 280DZX','take',8,2,'confirmed','16:52:41.901362','2025-11-14',1,2,1,0),(4,'T 331DYR','take',8,2,'confirmed','01:14:51.300943','2025-11-15',1,5,1,102000),(5,'T 331DYR','take',4,2,'declined','01:33:17.738943','2025-11-15',1,6,2,56000),(6,'T 884DEE','add',300,300,'confirmed','01:43:33.323481','2025-11-15',1,NULL,1,0),(7,'T 183EJM','take',6,3,'confirmed','14:00:04.298990','2025-11-15',1,7,14,84000),(8,'T 280DZX','take',4,1,'confirmed','16:39:04.166433','2025-11-15',1,8,14,51000),(9,'T 884DEE','add',200,100,'declined','18:36:40.802978','2025-11-15',1,NULL,1,0),(10,'T 195DVA','take',7,1,'confirmed','20:10:40.507240','2025-11-15',1,9,1,85500),(11,'T 989ECJ','take',3,4,'confirmed','22:50:58.048011','2025-11-16',1,10,1,54500);
/*!40000 ALTER TABLE `main_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-16  0:06:55
