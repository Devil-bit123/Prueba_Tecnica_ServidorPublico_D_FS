LOCK TABLES `autors` WRITE;
/*!40000 ALTER TABLE `autors` DISABLE KEYS */;
INSERT INTO `autors` VALUES (6,'Mr. Afton Kuphal','1982-05-10','2024-09-16 14:03:30','2024-09-16 14:03:30'),(7,'Kade Bashirian I','1971-06-13','2024-09-16 14:03:30','2024-09-16 14:03:30'),(8,'Vance Rosenbaum','1987-06-18','2024-09-16 14:03:30','2024-09-16 14:03:30'),(9,'Dorthy West','1991-03-11','2024-09-16 14:03:30','2024-09-16 14:03:30'),(10,'Angus Mante I','2010-03-15','2024-09-16 14:03:30','2024-09-16 14:03:30'),(11,'Zaria Ferry','1981-10-22','2024-09-16 14:06:14','2024-09-16 14:06:14'),(12,'Mr. Travon Kris DVM','2021-01-28','2024-09-16 14:06:14','2024-09-16 14:06:14'),(13,'Nora Harris','1987-08-18','2024-09-16 14:06:14','2024-09-16 14:06:14'),(14,'Hilbert Bashirian','2008-01-17','2024-09-16 14:06:14','2024-09-16 14:06:14'),(15,'Prof. Celestino Leuschke','1996-10-12','2024-09-16 14:06:14','2024-09-16 14:06:14'),(16,'Waino Bartoletti','2019-06-23','2024-09-16 14:07:23','2024-09-16 14:07:23'),(17,'Daphne Weimann','2008-02-01','2024-09-16 14:07:23','2024-09-16 14:07:23'),(18,'Mr. Murray Harvey','1973-07-09','2024-09-16 14:07:23','2024-09-16 14:07:23'),(19,'Shaniya Kautzer Sr.','2021-01-26','2024-09-16 14:07:23','2024-09-16 14:07:23'),(20,'Miss Anastasia Yundt Jr.','1972-02-28','2024-09-16 14:07:24','2024-09-16 14:07:24'),(21,'Nayeli Dicki','2015-07-04','2024-09-16 14:09:13','2024-09-16 14:09:13'),(22,'Dr. Chauncey Boyer','1982-11-16','2024-09-16 14:09:13','2024-09-16 14:09:13'),(23,'Katelyn Luettgen','2001-01-22','2024-09-16 14:09:14','2024-09-16 14:09:14'),(24,'Miss Jody Waelchi','2002-08-14','2024-09-16 14:09:14','2024-09-16 14:09:14'),(25,'Gerald Wunsch','2009-05-08','2024-09-16 14:09:14','2024-09-16 14:09:14'),(26,'Carolanne Strosin','1975-09-19','2024-09-16 14:10:03','2024-09-16 14:10:03'),(27,'Karli Corkery','1978-06-10','2024-09-16 14:10:04','2024-09-16 14:10:04'),(28,'Justyn Reilly','1988-04-05','2024-09-16 14:10:04','2024-09-16 14:10:04'),(29,'Ms. Jacklyn VonRueden','2007-12-10','2024-09-16 14:10:04','2024-09-16 14:10:04'),(30,'Miss Viviane Schuster II','2001-05-21','2024-09-16 14:10:04','2024-09-16 14:10:04');
LOCK TABLES `covid_dashboard_views` WRITE;
/*!40000 ALTER TABLE `covid_dashboard_views` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (5,'Eaque quidem in et architecto.',6,'1982-04-17','Terror','ki','Fugit consectetur et dolorem. Sed praesentium neque aperiam eligendi animi ducimus. Velit recusandae doloribus corrupti qui et et minus.','2024-09-16 14:03:30','2024-09-16 14:03:30'),(6,'Beatae natus nostrum delectus exercitationem unde magnam veritatis.',6,'1973-10-29','Romance','gn','Adipisci ex tenetur expedita et rerum. Fugiat dolorem et voluptas. Soluta ducimus sunt nihil id ullam hic. Excepturi distinctio molestiae delectus a eveniet qui.','2024-09-16 14:03:30','2024-09-16 14:03:30'),(7,'Perspiciatis quia sapiente assumenda reiciendis dolor.',6,'1996-05-05','Romance','az','Aliquam quam ut nesciunt ducimus qui perferendis consequatur. Provident voluptates nam omnis saepe nostrum numquam. Omnis doloribus nemo est enim possimus consectetur.','2024-09-16 14:03:30','2024-09-16 14:03:30'),(8,'Ipsum sunt voluptas sint maiores autem iste omnis est.',8,'2001-05-01','Romance','ab','Dolor ut id doloremque magnam accusamus. Eos eaque sunt ducimus vel quos dolore maiores omnis. Quia ipsum sed id asperiores veritatis. Dolores tempora possimus quia voluptas distinctio velit.','2024-09-16 14:03:30','2024-09-16 14:03:30'),(9,'Est et eius neque id est qui.',9,'1978-09-21','Sci Fi','en','Qui voluptate earum dolorem sequi omnis. Laboriosam praesentium voluptatem exercitationem consequatur deserunt molestias. Natus numquam illum dolor officia sit eaque. Dolorem doloremque eos consequatur nobis.','2024-09-16 14:03:30','2024-09-16 14:03:30'),(11,'Fugiat et rerum non voluptas libero ut.',11,'2023-05-15','Terror','zu','Aperiam optio expedita ut quos. Qui quis error et ut eveniet. Sed eum atque molestiae quae et saepe. Quia quas incidunt vel distinctio libero minima possimus. Accusamus eos necessitatibus est consequatur quia.','2024-09-16 14:06:14','2024-09-16 14:06:14'),(12,'Quaerat distinctio suscipit voluptas commodi tenetur.',11,'1989-03-24','Romance','os','Accusamus voluptatum rem maiores. Aut sed provident voluptatem quae. Quae est nam labore possimus sunt aliquam qui.','2024-09-16 14:06:14','2024-09-16 14:06:14'),(13,'Nam fuga neque mollitia itaque aut earum rem.',11,'1975-08-12','Romance','ha','Doloribus reprehenderit quod et autem. Ut sunt quam praesentium deleniti. Dicta consequatur sit in enim nesciunt iste ut earum.','2024-09-16 14:06:14','2024-09-16 14:06:14'),(14,'Libro de prueba',12,'2020-02-12','Ficcion','es','Prueba','2024-09-16 14:06:14','2024-09-16 14:06:14'),(15,'Natus eos est rerum ut.',13,'1972-09-02','Romance','bm','Aut sequi est itaque. Consequatur est magnam voluptatem repudiandae reprehenderit ea fugiat.','2024-09-16 14:06:14','2024-09-16 14:06:14'),(16,'Unde temporibus neque in quam quisquam veritatis praesentium.',14,'1977-06-19','Sci Fi','el','Aut aspernatur exercitationem expedita molestias ut. Fugiat numquam quia qui numquam voluptate possimus provident. Cum est consequatur labore veniam sint molestias molestiae. Quod dolorum placeat quis debitis minus ipsum consectetur.','2024-09-16 14:06:14','2024-09-16 14:06:14'),(18,'Ut maiores voluptas numquam quas sit harum.',16,'1993-07-16','Sci Fi','ie','Veritatis officiis et minima eaque quaerat dolorem id. Non aperiam quidem magnam voluptatem necessitatibus ab sequi. Eveniet occaecati rerum sit commodi. Saepe minima qui laboriosam cum.','2024-09-16 14:07:23','2024-09-16 14:07:23'),(19,'Libero quo animi praesentium velit est sunt.',16,'1994-11-28','Terror','xh','Enim perferendis dolor quidem qui animi quisquam. Ut qui ut esse repellendus. Laudantium dolor nihil reprehenderit a iusto. Temporibus quos accusamus illo omnis adipisci atque maiores.','2024-09-16 14:07:23','2024-09-16 14:07:23'),(20,'Quod aut qui voluptatem molestiae.',16,'2004-06-25','Terror','he','Minima corporis qui omnis omnis. Temporibus necessitatibus qui reprehenderit. Quia veritatis omnis quo assumenda. Doloribus veritatis cupiditate voluptates omnis.','2024-09-16 14:07:23','2024-09-16 14:07:23'),(21,'Libro de prueba',17,'2020-02-12',/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1),(25,'2024_09_14_142037_create_autors_table',1),(26,'2024_09_14_145603_create_libros_table',1),(27,'2024_09_14_234350_create_covid_dashboard_views_table',1);
LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

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
LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Dimitri Lockman','mkonopelski@example.net','users/default.png','2024-09-16 14:03:30','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','O1Fq1zrKyf',NULL,'2024-09-16 14:03:30','2024-09-16 14:03:30'),(2,NULL,'Prof. Berry McLaughlin','laurianne.wiza@example.org','users/default.png','2024-09-16 14:03:30','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','yEKuMRigen',NULL,'2024-09-16 14:03:30','2024-09-16 14:03:30'),(3,NULL,'Ms. Magnolia Rosenbaum III','tkilback@example.org','users/default.png','2024-09-16 14:03:30','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VJ1YTQ7XyT',NULL,'2024-09-16 14:03:30','2024-09-16 14:03:30'),(4,NULL,'Luis Beier','juana71@example.com','users/default.png','2024-09-16 14:03:30','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','EYM3Fb1nly',NULL,'2024-09-16 14:03:30','2024-09-16 14:03:30'),(5,NULL,'Phyllis Lang','jevon.mante@example.net','users/default.png','2024-09-16 14:03:30','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9Cu9VN4xCv',NULL,'2024-09-16 14:03:30','2024-09-16 14:03:30'),(6,NULL,'Keagan Schimmel','white.erling@example.org','users/default.png','2024-09-16 14:06:12','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','wIakcfiauQ',NULL,'2024-09-16 14:06:12','2024-09-16 14:06:12'),(7,NULL,'Timmothy Zulauf','pearlie.purdy@example.net','users/default.png','2024-09-16 14:06:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','SNvyErzqUL',NULL,'2024-09-16 14:06:14','2024-09-16 14:06:14'),(8,NULL,'Rachel Collier Jr.','mitchel14@example.com','users/default.png','2024-09-16 14:06:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','hz6WGEZcPm',NULL,'2024-09-16 14:06:14','2024-09-16 14:06:14'),(9,NULL,'Jerad Anderson','norwood35@example.com','users/default.png','2024-09-16 14:06:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','55bxtM5MAc',NULL,'2024-09-16 14:06:14','2024-09-16 14:06:14'),(10,NULL,'Kendra Cronin','corine99@example.net','users/default.png','2024-09-16 14:06:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3HtBE7Vjk3',NULL,'2024-09-16 14:06:14','2024-09-16 14:06:14'),(11,NULL,'Niko Hermann','bradley73@example.net','users/default.png','2024-09-16 14:07:23','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OfHHu3ydmX',NULL,'2024-09-16 14:07:23','2024-09-16 14:07:23'),(12,NULL,'Prof. Mathias Schaden PhD','hhilpert@example.com','users/default.png','2024-09-16 14:07:23','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','plPhIrKNP0',NULL,'2024-09-16 14:07:23','2024-09-16 14:07:23'),(13,NULL,'Mr. Tony Ernser','althea68@example.com','users/default.png','2024-09-16 14:07:23','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','UjiQDt5As4',NULL,'2024-09-16 14:07:23','2024-09-16 14:07:23'),(14,NULL,'Norval Botsford I','max10@example.net','users/default.png','2024-09-16 14:07:23','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','NcxpOcnVbX',NULL,'2024-09-16 14:07:23','2024-09-16 14:07:23'),(15,NULL,'Stella O\'Connell','schoen.lavina@example.com','users/default.png','2024-09-16 14:07:24','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','y2bx793Teg',NULL,'2024-09-16 14:07:24','2024-09-16 14:07:24'),(16,NULL,'Ara Gerlach DVM','rohan.enrique@example.com','users/default.png','2024-09-16 14:09:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zlTXbQGTFg',NULL,'2024-09-16 14:09:13','2024-09-16 14:09:13'),(17,NULL,'Judah Huel','thills@example.net','users/default.png','2024-09-16 14:09:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IfNPScxtZK',NULL,'2024-09-16 14:09:13','2024-09-16 14:09:13'),(18,NULL,'Nils Goldner','zechariah16@example.org','users/default.png','2024-09-16 14:09:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Cxr3DvGYDb',NULL,'2024-09-16 14:09:14','2024-09-16 14:09:14'),(19,NULL,'Mr. Samson Schuppe','idella05@example.net','users/default.png','2024-09-16 14:09:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','MlbnI4jo0E',NULL,'2024-09-16 14:09:14','2024-09-16 14:09:14'),(20,NULL,'Hellen Ondricka','rowe.garth@example.net','users/default.png','2024-09-16 14:09:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','RYzVe2YYc0',NULL,'2024-09-16 14:09:14','2024-09-16 14:09:14'),(21,NULL,'Nakia Grimes','norma.hegmann@example.com','users/default.png','2024-09-16 14:10:03','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','iFO9yzTc92',NULL,'2024-09-16 14:10:03','2024-09-16 14:10:03'),(22,NULL,'Mrs. Johanna O\'Connell','loraine.rowe@example.org','users/default.png','2024-09-16 14:10:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','H43a3tObVr',NULL,'2024-09-16 14:10:04','2024-09-16 14:10:04'),(23,NULL,'Janiya Conroy','mann.letha@example.net','users/default.png','2024-09-16 14:10:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OutsRIK1OA',NULL,'2024-09-16 14:10:04','2024-09-16 14:10:04'),(24,NULL,'Sheridan Franecki','aric.nienow@example.net','users/default.png','2024-09-16 14:10:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8tcxdhEx2D',NULL,'2024-09-16 14:10:04','2024-09-16 14:10:04'),(25,NULL,'Dr. Mya Abernathy DVM','darrick21@example.org','users/default.png','2024-09-16 14:10:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GPorropEUY',NULL,'2024-09-16 14:10:04','2024-09-16 14:10:04');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-16  9:13:34
