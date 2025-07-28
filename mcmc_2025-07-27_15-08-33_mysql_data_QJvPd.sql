-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: mcmc
-- ------------------------------------------------------
-- Server version	5.7.44-log

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
-- Table structure for table `luckperms_actions`
--

DROP TABLE IF EXISTS `luckperms_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luckperms_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` bigint(20) NOT NULL,
  `actor_uuid` varchar(36) NOT NULL,
  `actor_name` varchar(100) NOT NULL,
  `type` char(1) NOT NULL,
  `acted_uuid` varchar(36) NOT NULL,
  `acted_name` varchar(36) NOT NULL,
  `action` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_actions`
--

LOCK TABLES `luckperms_actions` WRITE;
/*!40000 ALTER TABLE `luckperms_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `luckperms_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_group_permissions`
--

DROP TABLE IF EXISTS `luckperms_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luckperms_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `server` varchar(36) NOT NULL,
  `world` varchar(64) NOT NULL,
  `expiry` bigint(20) NOT NULL,
  `contexts` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `luckperms_group_permissions_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_group_permissions`
--

LOCK TABLES `luckperms_group_permissions` WRITE;
/*!40000 ALTER TABLE `luckperms_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `luckperms_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_groups`
--

DROP TABLE IF EXISTS `luckperms_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luckperms_groups` (
  `name` varchar(36) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_groups`
--

LOCK TABLES `luckperms_groups` WRITE;
/*!40000 ALTER TABLE `luckperms_groups` DISABLE KEYS */;
INSERT INTO `luckperms_groups` VALUES ('default');
/*!40000 ALTER TABLE `luckperms_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_messenger`
--

DROP TABLE IF EXISTS `luckperms_messenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luckperms_messenger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_messenger`
--

LOCK TABLES `luckperms_messenger` WRITE;
/*!40000 ALTER TABLE `luckperms_messenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `luckperms_messenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_players`
--

DROP TABLE IF EXISTS `luckperms_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luckperms_players` (
  `uuid` varchar(36) NOT NULL,
  `username` varchar(16) NOT NULL,
  `primary_group` varchar(36) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `luckperms_players_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_players`
--

LOCK TABLES `luckperms_players` WRITE;
/*!40000 ALTER TABLE `luckperms_players` DISABLE KEYS */;
INSERT INTO `luckperms_players` VALUES ('2bb2e024-2e80-3877-92ae-3bce3109c622','liangdezai','default');
/*!40000 ALTER TABLE `luckperms_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_tracks`
--

DROP TABLE IF EXISTS `luckperms_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luckperms_tracks` (
  `name` varchar(36) NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_tracks`
--

LOCK TABLES `luckperms_tracks` WRITE;
/*!40000 ALTER TABLE `luckperms_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `luckperms_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_user_permissions`
--

DROP TABLE IF EXISTS `luckperms_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luckperms_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `server` varchar(36) NOT NULL,
  `world` varchar(64) NOT NULL,
  `expiry` bigint(20) NOT NULL,
  `contexts` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `luckperms_user_permissions_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_user_permissions`
--

LOCK TABLES `luckperms_user_permissions` WRITE;
/*!40000 ALTER TABLE `luckperms_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `luckperms_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textures`
--

DROP TABLE IF EXISTS `textures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textures` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `uploader` int(11) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `upload_at` datetime NOT NULL,
  `likes` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textures`
--

LOCK TABLES `textures` WRITE;
/*!40000 ALTER TABLE `textures` DISABLE KEYS */;
INSERT INTO `textures` VALUES (1,'blueblack-hoodie-girl_1','alex','a51599405d24330f127ce4575f662cd89d8c4768818ef7ae130f8b79f7d6a80b',4,5,0,'2024-08-04 18:44:06',1),(2,'liquidbounce','cape','9e089c730bc061509d7db4c2e43ec3cdeda3c7c4f96172ceb4c95ac55de150c1',136,1,1,'2024-08-10 09:33:41',1),(3,'f11f0c02f6afb358','alex','1b42e76bc55270e4bfe46c379bb3f6cdafc439647196301bb21067d72dfa3e14',2,21,1,'2024-08-27 20:22:58',3),(4,'Orionte','alex','f27473935d381d03abd478444e4359640bd53daee3d697e5023af2781c59c3de',4,18,0,'2024-08-27 20:39:56',1),(5,'Orionte','cape','6a8d1e7c26fc0d1947105d0e38c5292404acd42db0b5e360c5e3ff3468c06373',3,18,0,'2024-08-27 20:40:31',1),(6,'Nachoneko','alex','00e443f32dcc69c5ab7dd69bf7ad13eaaa4fcbb8d84f6c7f8f18987285857902',2,1,0,'2024-08-31 13:00:59',1);
/*!40000 ALTER TABLE `textures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_closet`
--

DROP TABLE IF EXISTS `user_closet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_closet` (
  `user_uid` int(11) NOT NULL,
  `texture_tid` int(11) NOT NULL,
  `item_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_closet`
--

LOCK TABLES `user_closet` WRITE;
/*!40000 ALTER TABLE `user_closet` DISABLE KEYS */;
INSERT INTO `user_closet` VALUES (5,1,'blueblack-hoodie-girl_1'),(1,2,'liquidbounce'),(21,3,'f11f0c02f6afb358'),(18,4,'Orionte'),(18,5,'Orionte'),(22,3,'f11f0c02f6afb358'),(1,6,'Nachoneko'),(24,3,'f11f0c02f6afb358');
/*!40000 ALTER TABLE `user_closet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `score` int(11) DEFAULT NULL,
  `avatar` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` int(11) NOT NULL DEFAULT '0',
  `last_sign_at` datetime DEFAULT NULL,
  `register_at` datetime DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastlogin` bigint(20) DEFAULT NULL,
  `x` double NOT NULL DEFAULT '0',
  `y` double NOT NULL DEFAULT '0',
  `z` double NOT NULL DEFAULT '0',
  `world` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'world',
  `regdate` bigint(20) NOT NULL DEFAULT '0',
  `regip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yaw` double(8,2) DEFAULT NULL,
  `pitch` double(8,2) DEFAULT NULL,
  `isLogged` smallint(6) NOT NULL DEFAULT '0',
  `hasSession` smallint(6) NOT NULL DEFAULT '0',
  `totp` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'me@linyiyuan.us','lin8',1201,6,'$SHA$a81526c12cdedeb3$08f9a6a7583e5b06063a01a359abeb7271bee8a60708d3640754df94b96e8ef8','192.168.1.141',2,'2024-12-08 20:10:14','2024-08-04 09:08:47',1,'','IcuSwgNvzBhhRED6Y6tOc7u83PxkpkTfgiCh5VhZRdFUzapu2qAb0bNMygid','lin8','lin8',1734143818854,0,0,0,'world',1722733727000,'182.34.52.213',NULL,NULL,0,0,NULL),(2,'13103417757@139.com','445454',1025,0,'$SHA$6abb5efb5214c459$e363f73fbec7432b28f52412f28472f142488cb0e210907245ed342c6e867ae4','221.205.19.114',0,'2024-08-04 09:52:41','2024-08-04 09:52:19',1,'','Z0kVO8M8axWfWIEYO20GHnx0DUv0apklAaoOESQCk0H8D2bZkSZRugoiuPoW','445454','445454',1734146344904,0,0,0,'world',1722736339000,NULL,NULL,NULL,0,0,NULL),(3,'1793206097@qq.com','_cai_shen_',1000,0,'$SHA$b07f9f00eed8a736$66a4ae88709eebc90fc84e792ae38856ebe386a212b352b879bc6a38e2d950c0','127.0.0.1',0,'2024-08-03 14:15:31','2024-08-04 14:15:31',0,'',NULL,'_cai_shen_','_cai_shen_',1722834792433,0,0,0,'world',1722752131000,NULL,NULL,NULL,0,0,NULL),(4,'3436451646@qq.com','Tiamo_11',1052,0,'$SHA$c84b7f776681264f$efcfa0d06759ed985bec8e649c9b2cade8eb1da5695d4a69f5554dfd6c60ca75','127.0.0.1',0,'2024-08-04 18:42:11','2024-08-04 18:42:00',0,'',NULL,'tiamo_11','Tiamo_11',1722860297170,0,0,0,'world',1722768120000,NULL,NULL,NULL,0,0,NULL),(5,'1543277023gt@gmail.com','TITC2016',960,1,'$SHA$81e75badecf1c076$60e987762b79f238920a46cb9aa6963ed00332db75738fd1714e9947d5076fb6','101.226.41.77',0,'2024-08-03 18:42:27','2024-08-04 18:42:27',0,'','zSMDhgiF5F8GU57mRztNpixRLS1Z4c811mHs9yFT4NEqcytKdB55fbS3kOlb','titc2016','TITC2016',NULL,0,0,0,'world',1722768147000,NULL,NULL,NULL,0,0,NULL),(6,'3590431611@qq.com','redblainollw',1000,0,'$SHA$fb380999ce5be807$0d965376cdd7b63a89d4d2c25b70a3adca2561c0d0f53018d31d2c0ceebe220d','2408:8427:210:8132:b8d3:4fff:fef4:a1d1',0,'2024-08-03 18:51:51','2024-08-04 18:51:51',0,'',NULL,'redblainollw','redblainollw',NULL,0,0,0,'world',1722768711000,NULL,NULL,NULL,0,0,NULL),(7,'3330793536@qq.com','kedu3999',1000,0,'$SHA$2479520177381bf4$2bd925b289279179e69a95fa236039b00272553fa4d8b20588db1656d1acdccd','91.103.121.150',0,'2024-08-03 18:58:14','2024-08-04 18:58:14',0,'',NULL,'kedu3999','kedu3999',NULL,0,0,0,'world',1722769094000,NULL,NULL,NULL,0,0,NULL),(8,'a13682943829@foxmail.com','Ca1sh_',1000,0,'$SHA$eeddd0dc7d4cd96d$a443825423f1af164d3a4488cfd0c9ced6ce710536776286590788ddeaaf7c60','127.0.0.1',0,'2024-08-03 19:05:12','2024-08-04 19:05:12',0,'',NULL,'ca1sh_','Ca1sh_',1722780894383,0,0,0,'world',1722769512000,NULL,NULL,NULL,0,0,NULL),(9,'2131409062@qq.com','lin87885',1000,0,'$SHA$0f98814795c9c324$eb3a3f66fe86dd08c4492e3cbb2375769cabcdfea2e9d1bbf36d883a23a0f7ad','192.168.1.1',0,'2024-08-06 15:19:28','2024-08-07 15:19:28',0,'',NULL,'lin87885','lin87885',1728209318043,0,0,0,'world',1723015168000,NULL,NULL,NULL,0,0,NULL),(11,'1653630306@qq.com','MochaRhyme35543',1010,0,'$SHA$c70207bd3aaf6cdc$17569130728036f63748046e453735322a0d9bb60cc422a4f27fb450c203967e','127.0.0.1',0,'2024-08-07 15:55:18','2024-08-07 15:55:04',0,'',NULL,'mocharhyme35543','MochaRhyme35543',1723028452935,0,0,0,'world',1723017304000,NULL,NULL,NULL,0,0,NULL),(15,'848726747@qq.com','Kongshan123',1069,0,'$SHA$4cdea6da1f98b086$0cf0ed9d5e099ece0459635400dd0bdb2a4e48c10c12e7d904537fc75da5fd8d','2409:8962:414c:1d49:1810:e413:7223:8cbd',0,'2024-12-14 09:53:58','2024-08-09 15:06:49',0,'','NwqP0ab7LCY2meiiTiV2kQ8mZebtRkxSZl6Kpi2pHV2dbD0PEOdtNbLPXutL','kongshan123','Kongshan123',1734142154804,0,0,0,'world',1723187209000,NULL,NULL,NULL,0,0,NULL),(16,'13103417787@139.com','ventingMite9513',1000,0,'$SHA$900f9cc1e3e1f87c$83ee8ca6e4da0973e0b42b2e95e4761c683d008884474fa1b7148d4591965a64','2408:8427:a81:9e6d:dc81:80ff:fe3a:d373',0,'2024-08-11 16:14:06','2024-08-12 16:14:06',0,'',NULL,'ventingmite9513','ventingMite9513',NULL,0,0,0,'world',1723450446000,NULL,NULL,NULL,0,0,NULL),(17,'luin@wacca.scfd.top','SteveCodeFox',1018,0,'$SHA$906165992e7efb0a$606ce9fd3cfd9901771e80ad9afccc2ad3c3f4d2133c983226a43bc76d6844b7','127.0.0.1',0,'2024-08-12 16:21:22','2024-08-12 16:21:05',0,'',NULL,'stevecodefox','SteveCodeFox',1723450917750,0,0,0,'world',1723450865000,NULL,NULL,NULL,0,0,NULL),(18,'3246257484@qq.com','OrionteKargast',1106,0,'$SHA$03c8e45b2f1b27d2$cae14a2c9804c3589cece46dbde0c16ddc6c524ef9eb9d5f72044fcecbce2ccc','117.44.132.214',0,'2024-08-27 20:39:28','2024-08-25 18:22:55',0,'','xxciE6OGDsqJ9ax9dWprycPpFfcLy0Yh8uN0eyjhUKaBt6n1RdC8d7lhDnb8','oriontekargast','OrionteKargast',1725082228625,0,0,0,'world',1724581375000,NULL,NULL,NULL,0,0,NULL),(19,'386515427@qq.com','jiujie114',1061,0,'$SHA$d38da597f3a7d1ce$3ec8b9e361e4e62a0ddd039da0db3bb1c0e4b1845150ce82518311af065c7a03','144.7.65.242',0,'2024-08-27 20:01:12','2024-08-27 19:24:14',0,'','5p6pBOWNtQroBMNc0DoTJwutsvpKSbHOkhGrulv6x8eT6pFdqFsSBJRZmTfM','jiujie114','jiujie114',1725009541409,0,0,0,'world',1724757854000,NULL,NULL,NULL,0,0,NULL),(20,'36734638@qq.com','Loic_0117',1000,0,'$SHA$90bbdf2eed5fe31f$d3db8ceeec66117d40c019e4a51bdbe2b021674d549edb8e4d9e17b0f76ef2c4','114.92.181.191',0,'2024-08-26 20:03:18','2024-08-27 20:03:18',0,'',NULL,'loic_0117','Loic_0117',1725172668504,0,0,0,'world',1724760198000,NULL,NULL,NULL,0,0,NULL),(21,'hightskybline@gmail.com','helmuth',1192,3,'$SHA$fe291317829b1ae1$87eebad76b369efe91d030100d96ff6280cf28a58ffbaeb707b0a95bb7a1c970','115.151.187.159',0,'2024-08-31 11:15:35','2024-08-27 20:20:33',0,'','JqoC6RfMpJZLqnUsYIIxai7iHE4fpEUslhgLk0w6SGxmVl52P4yYRYQQQmF0','helmuth','helmuth',1724837594248,0,0,0,'world',1724761233000,NULL,NULL,NULL,0,0,NULL),(22,'1093106486@qq.com','qisi',1028,0,'$SHA$85bac1f6a766efb9$57be4b40eb32e0c0d149ef34e869a9da2c6c965e11981516b7471bddeaccbb03','2409:8a60:c017:81a0:3893:d724:dc40:e5cd',0,'2024-08-28 16:00:35','2024-08-28 16:00:02',0,'',NULL,'qisi','qisi',NULL,0,0,0,'world',1724832002000,NULL,NULL,NULL,0,0,NULL),(26,'15967490024@163.com','Aesdf',1000,0,'$SHA$1d650e16038b5959$a1d6a0777cb89e3cdd6c3a9a06ea925cba039a2eb58cada3f91dfb3b6c61cb52','112.12.200.212',0,'2024-08-30 17:01:52','2024-08-31 17:01:52',0,'',NULL,'aesdf','Aesdf',1725096130025,0,0,0,'world',1725094912000,NULL,NULL,NULL,0,0,NULL),(28,'2471825164@qq.com','float11',1090,0,'$SHA$f9889ac9106950a4$9f6fe31e2979d40e5e9c694c9b89b3cad8bc50ced02554e75941be8792c5ac9e','123.4.111.19',0,'2024-10-06 19:46:16','2024-10-06 19:46:06',0,'',NULL,'float11','float11',1728217493383,0,0,0,'world',1728215166000,NULL,NULL,NULL,0,0,NULL),(29,'3951950358@qq.com','SuperPotato',1083,0,'$SHA$b1da8d11c1d650a8$2f4511f95531be62a65fb933f4ce823223b4a226f2d2649fceb1cda16a61bb52','117.152.95.27',0,'2024-12-14 10:29:10','2024-12-14 10:29:02',0,'',NULL,'superpotato','SuperPotato',1734145645655,0,0,0,'world',1734143342000,NULL,NULL,NULL,0,0,NULL),(30,'liangdezai@outlook.com','liangdezai',NULL,0,'$SHA$88bef5483e50d0d3$2d9f7eef70f7c0de2644acc40716da34a335ca807ca428e909aa5590dfcfdf45','182.34.52.246',0,NULL,NULL,0,'',NULL,'liangdezai','liangdezai',1753623123534,0,0,0,'world',1753623123509,'182.34.52.246',NULL,NULL,1,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuid`
--

DROP TABLE IF EXISTS `uuid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uuid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuid`
--

LOCK TABLES `uuid` WRITE;
/*!40000 ALTER TABLE `uuid` DISABLE KEYS */;
INSERT INTO `uuid` VALUES (1,'lin8','966bce32b4fc3f84a8e316379e51f5d6'),(2,'jiujie114','b458178d052a3e799481c10e515d8f0a'),(3,'Loic_0117','c918fad351f73b3aa7617f8a5abac1c1');
/*!40000 ALTER TABLE `uuid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ygg_log`
--

DROP TABLE IF EXISTS `ygg_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ygg_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `parameters` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ygg_log`
--

LOCK TABLES `ygg_log` WRITE;
/*!40000 ALTER TABLE `ygg_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ygg_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mcmc'
--

--
-- Dumping routines for database 'mcmc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-27 15:08:34

