-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: PT_ServidorPublico_DFS
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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
-- Table structure for table `autors`
--

DROP TABLE IF EXISTS `autors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autors`
--

LOCK TABLES `autors` WRITE;
/*!40000 ALTER TABLE `autors` DISABLE KEYS */;
INSERT INTO `autors` VALUES (27,'Keven Gutkowski','1995-01-09','2024-09-14 20:08:26','2024-09-14 20:08:26'),(28,'Carter Dickens Sr.','1975-01-02','2024-09-14 20:08:26','2024-09-14 20:08:26'),(29,'Skylar O\'Reilly','1972-10-24','2024-09-14 20:08:26','2024-09-14 20:08:26'),(30,'Jennifer McClure II','1975-07-05','2024-09-14 20:08:26','2024-09-14 20:08:26'),(31,'Jayde Murazik Sr.','1979-01-15','2024-09-14 20:08:26','2024-09-14 20:08:26'),(32,'Euna Denesik DVM','1986-05-12','2024-09-14 20:08:26','2024-09-14 20:08:26'),(33,'Josefa Schimmel','1997-08-05','2024-09-14 20:08:26','2024-09-14 20:08:26'),(34,'Heloise Pouros','1986-02-04','2024-09-14 20:08:26','2024-09-14 20:08:26'),(35,'Ms. Malika Will','1990-07-03','2024-09-14 20:08:26','2024-09-14 20:08:26'),(36,'Damion Stiedemann MD','1973-09-07','2024-09-14 20:08:26','2024-09-14 20:08:26'),(37,'London Altenwerth','1991-05-12','2024-09-14 20:08:26','2024-09-14 20:08:26'),(38,'Dr. Rosemary Jenkins','1999-02-20','2024-09-14 20:08:26','2024-09-14 20:08:26'),(39,'Miss Mozelle Adams IV','1992-10-29','2024-09-14 20:08:26','2024-09-14 20:08:26'),(40,'Jesse Schamberger','1993-07-03','2024-09-14 20:08:26','2024-09-14 20:08:26'),(41,'Dr. Nasir Pacocha','1996-05-29','2024-09-14 20:08:26','2024-09-14 20:08:26'),(42,'Salvatore Stoltenberg','1984-01-27','2024-09-14 20:08:26','2024-09-14 20:08:26'),(43,'Susana Johnston','1988-09-28','2024-09-14 20:08:26','2024-09-14 20:08:26'),(44,'Ms. Earline Welch I','1988-05-03','2024-09-14 20:08:26','2024-09-14 20:08:26'),(45,'Arnoldo Cartwright','1989-04-19','2024-09-14 20:08:26','2024-09-14 20:08:26'),(46,'Kip Schuster III','1979-09-26','2024-09-14 20:08:26','2024-09-14 20:08:26'),(47,'Alex Stehr','1990-01-11','2024-09-14 20:08:26','2024-09-14 20:08:26'),(48,'Gilbert Ernser','1979-03-18','2024-09-14 20:08:26','2024-09-14 20:08:26'),(49,'Vanessa Barrows','1975-07-04','2024-09-14 20:08:26','2024-09-14 20:08:26'),(50,'Myles Mertz','1978-06-24','2024-09-14 20:08:26','2024-09-14 20:08:26'),(51,'Dina Jaskolski','1996-04-27','2024-09-14 20:08:26','2024-09-14 20:08:26');
/*!40000 ALTER TABLE `autors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covid_dashboard_views`
--

DROP TABLE IF EXISTS `covid_dashboard_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid_dashboard_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid_dashboard_views`
--

LOCK TABLES `covid_dashboard_views` WRITE;
/*!40000 ALTER TABLE `covid_dashboard_views` DISABLE KEYS */;
INSERT INTO `covid_dashboard_views` VALUES (1,'https://api.covidtracking.com/v1/us/daily.json',NULL,NULL);
/*!40000 ALTER TABLE `covid_dashboard_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','text','Id',1,0,0,0,0,0,'{}',1),(23,4,'nombres','text','Nombres',1,1,1,1,1,1,'{}',2),(24,4,'fechaNacimiento','text','FechaNacimiento',1,1,1,1,1,1,'{}',3),(25,4,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',4),(26,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(36,4,'autor_hasmany_libro_relationship','relationship','libros',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Libro\",\"table\":\"libros\",\"type\":\"hasMany\",\"column\":\"autor_id\",\"key\":\"id\",\"label\":\"titulo\",\"pivot_table\":\"autors\",\"pivot\":\"0\",\"taggable\":\"0\"}',6),(38,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(39,7,'titulo','text','Titulo',1,1,1,1,1,1,'{}',3),(40,7,'autor_id','text','Autor Id',1,1,1,1,1,1,'{}',2),(41,7,'anio','text','Anio',1,1,1,1,1,1,'{}',4),(42,7,'genero','text','Genero',1,1,1,1,1,1,'{}',5),(43,7,'idioma','text','Idioma',1,1,1,1,1,1,'{}',6),(44,7,'descripcion','text','Descripcion',0,1,1,1,1,1,'{}',7),(45,7,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',8),(46,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(47,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(48,8,'url','text','Url',1,1,1,1,1,1,'{}',2),(49,8,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',3),(50,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2024-09-13 20:00:38','2024-09-13 20:00:38'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2024-09-13 20:00:38','2024-09-13 20:00:38'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2024-09-13 20:00:38','2024-09-13 20:00:38'),(4,'autors','autors','Autor','Autors',NULL,'App\\Models\\Autor',NULL,'App\\Http\\Controllers\\AutorController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-09-14 15:20:50','2024-09-14 21:04:28'),(7,'libros','libros','Libro','Libros',NULL,'App\\Models\\Libro',NULL,'App\\Http\\Controllers\\LibroController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-09-15 02:18:58','2024-09-15 02:22:11'),(8,'covid_dashboard_views','covid-dashboard-views','Covid Dashboard View','Covid Dashboard Views',NULL,'App\\Models\\CovidDashboardView',NULL,'App\\Http\\Controllers\\CovidDashboardViewController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-09-15 02:30:47','2024-09-15 02:39:34');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor_id` bigint unsigned NOT NULL,
  `anio` date NOT NULL,
  `genero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idioma` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `libros_autor_id_foreign` (`autor_id`),
  CONSTRAINT `libros_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `autors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (4,'A animi eos itaque voluptatem.',39,'2020-02-12','No Ficción','ii','Sapiente et minima aliquid est fugit. Et iste esse aut cum qui.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(5,'Aut provident quidem quas aut distinctio iste doloribus.',45,'1970-10-29','Biografía','ti','Sit illo quisquam iure optio cum enim rerum. Ea sunt et est voluptatum necessitatibus. Qui voluptatem itaque repudiandae quam similique.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(6,'Eos hic sunt esse porro.',35,'1991-11-29','Misterio','ku','Molestias autem dolorem ea aut modi totam. Libero itaque odit aut voluptatem ipsam dolores. Optio ut est doloribus aut pariatur. Dolor et quasi ut quos doloribus facere nemo.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(7,'Et nobis quisquam sit temporibus.',47,'1990-11-19','Ficción','ss','Dignissimos voluptatem optio soluta consequatur. Quibusdam tenetur tempora voluptatem veniam non laborum dolore. Quas cum nemo earum aut et voluptas. Sint aut quo sapiente quis. Magni culpa nam illo repellendus doloribus esse voluptatem.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(8,'Ipsum itaque molestiae ratione doloremque est enim.',49,'2013-06-24','Misterio','ti','Perferendis quo repellendus ullam dolorum corrupti voluptate. Maiores sapiente nemo quo cum omnis. Delectus ut molestiae iste aut quia quis. Vitae ut consequuntur qui eos doloremque illum ipsum.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(9,'Iusto nisi eos molestias nulla.',29,'1981-11-14','Fantasia','kr','Nam facere et qui. Est rem dolorem provident sunt aperiam sapiente tempore. Hic qui asperiores omnis alias. Dolorem nisi voluptatum eius cumque.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(10,'Sed sit porro sint occaecati.',47,'1971-05-27','Romántico','gv','Ut quia repellat doloribus quibusdam quae aut. Libero et et eos similique dolor delectus id sapiente. Fugit officiis voluptas corrupti magni aut. Assumenda odio quia maiores alias laboriosam ea exercitationem.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(11,'Magnam deserunt pariatur veniam.',30,'1980-02-06','No Ficción','bn','Eveniet officiis quidem libero sed. Illum quidem qui voluptatem animi quia libero. Sequi assumenda nihil veniam corporis.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(12,'Ad aspernatur aut eveniet quo delectus id fuga.',41,'2013-11-08','Ciencia Ficción','id','Dolorem incidunt delectus quibusdam voluptas. Eum deserunt voluptas soluta at. Dicta rerum neque facilis veritatis. Tenetur quisquam recusandae voluptatem aut cupiditate.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(13,'Enim distinctio cum reiciendis minus dignissimos culpa.',29,'1979-05-21','Ficción','za','Quaerat ab sit minus praesentium earum corrupti. Nemo dolores inventore quo. Dolores officia voluptates voluptate et cum possimus fugit et.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(14,'Est dignissimos vel fuga cum amet exercitationem.',36,'2016-08-10','Ciencia Ficción','hy','Pariatur cumque et ratione natus magni. Pariatur fuga at at reprehenderit velit quis architecto. Sit at quia aspernatur. Voluptate non asperiores eius doloremque ducimus accusamus.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(15,'Excepturi veritatis autem quis eos velit veritatis.',38,'1980-05-17','Misterio','dz','Deserunt maiores in veniam ad et. Aliquid iusto rerum sed amet. Labore aut repellat laboriosam sunt et. Voluptatem officia dignissimos ea aut.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(16,'Iusto veritatis illum omnis ipsam.',51,'2009-07-09','Ciencia Ficción','vo','Ipsam libero et ipsam ratione nemo exercitationem voluptatem quia. Voluptate rem omnis distinctio possimus facilis. Iusto id dicta pariatur non quae unde. Inventore eaque iusto officiis consequuntur quidem autem.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(17,'Aut inventore qui qui quo sint commodi iusto.',49,'1985-09-28','Histórico','hr','Laudantium dolor quisquam tempora aut. Impedit ipsa mollitia mollitia perferendis ex quas. Sunt voluptas ipsam nihil quasi. Sint perferendis aut eveniet iusto.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(18,'Nesciunt officiis velit autem.',46,'1975-06-26','Fantasia','sr','Necessitatibus tempora quasi voluptatem est. Omnis rem voluptatibus rerum dolorem. Ipsam sint officiis dolore ab consequuntur aspernatur cupiditate. Et distinctio tempora quod quos. Ipsum ea illum dolorem nisi tempora molestias enim rerum.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(19,'Repellat et ut blanditiis maiores deleniti nostrum quia.',39,'2011-05-15','Romántico','jv','Nisi eaque doloribus sed molestiae quo ratione nihil. Ducimus et doloremque dicta sint illo voluptas aut. Ducimus magni voluptas quos reprehenderit nulla ad qui. Laudantium voluptatem sit eos sed fuga. Qui magni inventore aut quod et incidunt quis.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(20,'Laudantium incidunt placeat aut et ab officia non.',46,'1996-08-09','Ciencia Ficción','zu','Molestiae maiores ex sit. Sunt minus enim quia magni a. Sint architecto aut laudantium placeat non et. Rerum voluptas a corrupti et.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(21,'Laboriosam repellendus officiis ut esse alias et et dolore.',30,'1997-03-26','Ficción','kk','Eos non repellat optio a nisi. Doloribus non excepturi est sunt nihil veniam.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(22,'Tempore nam aspernatur in eligendi dolores.',42,'2021-09-21','Romántico','ng','Deserunt consectetur porro id non. Repudiandae illo odit vel pariatur tenetur veniam vitae. Ab nulla earum molestias similique ad dolores delectus.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(23,'Quasi quis est impedit excepturi.',28,'2004-11-26','Ciencia Ficción','kj','Culpa dolores molestias sequi reiciendis qui aut. Expedita quae optio ea consequatur eveniet qui. Aperiam et corporis dolorem odit sit aut autem et. Qui incidunt nostrum non et.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(24,'Sed sequi sit et molestias illo.',31,'2011-03-21','Histórico','ja','Illo commodi molestiae possimus ipsam quo sit libero dolores. Soluta ducimus asperiores enim quaerat et. Voluptas aut blanditiis ut iure voluptates. Ut id ipsam tenetur necessitatibus soluta quasi.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(25,'Provident et qui blanditiis aliquam.',41,'1992-09-30','Ciencia Ficción','so','Iusto porro aspernatur nihil voluptas. Eum consequatur perspiciatis repudiandae adipisci. Quia tempore sapiente suscipit fugiat.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(26,'Ullam quasi similique doloribus nam et ut laboriosam et.',44,'1996-10-26','Romántico','sq','Nesciunt neque quae non qui sapiente voluptatum. Consequatur et impedit quia nesciunt.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(27,'Omnis voluptatem qui a quisquam soluta.',47,'2022-09-15','Ciencia Ficción','uz','Saepe dicta illum sit deleniti in et. In nostrum non nobis ipsum consectetur commodi. Consequuntur quos quaerat tenetur ut dolorem adipisci pariatur repellendus. Cumque quia illum voluptatem sit nostrum illo. Qui error facilis corporis reiciendis est.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(28,'Voluptates dolore ullam ut quis.',47,'1988-08-20','Ficción','ga','Ipsum hic architecto voluptatem. Eum velit quis aut est. Neque fugit qui optio saepe sit error et. Praesentium velit ut ad reiciendis hic deserunt. Sint sint eius ipsa aliquid totam.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(29,'Non sed rerum omnis accusantium quod et incidunt.',41,'1997-06-01','Ficción','ha','Consequuntur dolor velit perferendis quia est delectus. Atque voluptatem voluptatem asperiores mollitia ipsa. In nulla cumque beatae cumque molestiae voluptates ipsum. Et provident eligendi non nobis ea hic.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(30,'Totam odit cum placeat autem quae vitae.',27,'1978-05-04','Misterio','ja','Cumque voluptatem odit provident voluptatem necessitatibus. Blanditiis debitis ut voluptatem est. Voluptatem commodi placeat necessitatibus maiores.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(31,'Suscipit qui expedita facere dolores dolorem sunt quia.',29,'2015-05-27','Romántico','el','Et omnis et in at fugiat. Voluptatibus fugit ratione ea. Quis sunt et quas quo dolores. Explicabo et eveniet mollitia molestiae earum. Repudiandae mollitia distinctio repellat dicta.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(32,'Voluptatem quibusdam voluptas et quas inventore eveniet.',27,'2004-08-04','Misterio','ch','Vero enim omnis id dolor aut iusto eos reiciendis. Voluptatem eligendi aliquam in vero odio doloribus nihil. Et facilis ut est.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(33,'Reprehenderit quae vel unde non et voluptas.',33,'1988-04-20','Biografía','ht','Beatae similique voluptatibus qui provident ducimus. Consectetur tempore dolorem quasi officiis voluptatum. Commodi dolorum rerum quia reiciendis quibusdam sequi totam. Dolorem occaecati quis deserunt odio. Voluptatibus repellat nihil quisquam qui.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(34,'Eos eius possimus facilis sunt quae sint.',28,'2014-03-16','No Ficción','ho','Debitis iste in in quia quia ad et. Tempore voluptas deleniti cum. Explicabo id quis vel velit qui. Omnis aut eveniet voluptatem animi libero doloremque vel.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(35,'Earum dignissimos recusandae necessitatibus quaerat culpa qui.',30,'2017-01-03','Ciencia Ficción','ca','Possimus perspiciatis veritatis quaerat veritatis rerum sequi. Aut voluptatum aliquam consequatur est aut doloribus repellendus ipsum. Maiores aut et rerum. Veritatis pariatur doloremque quis excepturi dolor voluptates.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(36,'Sit magni maxime magni in explicabo quia est.',29,'2004-02-13','Histórico','ru','Delectus commodi ut aut eligendi. Qui rerum quod ducimus eos odit. Quidem reiciendis nulla vitae quo omnis commodi alias. Veniam commodi facilis recusandae fugiat illum. Sint et et nesciunt nam reprehenderit sint quisquam sed.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(37,'Nostrum eos cum minima nobis illum rerum ad.',51,'2001-12-29','Romántico','fi','Vel voluptatem doloribus porro labore. Officia et aperiam ut dolorem voluptatum a. Facere repudiandae dolores est cumque excepturi.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(38,'Aut sunt quo harum assumenda est nesciunt.',44,'1996-08-10','Romántico','fo','Quia animi impedit sed debitis. Nesciunt ratione voluptas quasi veritatis officia. Aut qui ipsa asperiores. Fugiat et sed est impedit. Fugiat dolor modi dolor et qui esse dolore.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(39,'Optio ab atque voluptas neque minus.',32,'2023-03-21','Romántico','lg','Laboriosam inventore deserunt iste nostrum. Delectus occaecati quam omnis quae aut eaque. Accusantium voluptatibus consequuntur ex ea. In sint et aut qui dolor et optio.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(40,'Vel asperiores adipisci in ullam distinctio.',32,'1999-05-03','Biografía','tt','Magni consectetur placeat magni ad. Necessitatibus ea aut qui velit voluptate natus repellendus sed. Commodi corporis numquam veniam rem dolores in dignissimos. Sunt eius est provident repellat eaque.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(41,'Est dolore ex iure laborum laboriosam magni quod tempora.',43,'2019-08-13','Ciencia Ficción','nn','Ducimus distinctio possimus voluptatem laudantium. In totam dolores explicabo porro officiis voluptatem. Enim repudiandae omnis dolor quas. Aliquam adipisci aliquam in illo qui id numquam. Incidunt quasi et eligendi eaque quis et impedit sequi.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(42,'Quas molestiae delectus quibusdam et mollitia.',43,'1974-01-03','Misterio','tg','Et aliquam cum enim blanditiis. In qui eius qui ratione beatae est necessitatibus. Perferendis quis praesentium quis recusandae. Reiciendis magni magnam sunt ratione inventore non. Facilis non eligendi doloremque doloribus quisquam quisquam voluptatum repellat.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(43,'Cum est iusto sunt et voluptas eveniet porro.',40,'1998-12-17','Fantasia','si','Blanditiis quasi perferendis est pariatur perspiciatis distinctio. Tenetur et distinctio provident quibusdam et corporis. Consequatur recusandae fugit porro expedita facilis. Accusantium expedita aut dolorum at perferendis saepe sequi.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(44,'Et et doloribus ipsam omnis illo ducimus.',46,'2012-07-11','Ciencia Ficción','aa','Adipisci repudiandae incidunt quis voluptatem. Repellendus itaque reiciendis quasi perspiciatis voluptatem aliquam quibusdam quam. Aperiam cupiditate est beatae accusantium omnis veniam. Quo laboriosam enim ut repudiandae.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(45,'Dolorem quia doloribus expedita eum.',51,'2022-08-31','Ficción','ii','Maiores deleniti cum non nihil fuga deserunt beatae voluptas. Quia et ducimus qui suscipit. Et reiciendis et sed nesciunt. Et officiis qui perferendis quidem sint rerum adipisci.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(46,'Officia quo omnis odio earum ullam animi.',32,'1979-08-02','Misterio','ts','Porro aut dolorem non optio odio velit repellat. Sed consequuntur dolorem doloremque in architecto numquam. Aut debitis aut sequi ut.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(47,'Eveniet voluptas beatae ut.',43,'2021-09-13','No Ficción','be','Porro tenetur facilis perspiciatis in sit illum. Eligendi ea quasi sapiente quidem similique et nihil mollitia. Enim et blanditiis et est et perspiciatis. Et at consequuntur nesciunt nesciunt.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(48,'Sit ratione voluptatem ipsum quia.',30,'2022-09-23','Fantasia','br','Vitae velit consequatur fuga hic. Et et quae vel. Ipsa amet eos sunt magnam consequatur sed tempore.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(49,'Voluptas enim nihil consectetur totam.',39,'2002-11-07','Biografía','ht','Velit consequatur soluta libero perspiciatis facilis est tempore. Fugit aperiam iusto praesentium voluptatem atque.','2024-09-14 22:56:28','2024-09-14 22:56:28'),(50,'Est expedita excepturi non et sed.',48,'2002-04-11','Ciencia Ficción','gv','Explicabo et accusantium odio in. Inventore dolorem voluptas nostrum dicta et. Quas nemo consequatur eveniet dolor architecto quia cum. Non deserunt nobis natus voluptatem incidunt nemo.','2024-09-14 22:56:28','2024-09-14 22:56:28');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2024-09-13 20:00:38','2024-09-13 20:00:38',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,10,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,11,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2024-09-13 20:00:38','2024-09-13 20:00:38','voyager.settings.index',NULL),(11,1,'Autors','','_self',NULL,NULL,NULL,15,'2024-09-14 15:20:50','2024-09-14 15:20:50','voyager.autors.index',NULL),(13,1,'Libros','','_self',NULL,NULL,NULL,16,'2024-09-15 02:18:58','2024-09-15 02:18:58','voyager.libros.index',NULL),(14,1,'Covid Dashboard Views','','_self',NULL,NULL,NULL,17,'2024-09-15 02:30:47','2024-09-15 02:30:47','voyager.covid-dashboard-views.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2024-09-13 20:00:38','2024-09-13 20:00:38');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1),(25,'2024_09_14_142037_create_autors_table',2),(28,'2024_09_14_145603_create_libros_table',3),(29,'2024_09_14_234350_create_covid_dashboard_views_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(1,2),(1,3),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2024-09-13 20:00:38','2024-09-13 20:00:38'),(2,'browse_bread',NULL,'2024-09-13 20:00:38','2024-09-13 20:00:38'),(3,'browse_database',NULL,'2024-09-13 20:00:38','2024-09-13 20:00:38'),(4,'browse_media',NULL,'2024-09-13 20:00:38','2024-09-13 20:00:38'),(5,'browse_compass',NULL,'2024-09-13 20:00:38','2024-09-13 20:00:38'),(6,'browse_menus','menus','2024-09-13 20:00:38','2024-09-13 20:00:38'),(7,'read_menus','menus','2024-09-13 20:00:38','2024-09-13 20:00:38'),(8,'edit_menus','menus','2024-09-13 20:00:38','2024-09-13 20:00:38'),(9,'add_menus','menus','2024-09-13 20:00:38','2024-09-13 20:00:38'),(10,'delete_menus','menus','2024-09-13 20:00:38','2024-09-13 20:00:38'),(11,'browse_roles','roles','2024-09-13 20:00:38','2024-09-13 20:00:38'),(12,'read_roles','roles','2024-09-13 20:00:38','2024-09-13 20:00:38'),(13,'edit_roles','roles','2024-09-13 20:00:38','2024-09-13 20:00:38'),(14,'add_roles','roles','2024-09-13 20:00:38','2024-09-13 20:00:38'),(15,'delete_roles','roles','2024-09-13 20:00:38','2024-09-13 20:00:38'),(16,'browse_users','users','2024-09-13 20:00:38','2024-09-13 20:00:38'),(17,'read_users','users','2024-09-13 20:00:38','2024-09-13 20:00:38'),(18,'edit_users','users','2024-09-13 20:00:38','2024-09-13 20:00:38'),(19,'add_users','users','2024-09-13 20:00:38','2024-09-13 20:00:38'),(20,'delete_users','users','2024-09-13 20:00:38','2024-09-13 20:00:38'),(21,'browse_settings','settings','2024-09-13 20:00:38','2024-09-13 20:00:38'),(22,'read_settings','settings','2024-09-13 20:00:38','2024-09-13 20:00:38'),(23,'edit_settings','settings','2024-09-13 20:00:38','2024-09-13 20:00:38'),(24,'add_settings','settings','2024-09-13 20:00:38','2024-09-13 20:00:38'),(25,'delete_settings','settings','2024-09-13 20:00:38','2024-09-13 20:00:38'),(26,'browse_autors','autors','2024-09-14 15:20:50','2024-09-14 15:20:50'),(27,'read_autors','autors','2024-09-14 15:20:50','2024-09-14 15:20:50'),(28,'edit_autors','autors','2024-09-14 15:20:50','2024-09-14 15:20:50'),(29,'add_autors','autors','2024-09-14 15:20:50','2024-09-14 15:20:50'),(30,'delete_autors','autors','2024-09-14 15:20:50','2024-09-14 15:20:50'),(36,'browse_libros','libros','2024-09-15 02:18:58','2024-09-15 02:18:58'),(37,'read_libros','libros','2024-09-15 02:18:58','2024-09-15 02:18:58'),(38,'edit_libros','libros','2024-09-15 02:18:58','2024-09-15 02:18:58'),(39,'add_libros','libros','2024-09-15 02:18:58','2024-09-15 02:18:58'),(40,'delete_libros','libros','2024-09-15 02:18:58','2024-09-15 02:18:58'),(41,'browse_covid_dashboard_views','covid_dashboard_views','2024-09-15 02:30:47','2024-09-15 02:30:47'),(42,'read_covid_dashboard_views','covid_dashboard_views','2024-09-15 02:30:47','2024-09-15 02:30:47'),(43,'edit_covid_dashboard_views','covid_dashboard_views','2024-09-15 02:30:47','2024-09-15 02:30:47'),(44,'add_covid_dashboard_views','covid_dashboard_views','2024-09-15 02:30:47','2024-09-15 02:30:47'),(45,'delete_covid_dashboard_views','covid_dashboard_views','2024-09-15 02:30:47','2024-09-15 02:30:47');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2024-09-13 20:00:38','2024-09-13 20:00:38'),(2,'user','Normal User','2024-09-13 20:00:38','2024-09-13 20:00:38'),(3,'operativo','Operativo','2024-09-14 23:42:27','2024-09-14 23:42:27');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Miguel','admin@pruebafs.com','users/default.png',NULL,'$2y$10$Wxl/KYahSSjNBh5oFltFoOKFEeyMNnFBU6vbzor8nLcFEkTGAabpG',NULL,NULL,'2024-09-13 20:01:38','2024-09-13 20:01:38'),(2,2,'Usuario de prueba','user@prueba.com','users/default.png',NULL,'$2y$10$ut5bDAdwKTUSXzrDAoXfi.gy3AADgJ7ZrpYjzCbXjZmCnoOs0RYaa',NULL,'{\"locale\":\"en\"}','2024-09-14 16:11:12','2024-09-14 16:13:34');
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

-- Dump completed on 2024-09-15  4:03:07
