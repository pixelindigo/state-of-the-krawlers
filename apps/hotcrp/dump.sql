-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: hotcrp
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `ActionLog`
--

DROP TABLE IF EXISTS `ActionLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActionLog` (
  `logId` int NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL,
  `destContactId` int NOT NULL DEFAULT '0',
  `paperId` int DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ipaddr` varbinary(39) DEFAULT NULL,
  `action` varbinary(4096) NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActionLog`
--

LOCK TABLES `ActionLog` WRITE;
/*!40000 ALTER TABLE `ActionLog` DISABLE KEYS */;
INSERT INTO `ActionLog` VALUES (1,1,1,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(2,1,1,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(3,1,1,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as sysadmin'),(4,1,1,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as chair'),(5,2,2,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(6,2,2,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(7,2,2,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as chair'),(8,3,3,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(9,3,3,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(10,4,4,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(11,4,4,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(12,5,5,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(13,6,6,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(14,6,6,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(15,7,7,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(16,7,7,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(17,8,8,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(18,8,8,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(19,9,9,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(20,9,9,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(21,10,10,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(22,10,10,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(23,11,11,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(24,11,11,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(25,12,12,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(26,12,12,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(27,13,13,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(28,13,13,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(29,14,14,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(30,14,14,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(31,15,15,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(32,15,15,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(33,16,16,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(34,16,16,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(35,17,17,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(36,17,17,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(37,18,18,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(38,18,18,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(39,18,18,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as chair'),(40,19,19,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(41,20,20,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(42,20,20,NULL,'2022-03-03 00:28:43',NULL,_binary 'Added as pc'),(43,21,21,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(44,22,22,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(45,23,23,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(46,24,24,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(47,25,25,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(48,26,26,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(49,27,27,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(50,28,28,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(51,29,29,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(52,30,30,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(53,31,31,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(54,32,32,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(55,33,33,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(56,34,34,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(57,35,35,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(58,36,36,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(59,37,37,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(60,38,38,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(61,39,39,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(62,40,40,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(63,41,41,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(64,42,42,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(65,43,43,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(66,44,44,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(67,45,45,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(68,46,46,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(69,47,47,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(70,48,48,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(71,49,49,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(72,50,50,NULL,'2022-03-03 00:28:43',NULL,_binary 'Created account'),(73,1,12,1,'2022-03-03 00:28:43',NULL,_binary 'Review 1 added (Primary)'),(74,1,11,1,'2022-03-03 00:28:43',NULL,_binary 'Review 2 added (Primary)'),(75,1,6,1,'2022-03-03 00:28:43',NULL,_binary 'Review 3 added (Primary)'),(76,1,1,2,'2022-03-03 00:28:43',NULL,_binary 'Review 4 added (Primary)'),(77,1,8,2,'2022-03-03 00:28:43',NULL,_binary 'Review 5 added (Primary)'),(78,1,15,2,'2022-03-03 00:28:43',NULL,_binary 'Review 6 added (Primary)'),(79,1,11,3,'2022-03-03 00:28:43',NULL,_binary 'Review 7 added (Primary)'),(80,1,14,3,'2022-03-03 00:28:43',NULL,_binary 'Review 8 added (Primary)'),(81,1,16,3,'2022-03-03 00:28:43',NULL,_binary 'Review 9 added (Primary)'),(82,1,4,4,'2022-03-03 00:28:43',NULL,_binary 'Review 10 added (Primary)'),(83,1,11,4,'2022-03-03 00:28:43',NULL,_binary 'Review 11 added (Primary)'),(84,1,18,4,'2022-03-03 00:28:43',NULL,_binary 'Review 12 added (Primary)'),(85,1,3,5,'2022-03-03 00:28:43',NULL,_binary 'Review 13 added (Primary)'),(86,1,17,5,'2022-03-03 00:28:43',NULL,_binary 'Review 14 added (Primary)'),(87,1,9,5,'2022-03-03 00:28:43',NULL,_binary 'Review 15 added (Primary)'),(88,1,7,6,'2022-03-03 00:28:43',NULL,_binary 'Review 16 added (Primary)'),(89,1,13,6,'2022-03-03 00:28:43',NULL,_binary 'Review 17 added (Primary)'),(90,1,18,6,'2022-03-03 00:28:43',NULL,_binary 'Review 18 added (Primary)'),(91,1,9,7,'2022-03-03 00:28:43',NULL,_binary 'Review 19 added (Primary)'),(92,1,16,7,'2022-03-03 00:28:43',NULL,_binary 'Review 20 added (Primary)'),(93,1,6,7,'2022-03-03 00:28:43',NULL,_binary 'Review 21 added (Primary)'),(94,1,4,8,'2022-03-03 00:28:43',NULL,_binary 'Review 22 added (Primary)'),(95,1,2,8,'2022-03-03 00:28:43',NULL,_binary 'Review 23 added (Primary)'),(96,1,10,8,'2022-03-03 00:28:43',NULL,_binary 'Review 24 added (Primary)'),(97,1,10,9,'2022-03-03 00:28:43',NULL,_binary 'Review 25 added (Primary)'),(98,1,14,9,'2022-03-03 00:28:43',NULL,_binary 'Review 26 added (Primary)'),(99,1,13,9,'2022-03-03 00:28:43',NULL,_binary 'Review 27 added (Primary)'),(100,1,2,10,'2022-03-03 00:28:43',NULL,_binary 'Review 28 added (Primary)'),(101,1,7,10,'2022-03-03 00:28:43',NULL,_binary 'Review 29 added (Primary)'),(102,1,6,10,'2022-03-03 00:28:43',NULL,_binary 'Review 30 added (Primary)'),(103,1,7,11,'2022-03-03 00:28:43',NULL,_binary 'Review 31 added (Primary)'),(104,1,9,11,'2022-03-03 00:28:43',NULL,_binary 'Review 32 added (Primary)'),(105,1,10,11,'2022-03-03 00:28:43',NULL,_binary 'Review 33 added (Primary)'),(106,1,3,12,'2022-03-03 00:28:43',NULL,_binary 'Review 34 added (Primary)'),(107,1,14,12,'2022-03-03 00:28:43',NULL,_binary 'Review 35 added (Primary)'),(108,1,13,12,'2022-03-03 00:28:43',NULL,_binary 'Review 36 added (Primary)'),(109,1,1,13,'2022-03-03 00:28:43',NULL,_binary 'Review 37 added (Primary)'),(110,1,2,13,'2022-03-03 00:28:43',NULL,_binary 'Review 38 added (Primary)'),(111,1,12,13,'2022-03-03 00:28:43',NULL,_binary 'Review 39 added (Primary)'),(112,1,11,14,'2022-03-03 00:28:43',NULL,_binary 'Review 40 added (Primary)'),(113,1,16,14,'2022-03-03 00:28:43',NULL,_binary 'Review 41 added (Primary)'),(114,1,6,14,'2022-03-03 00:28:43',NULL,_binary 'Review 42 added (Primary)'),(115,1,17,15,'2022-03-03 00:28:43',NULL,_binary 'Review 43 added (Primary)'),(116,1,8,15,'2022-03-03 00:28:43',NULL,_binary 'Review 44 added (Primary)'),(117,1,18,15,'2022-03-03 00:28:43',NULL,_binary 'Review 45 added (Primary)'),(118,1,1,16,'2022-03-03 00:28:43',NULL,_binary 'Review 46 added (Primary)'),(119,1,17,16,'2022-03-03 00:28:43',NULL,_binary 'Review 47 added (Primary)'),(120,1,8,16,'2022-03-03 00:28:43',NULL,_binary 'Review 48 added (Primary)'),(121,1,9,17,'2022-03-03 00:28:43',NULL,_binary 'Review 49 added (Primary)'),(122,1,12,17,'2022-03-03 00:28:43',NULL,_binary 'Review 50 added (Primary)'),(123,1,15,17,'2022-03-03 00:28:43',NULL,_binary 'Review 51 added (Primary)'),(124,1,3,18,'2022-03-03 00:28:43',NULL,_binary 'Review 52 added (Primary)'),(125,1,4,18,'2022-03-03 00:28:43',NULL,_binary 'Review 53 added (Primary)'),(126,1,15,18,'2022-03-03 00:28:43',NULL,_binary 'Review 54 added (Primary)');
/*!40000 ALTER TABLE `ActionLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Capability`
--

DROP TABLE IF EXISTS `Capability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capability` (
  `capabilityType` int NOT NULL,
  `contactId` int NOT NULL,
  `paperId` int NOT NULL,
  `timeExpires` bigint NOT NULL,
  `salt` varbinary(255) NOT NULL,
  `data` varbinary(4096) DEFAULT NULL,
  PRIMARY KEY (`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Capability`
--

LOCK TABLES `Capability` WRITE;
/*!40000 ALTER TABLE `Capability` DISABLE KEYS */;
/*!40000 ALTER TABLE `Capability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactInfo`
--

DROP TABLE IF EXISTS `ContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContactInfo` (
  `contactId` int NOT NULL AUTO_INCREMENT,
  `firstName` varbinary(120) NOT NULL DEFAULT '',
  `lastName` varbinary(120) NOT NULL DEFAULT '',
  `unaccentedName` varbinary(240) NOT NULL DEFAULT '',
  `email` varchar(120) NOT NULL,
  `preferredEmail` varchar(120) DEFAULT NULL,
  `affiliation` varbinary(2048) NOT NULL DEFAULT '',
  `phone` varbinary(64) DEFAULT NULL,
  `country` varbinary(256) DEFAULT NULL,
  `password` varbinary(2048) NOT NULL,
  `passwordTime` bigint NOT NULL DEFAULT '0',
  `passwordUseTime` bigint NOT NULL DEFAULT '0',
  `collaborators` varbinary(8192) DEFAULT NULL,
  `creationTime` bigint NOT NULL DEFAULT '0',
  `updateTime` bigint NOT NULL DEFAULT '0',
  `lastLogin` bigint NOT NULL DEFAULT '0',
  `defaultWatch` int NOT NULL DEFAULT '2',
  `roles` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `contactTags` varbinary(4096) DEFAULT NULL,
  `birthday` int DEFAULT NULL,
  `gender` varbinary(24) DEFAULT NULL,
  `data` varbinary(32767) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  UNIQUE KEY `email` (`email`),
  KEY `roles` (`roles`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactInfo`
--

LOCK TABLES `ContactInfo` WRITE;
/*!40000 ALTER TABLE `ContactInfo` DISABLE KEYS */;
INSERT INTO `ContactInfo` VALUES (1,_binary 'Jane',_binary 'Chair',_binary 'Jane Chair','jaekpot@localhost.com',NULL,'',NULL,NULL,_binary 'jAEkPot',1646267323,0,NULL,1646267323,0,1646267323,2,7,0,NULL,NULL,NULL,NULL),(2,_binary 'Christian',_binary 'Huitema',_binary 'Christian Huitema','huitema@bellcore.com',NULL,_binary 'Bellcore',NULL,NULL,_binary 'nojo8+hgeiyhayie',1646267323,0,NULL,1646267323,0,0,2,5,0,NULL,NULL,NULL,NULL),(3,_binary 'Christophe',_binary 'Diot',_binary 'Christophe Diot','christophe.diot@sophia.inria.fr',NULL,_binary 'INRIA',NULL,NULL,_binary '@gkphtrcr=yecr',1646267323,0,NULL,1646267323,0,0,2,1,0,_binary ' red#0 ',NULL,NULL,NULL),(4,_binary 'Deborah',_binary 'Estrin',_binary 'Deborah Estrin','estrin@usc.edu',NULL,_binary 'University of Southern California',NULL,NULL,_binary 'eauwueiua@uo2uych',1646267323,0,NULL,1646267323,0,0,2,1,0,_binary ' red#0 ',NULL,NULL,NULL),(5,_binary 'Eddie',_binary 'Kohler',_binary 'Eddie Kohler','kohler@seas.harvard.edu',NULL,_binary 'Harvard',NULL,NULL,_binary '2w2etguuyofrtho',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(6,_binary 'George',_binary 'Varghese',_binary 'George Varghese','varghese@ccrc.wustl.edu',NULL,_binary 'Washington University of St. Louis',NULL,NULL,_binary 'oabr28idchvuclu',1646267323,0,NULL,1646267323,0,0,2,1,0,_binary ' red#0 ',NULL,NULL,NULL),(7,_binary 'J. J.',_binary 'Garcia-Luna-Aceves',_binary 'J. J. Garcia-Luna-Aceves','jj@cse.ucsc.edu',NULL,_binary 'University of California, Santa Cruz',NULL,NULL,_binary 'othuphstchphho',1646267323,0,NULL,1646267323,0,0,2,1,0,_binary ' red#0 ',NULL,NULL,NULL),(8,_binary 'Jon',_binary 'Crowcroft',_binary 'Jon Crowcroft','jon@cs.ucl.ac.uk',NULL,_binary 'University College London',NULL,NULL,_binary 'y-uycroibrw3u3a',1646267323,0,NULL,1646267323,0,0,2,1,0,_binary ' red#0 ',NULL,NULL,NULL),(9,_binary 'Lixia',_binary 'Zhang',_binary 'Lixia Zhang','lixia@cs.ucla.edu',NULL,_binary 'UCLA',NULL,NULL,_binary 'bstprphu5_y7pr',1646267323,0,NULL,1646267323,0,0,2,1,0,NULL,NULL,NULL,NULL),(10,_binary 'Marina',_binary 'Tsvetaeva',_binary 'Marina Tsvetaeva','marina@poema.ru',NULL,'',NULL,NULL,_binary 'vcppiu_uiliewro',1646267323,0,NULL,1646267323,0,0,2,1,0,NULL,NULL,NULL,NULL),(11,_binary 'Mark',_binary 'Handley',_binary 'Mark Handley','mjh@isi.edu',NULL,_binary 'Information Sciences Institute',NULL,NULL,_binary 'aeueybphdatr3eio',1646267323,0,NULL,1646267323,0,0,2,1,0,NULL,NULL,NULL,NULL),(12,_binary 'Mary',_binary 'Baker',_binary 'Mary Baker','mgbaker@cs.stanford.edu',NULL,_binary 'Stanford University',NULL,NULL,_binary 'rtr8trijiyystesl',1646267323,0,NULL,1646267323,0,0,2,1,0,NULL,NULL,NULL,NULL),(13,_binary 'Paul',_binary 'Francis',_binary 'Paul Francis','pfrancis@ntt.jp',NULL,_binary 'NTT',NULL,NULL,_binary 'w=ruyu@u6tdr@ib',1646267323,0,NULL,1646267323,0,0,2,1,0,_binary ' blue#0 ',NULL,NULL,NULL),(14,_binary 'Peter',_binary 'Danzig',_binary 'Peter Danzig','peter.danzig@usc.edu',NULL,_binary 'University of Southern California',NULL,NULL,_binary 'dr3uriu7isoeslst',1646267323,0,NULL,1646267323,0,0,2,1,0,NULL,NULL,NULL,NULL),(15,_binary 'Peter',_binary 'Druschel',_binary 'Peter Druschel','pdruschel@cs.rice.edu',NULL,_binary 'Rice',NULL,NULL,_binary 'uio=dsw4eyarooy@',1646267323,0,NULL,1646267323,0,0,2,1,0,NULL,NULL,NULL,NULL),(16,_binary 'Roch',_binary 'Guerin',_binary 'Roch Guerin','rguerin@ibm.com',NULL,_binary 'IBM',NULL,NULL,_binary '+vo82uuiieyudra4',1646267323,0,NULL,1646267323,0,0,2,1,0,NULL,NULL,NULL,NULL),(17,_binary 'Sally',_binary 'Floyd',_binary 'Sally Floyd','floyd@ee.lbl.gov',NULL,_binary 'Lawrence Berkeley National Laboratory',NULL,NULL,_binary 'afr+_mii7ua=yade',1646267323,0,NULL,1646267323,0,0,2,1,0,_binary ' blue#0 red#0 ',NULL,NULL,NULL),(18,_binary 'Scott',_binary 'Shenker',_binary 'Scott Shenker','shenker@parc.xerox.com',NULL,_binary 'Xerox PARC',NULL,NULL,_binary 'iajiphi-cheabst',1646267323,0,NULL,1646267323,0,0,2,5,0,NULL,NULL,NULL,NULL),(19,_binary 'Van',_binary 'Jacobson',_binary 'Van Jacobson','van@ee.lbl.gov',NULL,_binary 'Lawrence Berkeley National Laboratory',NULL,NULL,_binary 'thaeyoyathmoe5ucl',1646267323,1646267500,NULL,1646267323,0,1646267500,2,0,0,NULL,NULL,NULL,NULL),(20,_binary 'Wilma',_binary 'Ojuelegba',_binary 'Wilma Ojuelegba','ojuelegba@gmail.com',NULL,_binary 'Stanford',NULL,NULL,_binary 'iwatrtraswlyuich',1646267323,0,NULL,1646267323,0,0,2,1,0,NULL,NULL,NULL,NULL),(21,_binary 'Mikael',_binary 'Degermark',_binary 'Mikael Degermark','micke@cdt.luth.se',NULL,_binary 'Lule√• University of Technology',NULL,NULL,_binary 'iewcruclch-9ch',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(22,_binary 'Steven',_binary 'Lin',_binary 'Steven Lin','sclin@leland.stanford.edu',NULL,_binary 'Stanford University',NULL,NULL,_binary '-wyyecleayiaoead5',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(23,_binary 'Marcel',_binary 'Waldvogel',_binary 'Marcel Waldvogel','waldvogel@tik.ee.ethz.ch',NULL,_binary 'Computer Engineering and Networks Laboratory, ETH Z√ºrich',NULL,NULL,_binary 'uumeprdlproiyoe5',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(24,_binary 'Chane L.',_binary 'Fullmer',_binary 'Chane L. Fullmer','chane@ecse.ucsc.edu',NULL,_binary 'Computer Engineering Department, University of California, Santa Cruz',NULL,NULL,_binary 'thoygspastooyol8',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(25,_binary 'Brian',_binary 'Noble',_binary 'Brian Noble','bnoble@cs.cmu.edu',NULL,_binary 'Carnegie Mellon University, School of Computer Science',NULL,NULL,_binary 'rprn=wswy9y2iytr',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(26,_binary 'Songwu',_binary 'Lu',_binary 'Songwu Lu','slu@crhc.uiuc.edu',NULL,_binary 'UIUC',NULL,NULL,_binary 'thyy7o3ny7phtti',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(27,_binary 'Seungjae',_binary 'Han',_binary 'Seungjae Han','sjhan@eecs.umich.edu',NULL,_binary 'University of Michigan',NULL,NULL,_binary 'sp@6eaa=anuasl4',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(28,_binary 'Kien A.',_binary 'Hua',_binary 'Kien A. Hua','kienhua@cs.ucf.edu',NULL,_binary 'Department of Computer Science, University of Central Florida',NULL,NULL,_binary '3as5iyssya@abauv',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(29,_binary 'D. Scott',_binary 'Alexander',_binary 'D. Scott Alexander','salex@dsl.cis.upenn.edu',NULL,_binary 'University of Pennsylvania',NULL,NULL,_binary 'phswchefr7ea+au',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(30,_binary 'Craig',_binary 'Labovitz',_binary 'Craig Labovitz','labovit@eecs.umich.edu',NULL,_binary 'University of Michigan Department of Electrical Engineering and Computer Science',NULL,NULL,_binary 'spyeasw_p89ujur',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(31,_binary 'G. Robert',_binary 'Malan',_binary 'G. Robert Malan','rmalan@eecs.umich.edu',NULL,_binary 'University of Michigan Department of Electrical Engineering and Computer Science',NULL,NULL,_binary 'reeliironav-eubsp',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(32,_binary 'Farnam',_binary 'Jahanian',_binary 'Farnam Jahanian','farnam@eecs.umich.edu',NULL,_binary 'University of Michigan Department of Electrical Engineering and Computer Science',NULL,NULL,_binary 'oyaty@dreaneei42',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(33,_binary 'Robert',_binary 'Morris',_binary 'Robert Morris','rtm@eecs.harvard.edu',NULL,_binary 'Harvard University',NULL,NULL,_binary '3iuys@myadriwrj',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(34,_binary 'Vern',_binary 'Paxson',_binary 'Vern Paxson','vern@ee.lbl.gov',NULL,_binary 'Network Research Group, Lawrence Berkeley National Laboratory, University of California, Berkeley',NULL,NULL,_binary '+u4wrypcwrjueth',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(35,_binary 'Henrik Frystyk',_binary 'Nielsen',_binary 'Henrik Frystyk Nielsen','frystyk@w3.org',NULL,_binary 'World Wide Web Consortium',NULL,NULL,_binary 'gast6_u=sjubeie',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(36,_binary 'Jeffrey C.',_binary 'Mogul',_binary 'Jeffrey C. Mogul','mogul@wrl.dec.com',NULL,_binary 'Digital Equipment Corporation Western Research Laboratory',NULL,NULL,_binary 'kioea+ispei@dthy',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(37,_binary 'Balachander',_binary 'Krishnamurthy',_binary 'Balachander Krishnamurthy','bala@research.att.com',NULL,_binary 'AT&T Labs - Research',NULL,NULL,_binary 'ustveu2be3fruye',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(38,_binary 'Stuart',_binary 'Cheshire',_binary 'Stuart Cheshire','cheshire@cs.stanford.edu',NULL,_binary 'Computer Science Department, Stanford University',NULL,NULL,_binary 'aeclclfryoylp=u',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(39,_binary 'Suvo',_binary 'Mittra',_binary 'Suvo Mittra','suvo@cs.stanford.edu',NULL,_binary 'Stanford University',NULL,NULL,_binary 'oobryyuiraspyeod',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(40,_binary 'Lee',_binary 'Breslau',_binary 'Lee Breslau','breslau@parc.xerox.com',NULL,_binary 'Xerox Palo Alto Research Center',NULL,NULL,_binary 'acwasteslesw8eu',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(41,_binary 'Satish K.',_binary 'Tripathi',_binary 'Satish K. Tripathi','tripathi@cs.ucr.edu',NULL,_binary 'UC Riverside',NULL,NULL,_binary 'aiiain@wbarku7u',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(42,_binary 'R.',_binary 'Gu√©rin',_binary 'R. Guerin','guerin@watson.ibm.com',NULL,_binary 'IBM T. J. Watson Research Center',NULL,NULL,_binary 'uswoi3yoastaaclr',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(43,_binary 'S.',_binary 'Kamat',_binary 'S. Kamat','sanjay@watson.ibm.com',NULL,_binary 'IBM T. J. Watson Research Center',NULL,NULL,_binary 'e+ior@clpslstio',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(44,_binary 'A.',_binary 'Feldmann',_binary 'A. Feldmann','anja@research.att.com',NULL,_binary 'AT&T Labs‚ÄîResearch',NULL,NULL,_binary 'ue9@-2e2iebu_6r',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(45,_binary 'John W.',_binary 'Byers',_binary 'John W. Byers','byers@icsi.berkeley.edu',NULL,_binary 'UC Berkeley and International Computer Science Institute',NULL,NULL,_binary 'oosprcl-wtaytuc',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(46,_binary 'Michael',_binary 'Luby',_binary 'Michael Luby','luby@icsi.berkeley.edu',NULL,_binary 'International Computer Science Institute',NULL,NULL,_binary 'auaeyothssp8brst',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(47,_binary 'Chung Kei',_binary 'Wong',_binary 'Chung Kei Wong','ckwong@cs.utexas.edu',NULL,_binary 'Department of Computer Sciences, University of Texas at Austin',NULL,NULL,_binary 'byawrspaiyba-pui',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(48,_binary 'Huayan Amy',_binary 'Wang',_binary 'Huayan Amy Wang','whycu@ctr.columbia.edu',NULL,_binary 'Department of Electrical Engineering, Columbia University',NULL,NULL,_binary 'phuoprufryo_oaus',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(49,_binary 'Satish',_binary 'Kumar',_binary 'Satish Kumar','kkumar@isi.edu',NULL,_binary 'Information Sciences Institute, University of Southern California',NULL,NULL,_binary 'y8uclei2adfrseuph',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL),(50,_binary 'Ion',_binary 'Stoica',_binary 'Ion Stoica','istoica@cs.cmu.edu',NULL,_binary 'CMU',NULL,NULL,_binary 'aeolata5a4suonpr',1646267323,0,NULL,1646267323,0,0,2,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedContactInfo`
--

DROP TABLE IF EXISTS `DeletedContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeletedContactInfo` (
  `contactId` int NOT NULL,
  `firstName` varbinary(120) NOT NULL,
  `lastName` varbinary(120) NOT NULL,
  `unaccentedName` varbinary(240) NOT NULL,
  `email` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedContactInfo`
--

LOCK TABLES `DeletedContactInfo` WRITE;
/*!40000 ALTER TABLE `DeletedContactInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentLink`
--

DROP TABLE IF EXISTS `DocumentLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DocumentLink` (
  `paperId` int NOT NULL,
  `linkId` int NOT NULL,
  `linkType` int NOT NULL,
  `documentId` int NOT NULL,
  PRIMARY KEY (`paperId`,`linkId`,`linkType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentLink`
--

LOCK TABLES `DocumentLink` WRITE;
/*!40000 ALTER TABLE `DocumentLink` DISABLE KEYS */;
/*!40000 ALTER TABLE `DocumentLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FilteredDocument`
--

DROP TABLE IF EXISTS `FilteredDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FilteredDocument` (
  `inDocId` int NOT NULL,
  `filterType` int NOT NULL,
  `outDocId` int NOT NULL,
  `createdAt` bigint NOT NULL,
  PRIMARY KEY (`inDocId`,`filterType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FilteredDocument`
--

LOCK TABLES `FilteredDocument` WRITE;
/*!40000 ALTER TABLE `FilteredDocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `FilteredDocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Formula`
--

DROP TABLE IF EXISTS `Formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Formula` (
  `formulaId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `heading` varchar(200) NOT NULL DEFAULT '',
  `headingTitle` varbinary(4096) NOT NULL,
  `expression` varbinary(4096) NOT NULL,
  `createdBy` int NOT NULL DEFAULT '0',
  `timeModified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`formulaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formula`
--

LOCK TABLES `Formula` WRITE;
/*!40000 ALTER TABLE `Formula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MailLog`
--

DROP TABLE IF EXISTS `MailLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MailLog` (
  `mailId` int NOT NULL AUTO_INCREMENT,
  `recipients` varbinary(200) NOT NULL,
  `q` varbinary(4096) DEFAULT NULL,
  `t` varbinary(200) DEFAULT NULL,
  `paperIds` blob,
  `cc` blob,
  `replyto` blob,
  `subject` blob,
  `emailBody` blob,
  `fromNonChair` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MailLog`
--

LOCK TABLES `MailLog` WRITE;
/*!40000 ALTER TABLE `MailLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `MailLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paper`
--

DROP TABLE IF EXISTS `Paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paper` (
  `paperId` int NOT NULL AUTO_INCREMENT,
  `title` varbinary(512) DEFAULT NULL,
  `authorInformation` varbinary(8192) DEFAULT NULL,
  `abstract` varbinary(16384) DEFAULT NULL,
  `collaborators` varbinary(8192) DEFAULT NULL,
  `timeSubmitted` bigint NOT NULL DEFAULT '0',
  `timeWithdrawn` bigint NOT NULL DEFAULT '0',
  `timeFinalSubmitted` bigint NOT NULL DEFAULT '0',
  `timeModified` bigint NOT NULL DEFAULT '0',
  `paperStorageId` int NOT NULL DEFAULT '0',
  `sha1` varbinary(64) NOT NULL DEFAULT '',
  `finalPaperStorageId` int NOT NULL DEFAULT '0',
  `blind` tinyint(1) NOT NULL DEFAULT '1',
  `outcome` tinyint(1) NOT NULL DEFAULT '0',
  `leadContactId` int NOT NULL DEFAULT '0',
  `shepherdContactId` int NOT NULL DEFAULT '0',
  `managerContactId` int NOT NULL DEFAULT '0',
  `capVersion` int NOT NULL DEFAULT '0',
  `size` int NOT NULL DEFAULT '0',
  `mimetype` varbinary(80) NOT NULL DEFAULT '',
  `timestamp` bigint NOT NULL DEFAULT '0',
  `pdfFormatStatus` bigint NOT NULL DEFAULT '0',
  `withdrawReason` varbinary(1024) DEFAULT NULL,
  `paperFormat` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`paperId`),
  KEY `timeSubmitted` (`timeSubmitted`),
  KEY `leadContactId` (`leadContactId`),
  KEY `shepherdContactId` (`shepherdContactId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paper`
--

LOCK TABLES `Paper` WRITE;
/*!40000 ALTER TABLE `Paper` DISABLE KEYS */;
INSERT INTO `Paper` VALUES (1,_binary 'Scalable Timers for Soft State Protocols',_binary 'Puneet	Sharma	puneet@catarina.usc.edu	Information Sciences Institute, University of Southern California\nDeborah	Estrin	estrin@USC.edu	Information Sciences Institute, University of Southern California\nSally	Floyd	floyd@ee.lbl.gov	Lawrence Berkeley National Laboratory\nVan	Jacobson	van@ee.lbl.gov	Lawrence Berkeley National Laboratory\n',_binary 'Soft state protocols use periodic refresh messages to keep network state alive while adapting to changing network conditions; this has raised concerns regarding the scalability of protocols that use the soft-state approach. In existing soft state protocols, the values of the timers that control the sending of these messages, and the timers for aging out state, are chosen by matching empirical observations with desired recovery and response times. These fixed timer-values fail because they use time as a metric for bandwidth; they adapt neither to (1) the wide range of link speeds that exist in most wide-area internets, nor to (2) fluctuations in the amount of network state over time.\n\nWe propose and evaluate a new approach in which timer-values adapt dynamically to the volume of control traffic and available bandwidth on the link. The essential mechanisms required to realize this scalable timers approach are: (1) dynamic adjustment of the senders‚Äô refresh rate so that the bandwidth allocated for control traffic is not exceeded, and (2) estimation of the senders‚Äô refresh rate at the receiver in order to determine when the state can be timed-out and deleted. The refresh messages are sent in a round robin manner not exceeding the bandwidth allocated to control traffic, and taking into account message priorities. We evaluate two receiver estimation methods for dynamically adjusting network state timeout values: (1) counting of the rounds and (2) exponential weighted moving average.','',1646267323,0,0,1646267323,2,_binary 'sha2-\Ë\ÛT[Ñ™ ˙SM-ï\˜\‹\‰Fﬂè¿ﬂö\Û-ÆSñ\“#¡±o',0,1,0,0,0,0,0,13,_binary 'application/pdf',1646267323,0,NULL,NULL),(2,_binary 'Small Forwarding Tables for Fast Routing Lookups',_binary 'Mikael	Degermark	micke@cdt.luth.se	Lule√• University of Technology\nAndrej	Brodnik	Andrej.Brodnik@IMFM.Uni-Lj.SI	Lule√• University of Technology\nSvante	Carlsson	svante@sm.luth.se	Lule√• University of Technology\nStephen	Pink	steve@sics.se	Lule√• University of Technology\n',_binary 'For some time, the networking community has assumed that it is impossible to do IP routing lookups in software fast enough to support gigabit speeds. IP routing lookups must find the routing entry with the longest matching prefix, a task that has been thought to require hardware support at lookup frequencies of millions per second.We present a forwarding table data structure designed for quick routing lookups. Forwarding tables are small enough to fit in the cache of a conventional general purpose processor. With the table in cache, a 200 MHz Pentium Pro or a 333 MHz Alpha 21164 can perform a few million lookups per second. This means that it is feasible to do a full routing lookup for each IP packet at gigabit speeds without special hardware. The forwarding tables are very small, a large routing table with 40,000 routing entries can be compacted to a forwarding table of 150-160 Kbytes. A lookup typically requires less than 100 instructions on an Alpha, using eight memory references accessing a total of 14 bytes.','',1646267323,0,0,1646267323,3,_binary 'sha2-zPô\Ê“• `:o\»h\ÕÆKJ˝\ŸŒñ-h∞\ÀC|PW',0,1,0,0,0,0,0,14,_binary 'application/pdf',1646267323,0,NULL,NULL),(3,_binary 'A Simulation Study of IP Switching',_binary 'Steven	Lin	sclin@leland.stanford.edu	Stanford University\nNick	McKeown	nickm@ee.stanford.edu	Stanford University\n',_binary 'Recently there has been much interest in combining the speed of layer-2 switching with the features of layer-3 routing. This has been prompted by numerous proposals, including: IP Switching [1], Tag Switching [2], ARIS [3], CSR [4], and IP over ATM [5]. In this paper, we study IP Switching and evaluate the performance claims made by Newman et al in [1] and [6]. In particular, using ten network traces, we study how well IP Switching performs with traffic found in campus, corporate, and Internet Service Provider (ISP) environments. Our main finding is that IP Switching will lead to a high proportion of datagrams that are switched; over 75% in all of the environments we studied. We also investigate the effects that different flow classifiers and various timer values have on performance, and note that some choices can result in a large VC space requirement. Finally, we present recommendations for the flow classifier and timer values, as a function of the VC space of the switch and the network environment being served.','',1646267323,0,0,1646267323,4,_binary 'sha2-π©\ƒcy≥p¡l\Ï&Nµ\Ù∏N\ˆ÷Ö6ïˇV¯\›\rP\r`',0,1,0,0,0,0,0,14,_binary 'application/pdf',1646267323,0,NULL,NULL),(4,_binary 'Scalable High Speed IP Routing Lookups',_binary 'Marcel	Waldvogel	waldvogel@tik.ee.ethz.ch	Computer Engineering and Networks Laboratory, ETH Z√ºrich\nGeorge	Varghese	varghese@ccrc.wustl.edu	Computer and Communications Research Center, Washington University in St. Louis\nJonathan S.	Turner	jst@ccrc.wustl.edu	Computer and Communications Research Center, Washington University in St. Louis\nBernhard	Plattner	plattner@tik.ee.ethz.ch	Computer Engineering and Networks Laboratory, ETH Z√ºrich\n',_binary 'Internet address lookup is a challenging problem because of increasing routing table sizes, increased traffic, higher speed links, and the migration to 128 bit IPv6 addresses. IP routing lookup requires computing the best matching prefix, for which standard solutions like hashing were believed to be inapplicable. The best existing solution we know of, BSD radix tries, scales badly as IP moves to 128 bit addresses. Our paper describes a new algorithm for best matching prefix using binary search on hash tables organized by prefix lengths. Our scheme scales very well as address and routing table sizes increase: independent of the table size, it requires a worst case time of log2(address bits) hash lookups. Thus only 5 hash lookups are needed for IPv4 and 7 for IPv6. We also introduce Mutating Binary Search and other optimizations that, for a typical IPv4 backbone router with over 33,000 entries, considerably reduce the average number of hashes to less than 2, of which one hash can be simplified to an indexed array access. We expect similar average case behavior for IPv6.','',1646267323,0,0,1646267323,5,_binary 'sha2-Üi\ƒ{\Ùô@	}v\ˆæŒùZf\0¿6J§é0pÿì≈¥ß\Òan',0,1,0,0,0,0,0,14,_binary 'application/pdf',1646267323,0,NULL,NULL),(5,_binary 'Solutions to Hidden Terminal Problems in Wireless Networks',_binary 'Chane L.	Fullmer	chane@ecse.ucsc.edu	Computer Engineering Department, University of California, Santa Cruz\nJ. J.	Garcia-Luna-Aceves	jj@cse.ucsc.edu	Computer Engineering Department, University of California, Santa Cruz\n',_binary 'The floor acquisition multiple access (FAMA) discipline is analyzed in networks with hidden terminals. According to FAMA, control of the channel (the floor) is assigned to at most one station in the network at any given time, and this station is guaranteed to be able to transmit one or more data packets to different destinations with no collisions. The FAMA protocols described consist of non-persistent carrier or packet sensing, plus a collision-avoidance dialogue between a source and the intended receiver of a packet. Sufficient conditions under which these protocols provide correct floor acquisition are presented and verified for networks with hidden terminals; it is shown that FAMA protocols must use carrier sensing to support correct floor acquisition. The throughput of FAMA protocols is analyzed for single-channel networks with hidden terminals; it is shown that carrier-sensing FAMA protocols perform better than ALOHA and CSMA protocols in the presence of hidden terminals.','',1646267323,0,0,1646267323,6,_binary 'sha2-–µ’ôºñU}wå}˙\›},,÷øñal&üT6ø\Â\Ë\“',0,1,0,0,0,0,0,14,_binary 'application/pdf',1646267323,0,NULL,NULL),(6,_binary 'Trace-Based Mobile Network Emulation',_binary 'Brian	Noble	bnoble@cs.cmu.edu	Carnegie Mellon University, School of Computer Science\nM.	Satyanarayanan	satya@cs.cmu.edu	Carnegie Mellon University, School of Computer Science\nGiao Thanh	Nguyen	gnguyen@cs.berkeley.edu	University of California, Berkeley\nRandy H.	Katz	randy@cs.berkeley.edu	University of California, Berkeley\n',_binary 'Subjecting a mobile computing system to wireless network conditions that are realistic yet reproducible is a challenging problem. In this paper, we describe a technique called trace modulation that re-creates the observed end-to-end characteristics of a real wireless network in a controlled and repeatable manner. Trace modulation is transparent to applications and accounts for all network traffic sent or received by the system under test. We present results that show that it is indeed capable of reproducing wireless network performance faithfully.','',1646267323,0,0,1646267323,7,_binary 'sha2-\Z±\ﬂó5ã\ı˛\\\ˆ≥jä‚òë®\ Zò8≥¬±∑\r',0,1,0,0,0,0,0,14,_binary 'application/pdf',1646267323,0,NULL,NULL),(7,_binary 'Fair Scheduling in Wireless Packet Networks',_binary 'Songwu	Lu	slu@crhc.uiuc.edu	UIUC\nVaduvur	Bharghavan	bharghav@crhc.uiuc.edu	UIUC\nRayadurgam	Srikant	rsrikant@uiuc.edu	UIUC\n',_binary 'Fair scheduling of delay and rate-sensitive packet flows over a wireless channel is not addressed effectively by most contemporary wireline fair scheduling algorithms because of two unique characteristics of wireless media: (a) bursty channel errors, and (b) location-dependent channel capacity and errors. Besides, in packet cellular networks, the base station typically performs the task of packet scheduling for both downlink and uplink flows in a cell; however a base station has only a limited knowledge of the arrival processes of uplink flows.\n\nIn this paper, we propose a new model for wireless fair scheduling based on an adaptation of fluid fair queueing to handle location-dependent error bursts. We describe an ideal wireless fair scheduling algorithm which provides a packetized implementation of the fluid model while assuming full knowledge of the current channel conditions. For this algorithm, we derive the worst-case throughput and delay bounds. Finally, we describe a practical wireless scheduling algorithm which approximates the ideal algorithm. Through simulations, we show that the algorithm achieves the desirable properties identified in the wireless fluid fair queueing model.','',1646267323,0,0,1646267323,8,_binary 'sha2-?HQ¸˙0j9≥7\Ú>/•6A°ë]¸\Ù{∞é˚Zû\Ò%',0,1,0,0,0,0,0,14,_binary 'application/pdf',1646267323,0,NULL,NULL),(8,_binary 'Fast Restoration of Real-Time Communication Service from Component Failures in Multi-Hop Networks',_binary 'Seungjae	Han	sjhan@eecs.umich.edu	University of Michigan\nKang G.	Shin	kgshin@eecs.umich.edu	University of Michigan\n',_binary 'For many applications it is important to provide communication services with guaranteed timeliness and fault-tolerance at an acceptable level of overhead. In this paper, we present a scheme for restoring real-time channels, each with guaranteed timeliness, from component failures in multi-hop networks. To ensure fast/guaranteed recovery, backup channels are set up a priori in addition to each primary channel. That is, a dependable real-time connection consists of a primary channel and one or more backup channels. If a primary channel fails, one of its backup channels is activated to become a new primary channel. We describe a protocol which provides an integrated solution to the failure-recovery problem (i.e., channel switching, resource re-allocation, ...). We also present a resource sharing method that significantly reduces the overhead of backup channels. The simulation results show that good coverage (in recovering from failures) can be achieved with about 30% degradation in network utilization under a reasonable failure condition. Moreover, the fault-tolerance level of each dependable connection can be controlled, independently of other connections, to reflect its criticality.','',1646267323,0,0,1646267323,9,_binary 'sha2-V\¬;êq¡~\ZΩâ\…\‘\·\·™sP\ﬁlçªsU\‘:fj∞',0,1,0,0,0,0,0,14,_binary 'application/pdf',1646267323,0,NULL,NULL),(9,_binary 'Skyscraper Broadcasting: A New Broadcasting Scheme for Metropolitan Video-on-Demand Systems',_binary 'Kien A.	Hua	kienhua@cs.ucf.edu	Department of Computer Science, University of Central Florida\nSimon	Sheu	sheu@cs.ucf.edu	Department of Computer Science, University of Central Florida\n',_binary 'We investigate a novel multicast technique, called Skyscraper Broadcasting (SB), for video-on-demand applications. We discuss the data fragmentation technique, the broadcasting strategy, and the client design. We also show the correctness of our technique, and derive mathematical equations to analyze its storage requirement. To assess its performance, we compare it to the latest designs known as Pyramid Broadcasting (PB) and Permutation-Based Pyramid Broadcasting (PPB). Our study indicates that PB offers excellent access latency. However, it requires very large storage space and disk bandwidth at the receiving end. PPB is able to address these problems. However, this is accomplished at the expense of a larger access latency and more complex synchronization. With SB, we are able to achieve the low latency of PB while using only 20% of the buffer space required by PPB.','',1646267323,0,0,1646267323,10,_binary 'sha2-…ã\Ù´0Ø(Ü\Ô\›2\Ã	èñAK\ÀBlã…°\‚C\'\Ï§i∏',0,1,0,0,0,0,0,14,_binary 'application/pdf',1646267323,0,NULL,NULL),(10,_binary 'Active Bridging',_binary 'D. Scott	Alexander	salex@dsl.cis.upenn.edu	University of Pennsylvania\nMarianne	Shaw	marianne@dsl.cis.upenn.edu	University of Pennsylvania\nScott	Nettles	nettles@dsl.cis.upenn.edu	University of Pennsylvania\nJonathan M.	Smith	jms@dsl.cis.upenn.edu	University of Pennsylvania\n',_binary 'Active networks accelerate network evolution by permitting the network infrastructure to be programmable, on a per-user, per-packet, or other basis. This programmability must be balanced against the safety and security needs inherent in shared resources.This paper describes the design, implementation, and performance of a new type of network element, an Active Bridge. The active bridge can be reprogrammed \"on the fly\", with loadable modules called switchlets. To demonstrate the use of the active property, we incrementally extend what is initially a programmable buffered repeater with switchlets into a self-learning bridge, and then a bridge supporting spanning tree algorithms. To demonstrate the agility that active networking gives, we show how it is possible to upgrade a network from an \"old\" protocol to a \"new\" protocol on-the-fly. Moreover, we are able to take advantage of information unavailable to the implementors of either protocol to validate the new protocol and fall back to the old protocol if an error is detected. This shows that the Active Bridge can protect itself from some algorithmic failures in loadable modules.Our approach to safety and security favors static checking and prevention over dynamic checks when possible. We rely on strong type checking in the Caml language for the loadable module infrastructure, and achieve respectable performance. The prototype implementation on a Pentium-based HP Netserver LS running Linux with 100 Mbps Ethernet LANS achieves ttcp throughput of 16 Mbps between two PCs running Linux, compared with 76 Mbps unbridged. Measured frame rates are in the neighborhood of 1800 frames per second.','',1646267323,0,0,1646267323,11,_binary 'sha2-9ds˝\ÒA\ÚÇH§ÆT\Ÿ\“{0\÷\Û2\‡\wU€≠°∑\¬≈ôøo',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(11,_binary 'Internet Routing Instability',_binary 'Craig	Labovitz	labovit@eecs.umich.edu	University of Michigan Department of Electrical Engineering and Computer Science\nG. Robert	Malan	rmalan@eecs.umich.edu	University of Michigan Department of Electrical Engineering and Computer Science\nFarnam	Jahanian	farnam@eecs.umich.edu	University of Michigan Department of Electrical Engineering and Computer Science\n',_binary 'This paper examines the network inter-domain routing information exchanged between backbone service providers at the major U.S. public Internet exchange points. Internet routing instability, or the rapid fluctuation of network reachability information, is an important problem currently facing the Internet engineering community. High levels of network instability can lead to packet loss, increased network latency and time to convergence. At the extreme, high levels of routing instability have lead to the loss of internal connectivity in wide-area, national networks. In this paper, we describe several unexpected trends in routing instability, and examine a number of anomalies and pathologies observed in the exchange of inter-domain routing information. The analysis in this paper is based on data collected from BGP routing messages generated by border routers at five of the Internet core\'s public exchange points during a nine month period. We show that the volume of these routing updates is several orders of magnitude more than expected and that the majority of this routing information is redundant, or pathological. Furthermore, our analysis reveals several unexpected trends and ill-behaved systematic properties in Internet routing. We finally posit a number of explanations for these anomalies and evaluate their potential impact on the Internet infrastructure.','',1646267323,0,0,1646267323,12,_binary 'sha2-*\«!+â*&î\ﬁLõ\…\ƒaT\–:4∂ªôCõ)˛¯Mb\∆',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(12,_binary 'Dynamics of Random Early Detection',_binary 'Dong	Lin		Harvard University\nRobert	Morris	rtm@eecs.harvard.edu	Harvard University\n',_binary 'In this paper we evaluate the effectiveness of Random Early Detection (RED) over traffic types categorized as non-adaptive, fragile and robust, according to their responses to congestion. We point out that RED allows unfair bandwidth sharing when a mixture of the three traffic types shares a link. This unfairness is caused by the fact that at any given time RED imposes the same loss rate on all flows, regardless of their bandwidths.\n\nWe propose Fair Random Early Drop (FRED), a modified version of RED. FRED uses per-active-flow accounting to impose on each flow a loss rate that depends on the flow\'s buffer use.\n\nWe show that FRED provides better protection than RED for adaptive (fragile and robust) flows. In addition, FRED is able to isolate non-adaptive greedy traffic more effectively. Finally, we present a \"two-packet-buffer\" gateway mechanism to support a large number of flows without incurring additional queueing delays inside the network. These improvements are demonstrated by simulations of TCP and UDP traffic.\n\nFRED does not make any assumptions about queueing architecture; it will work with a FIFO gateway. FRED\'s per-active-flow accounting uses memory in proportion to the total number of buffers used: a FRED gateway maintains state only for flows for which it has packets buffered, not for all flows that traverse the gateway.','',1646267323,0,0,1646267323,13,_binary 'sha2-\\çÅ7x¶ãaW≠â˚\Z\r)\Ù0˝t\‡\ÍN´±\"a&f	',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(13,_binary 'End-to-end Internet Packet Dynamics',_binary 'Vern	Paxson	vern@ee.lbl.gov	Network Research Group, Lawrence Berkeley National Laboratory, University of California, Berkeley\n',_binary 'We discuss findings from a large-scale study of Internet packet dynamics conducted by tracing 20,000 TCP bulk transfers between 35 Internet sites. Because we traced each 100 Kbyte transfer at both the sender and the receiver, the measurements allow us to distinguish between the end-to-end behaviors due to the different directions of the Internet paths, which often exhibit asymmetries. We characterize the prevalence of unusual network events such as out-of-order delivery and packet corruption; discuss a robust receiver-based algorithm for estimating \"bottleneck bandwidth\" that addresses deficiencies discovered in techniques based on \"packet pair\"; investigate patterns of packet loss, finding that loss events are not well-modeled as independent and, furthermore, that the distribution of the duration of loss events exhibits infinite variance; and analyze variations in packet transit delays as indicators of congestion periods, finding that congestion periods also span a wide range of time scales.','',1646267323,0,0,1646267323,14,_binary 'sha2-o\·¡**{ömûù)$ΩTux|H3;Yf&d\Û;ï*',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(14,_binary 'Network Performance Effects of HTTP/1.1, CSS1, and PNG',_binary 'Henrik Frystyk	Nielsen	frystyk@w3.org	World Wide Web Consortium\nJames	Gettys	jg@pa.dec.com	Visiting Scientist, World Wide Web Consortium; Digital Equipment Corporation\nAnselm	Baird-Smith	abaird@w3.org	World Wide Web Consortium\nEric	Prud\'hommeaux	eric@w3.org	World Wide Web Consortium\nH√•kon Wium	Lie	howcome@w3.org	World Wide Web Consortium\nChris	Lilley	chris@w3.org	World Wide Web Consortium\n',_binary 'We describe our investigation of the effect of persistent connections, pipelining and link level document compression on our client and server HTTP implementations. A simple test setup is used to verify HTTP/1.1\'s design and understand HTTP/1.1 implementation strategies. We present TCP and real time performance data between the libwww robot [27] and both the W3C\'s Jigsaw [28] and Apache [29] HTTP servers using HTTP/1.0, HTTP/1.1 with persistent connections, HTTP/1.1 with pipelined requests, and HTTP/1.1 with pipelined requests and deflate data compression [22]. We also investigate whether the TCP Nagle algorithm has an effect on HTTP/1.1 performance. While somewhat artificial and possibly overstating the benefits of HTTP/1.1, we believe the tests and results approximate some common behavior seen in browsers. The results confirm that HTTP/1.1 is meeting its major design goals. Our experience has been that implementation details are very important to achieve all of the benefits of HTTP/1.1.\n\nFor all our tests, a pipelined HTTP/1.1 implementation outperformed HTTP/1.0, even when the HTTP/1.0 implementation used multiple connections in parallel, under all network environments tested. The savings were at least a factor of two, and sometimes as much as a factor of ten, in terms of packets transmitted. Elapsed time improvement is less dramatic, and strongly depends on your network connection.Some data is presented showing further savings possible by changes in Web content, specifically by the use of CSS style sheets [10], and the more compact PNG [20] image representation, both recent recommendations of W3C. Time did not allow full end to end data collection on these cases. The results show that HTTP/1.1 and changes in Web content will have dramatic results in Internet and Web performance as HTTP/1.1 and related technologies deploy over the near future. Universal use of style sheets, even without deployment of HTTP/1.1, would cause a very significant reduction in network traffic.This paper does not investigate further performance and network savings enabled by the improved caching facilities provided by the HTTP/1.1 protocol, or by sophisticated use of range requests.','',1646267323,0,0,1646267323,15,_binary 'sha2-¿a\ +p*ï\‰@ºaTd£Á®≥ ã¥]2å\ﬂM',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(15,_binary 'Automated Packet Trace Analysis of TCP Implementations',_binary 'Vern	Paxson	vern@ee.lbl.gov	Network Research Group, Lawrence Berkeley National Laboratory, University of California, Berkeley\n',_binary 'We describe tcpanaly, a tool for automatically analyzing a TCP implementation\'s behavior by inspecting packet traces of the TCP\'s activity. Doing so requires surmounting a number of hurdles, including detecting packet filter measurement errors, coping with ambiguities due to the distance between the measurement point and the TCP, and accommodating a surprisingly large range of behavior among different TCP implementations. We discuss why our efforts to develop a fully general tool failed, and detail a number of significant differences among 8 major TCP implementations, some of which, if ubiquitous, would devastate Internet performance. The most problematic TCPs were all independently written, suggesting that correct TCP implementation is fraught with difficulty. Consequently, it behooves the Internet community to develop testing programs and reference implementations.','',1646267323,0,0,1646267323,16,_binary 'sha2-(º\'PÉß>X]5øì\ŒD{DpnoÄO.”´\›\Ÿ$á˙Ä¨ü',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(16,_binary 'Potential Benefits of Delta Encoding and Data Compression for HTTP',_binary 'Jeffrey C.	Mogul	mogul@wrl.dec.com	Digital Equipment Corporation Western Research Laboratory\nFred	Douglis	douglis@research.att.com	AT&T Labs - Research\nAnja	Feldmann	anja@research.att.com	AT&T Labs - Research\nBalachander	Krishnamurthy	bala@research.att.com	AT&T Labs - Research\n',_binary 'Caching in the World Wide Web currently follows a naive model, which assumes that resources are referenced many times between changes. The model also provides no way to update a cache entry if a resource does change, except by transferring the resource\'s entire new value. Several previous papers have proposed updating cache entries by transferring only the differences, or \"delta,\" between the cached entry and the current value.\n\nIn this paper, we make use of dynamic traces of the full contents of HTTP messages to quantify the potential benefits of delta-encoded responses. We show that delta encoding can provide remarkable improvements in response size and response delay for an important subset of HTTP content types. We also show the added benefit of data compression, and that the combination of delta encoding and data compression yields the best results.\n\nWe propose specific extensions to the HTTP protocol for delta encoding and data compression. These extensions are compatible with existing implementations and specifications, yet allow efficient use of a variety of encoding techniques.','',1646267323,0,0,1646267323,17,_binary 'sha2-N\Û;\Ô=\—nê+\"\”![\0Yy\nz∞≥ó¿æP8’å',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(17,_binary 'Network Text Editor (NTE): A Scalable Shared Text Editor for the MBone',_binary 'Mark	Handley	mjh@isi.edu	USC Information Sciences Institute\nJon	Crowcroft	jon@cs.ucl.ac.uk	University College London\n',_binary 'IP Multicast, Lightweight Sessions and Application Level Framing provide guidelines by which multimedia conferencing tools can be designed, but they do not provide specific solutions. In this paper, we use these design principles to guide the design of a multicast based shared editor, and examine the consequences of taking a loose consistency approach to achieve good performance in the face of network failures and losses.','',1646267323,0,0,1646267323,18,_binary 'sha2-\›{Ω)V˛;\„\À÷∑U0eE4é\"°\¬TTãÇß˝∑=_I',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(18,_binary 'Consistent Overhead Byte Stuffing',_binary 'Stuart	Cheshire	cheshire@cs.stanford.edu	Computer Science Department, Stanford University\nMary	Baker	mgbaker@cs.stanford.edu	Computer Science Department, Stanford University\n',_binary 'Byte stuffing is a process that transforms a sequence of data bytes that may contain \'illegal\' or \'reserved\' values into a potentially longer sequence that contains no occurrences of those values. The extra length is referred to in this paper as the overhead of the algorithm.\n\nTo date, byte stuffing algorithms, such as those used by SLIP [RFC1055], PPP [RFC1662] and AX.25 [ARRL84], have been designed to incur low average overhead but have made little effort to minimize worst case overhead.\n\nSome increasingly popular network devices, however, care more about the worst case. For example, the transmission time for ISM-band packet radio transmitters is strictly limited by FCC regulation. To adhere to this regulation, the practice is to set the maximum packet size artificially low so that no packet, even after worst case overhead, can exceed the transmission time limit.\n\nThis paper presents a new byte stuffing algorithm, called Consistent Overhead Byte Stuffing (COBS), that tightly bounds the worst case overhead. It guarantees in the worst case to add no more than one byte in 254 to any packet. Furthermore, the algorithm is computationally cheap, and its average overhead is very competitive with that of existing algorithms.','',1646267323,0,0,1646267323,19,_binary 'sha2-f	\ı¯\¬\\∞((\œ#ª\Ô_ç\ﬂ\n9∫C\Ô!è\«\»L\∆\–',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(19,_binary 'A Flow-Based Approach to Datagram Security',_binary 'Suvo	Mittra	suvo@cs.stanford.edu	Stanford University\nThomas Y.C.	Woo	woo@research.bell-labs.com	Bell Laboratories\n',_binary 'Datagram services provide a simple, flexible, robust, and scalable communication abstraction; their usefulness has been well demonstrated by the success of IP, UDP, and RPC. Yet, the overwhelming majority of network security protocols that have been proposed are geared towards connection-oriented communications. The few that do cater to datagram communications tend to either rely on long term host-pair keying or impose a session-oriented (i.e., requiring connection setup) semantics.\n\nSeparately, the concept of flows has received a great deal of attention recently, especially in the context of routing and QoS. A flow characterizes a sequence of datagrams sharing some pre-defined attributes. In this paper, we advocate the use of flows as a basis for structuring secure datagram communications. We support this by proposing a novel protocol for datagram security based on flows. Our protocol achieves zero-message keying, thus preserving the connectionless nature of datagram, and makes use of soft state, thus providing the efficiency of session-oriented schemes. We have implemented an instantiation for IP in the 4.4BSD kernel, and we provide a description of our implementation along with performance results.','',1646267323,0,0,1646267323,20,_binary 'sha2-É4Eùeª\À\€\\ÖåT\Í\Ÿ˝	|b§æg\œ+U\·D°\ı',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(20,_binary 'Best-Effort versus Reservations: A Simple Comparative Analysis',_binary 'Lee	Breslau	breslau@parc.xerox.com	Xerox Palo Alto Research Center\nScott	Shenker	shenker@parc.xerox.com	Xerox Palo Alto Research Center\n',_binary 'Using a simple analytical model, this paper addresses the following question: Should the Internet retain its best-effort-only architecture, or should it adopt one that is reservation-capable? We characterize the differences between reservation-capable and best-effort-only networks in terms of application performance and total welfare. Our analysis does not yield a definitive answer to the question we pose, since it would necessarily depend on unknowable factors such as the future cost of network bandwidth and the nature of the future traffic load. However, our model does reveal some interesting phenomena. First, in some circumstances, the amount of incremental bandwidth needed to make a best-effort-only network perform as well as a reservation capable one diverges as capacity increases. Second, in some circumstances reservation-capable networks retain significant advantages over best-effort-only networks, no matter how cheap bandwidth becomes. Lastly, we find bounds on the maximum performance advantage a reservation-capable network can achieve over best effort architectures.','',1646267323,0,0,1646267323,21,_binary 'sha2-¸áFæ[ñëpãa \nv\„,∂o\˜\Õ\Ê\◊tBπ\√…ü\ÁP',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(21,_binary 'Quality of Service Based Routing: A Performance Perspective',_binary 'George	Apostolopoulos		University of Maryland\nRoch	Gu√©rin		IBM T. J. Watson Research Center\nSanjay	Kamat	sanjay@watson.ibm.com	IBM T. J. Watson Research Center\nSatish K.	Tripathi	tripathi@cs.ucr.edu	UC Riverside\n',_binary 'Recent studies provide evidence that Quality of Service (QoS) routing can provide increased network utilization compared to routing that is not sensitive to QoS requirements of traffic. However, there are still strong concerns about the increased cost of QoS routing, both in terms of more complex and frequent computations and increased routing protocol overhead. The main goals of this paper are to study these two cost components, and propose solutions that achieve good routing performance with reduced processing cost. First, we identify the parameters that determine the protocol traffic overhead, namely (a) policy for triggering updates, (b) sensitivity of this policy, and (c) clampdown timers that limit the rate of updates. Using simulation, we study the relative significance of these factors and investigate the relationship between routing performance and the amount of update traffic. In addition, we explore a range of design options to reduce the processing cost of QoS routing algorithms, and study their effect on routing performance. Based on the conclusions of these studies, we develop extensions to the basic QoS routing, that can achieve good routing performance with limited update generation rates. The paper also addresses the impact on the results of a number of secondary factors such as topology, high level admission control, and characteristics of network traffic.','',1646267323,0,0,1646267323,22,_binary 'sha2-g©dÃ©É;Çn˛\Ë%\Â*Dó…î\  Ñì\Ú!äaùî}',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(22,_binary 'Scalable QoS Provision Through Buffer Management',_binary 'R.	Gu√©rin	guerin@watson.ibm.com	IBM T. J. Watson Research Center\nS.	Kamat	sanjay@watson.ibm.com	IBM T. J. Watson Research Center\nV.	Peris	vperis@watson.ibm.com	IBM T. J. Watson Research Center\nR.	Rajan	raju@watson.ibm.com	IBM T. J. Watson Research Center\n',_binary 'In recent years, a number of link scheduling algorithms have been proposed that greatly improve upon traditional FIFO scheduling in being able to assure rate and delay bounds for individual sessions. However, they cannot be easily deployed in a backbone environ ment with thousands of sessions, as their complexity increases with the number of sessions. In this paper, we propose and analyze an approach that uses a simple buffer management scheme to provide rate guarantees to individual flows (or to a set of flows) multiplexed into a common FIFO queue. We establish the buffer allocation re quirements to achieve these rate guarantees and study the trade-off between the achievable link utilization and the buffer size required with the proposed scheme. The aspect of fair access to excess band width is also addressed, and its mapping onto a buffer allocation rule is investigated. Numerical examples are provided that illus trate the performance of the proposed schemes. Finally, a scalable architecture for QoS provisioning is presented that integrates the proposed buffer management scheme with WFQ scheduling that uses a small number of queues.','',1646267323,0,0,1646267323,23,_binary 'sha2-\œ8\‡\∆\Z¸s∫dyªï\ÒTs∫3Oyåô\›(*QvØ_Z\Ê',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(23,_binary 'Data networks as cascades: Explaining the multifractal nature of Internet WAN traffic',_binary 'A.	Feldmann	anja@research.att.com	AT&T Labs‚ÄîResearch\nA. C.	Gilbert	agilbert@research.att.com	AT&T Labs‚ÄîResearch\nW.	Willinger	walter@research.att.com	AT&T Labs‚ÄîResearch\n',_binary 'In apparent contrast to the well-documented self-similar (i.e., monofractal) scaling behavior of measured LAN traffic, recent studies have suggested that measured TCP/IP and ATM WAN traffic exhibits more complex scaling behavior, consistent with multifractals. To bring multifractals into the realm of networking, this paper provides a simple construction based on cascades (also known as multiplicative processes) that is motivated by the protocol hierarchy of IP data networks. The cascade framework allows for a plausible physical explanation of the observed multifractal scaling behavior of data traffic and suggests that the underlying multiplicative structure is a traffic invariant for WAN traffic that co-exists with self-similarity. In particular, cascades allow us to refine the previously observed self-similar nature of data traffic to account for local irregularities in WAN traffic that are typically associated with networking mechanisms operating on small time scales, such as TCP flow control.\n\nTo validate our approach, we show that recent measurements of Internet WAN traffic from both an ISP and a corporate environment are fully consistent with the proposed cascade paradigm and hence with multifractality. We rely on wavelet-based time-scale analysis techniques to visualize and to infer the scaling behavior of the traces, both globally and locally. We also discuss and illustrate with some examples how this cascade-based approach to describing data network traffic suggests novel ways for dealing with networking problems and helps in building intuition and physical understanding about the possible implications of multifractality on issues related to network performance analysis.','',1646267323,0,0,1646267323,24,_binary 'sha2-\\ˇ	´b\≈\\¶\Ï€§\"ˇM5L(Ç°ò/à\‹\˜ñ5R\Ÿ\Œ',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(24,_binary 'A Digital Fountain Approach to Reliable Distribution of Bulk Data',_binary 'John W.	Byers	byers@icsi.berkeley.edu	UC Berkeley and International Computer Science Institute\nMichael	Luby	luby@icsi.berkeley.edu	International Computer Science Institute\nMichael	Mitzenmacher	michaelm@pa.dec.com	Digital Systems Research Center\nAshutosh	Rege	rege@icsi.berkeley.edu	International Computer Science Institute\n',_binary 'The proliferation of applications that must reliably distribute bulk data to a large number of autonomous clients motivates the design of new multicast and broadcast protocols. We de- scribe an ideal, fully scalable protocol for these applications that we call a digital fountain. A digital fountain allows any number of heterogeneous clients to acquire bulk data with optimal efficiency at times of their choosing. Moreover, no feedback channels are needed to ensure reliable delivery, even in the face of high loss rates.\n\nWe develop a protocol that closely approximates a digital fountain using a new class of erasure codes that for large block sizes are orders of magnitude faster than standard erasure codes. We provide performance measurements that demonstrate the feasibility of our approach and discuss the design, implementation and performance of an experimental system.','',1646267323,0,0,1646267323,25,_binary 'sha2-Uœñ`\„ ≥FÉJØ(µtGs\nY\Ë˘5#\Ï	,\Ú\ÌT\‘+\„',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(25,_binary 'Secure Group Communications Using Key Graphs',_binary 'Chung Kei	Wong	ckwong@cs.utexas.edu	Department of Computer Sciences, University of Texas at Austin\nMohamed	Gouda	gouda@cs.utexas.edu	Department of Computer Sciences, University of Texas at Austin\nSimon S.	Lam	lam@cs.utexas.edu	Department of Computer Sciences, University of Texas at Austin\n',_binary 'Many emerging applications (e.g., teleconference, real-time information services, pay per view, distributed interactive simulation, and collaborative work) are based upon a group communications model, i.e., they require packet delivery from one or more authorized senders to a very large number of authorized receivers. As a result, securing group communications (i.e., providing confidentiality, integrity, and authenticity of messages delivered between group members) will become a critical networking issue. In this paper, we present a novel solution to the scalability problem of group/multicast key management. We formalize the notion of a secure group as a triple (U; K; R) where U denotes a set of users, K a set of keys held by the users, and R a user-key relation. We then introduce key graphs to specify secure groups. For a special class of key graphs, we present three strategies for securely distributing rekey messages after a join/leave, and specify protocols for joining and leaving a secure group. The rekeying strategies and join/leave protocols are implemented in a prototype group key server we have built. We present measurement results from experiments and discuss performance comparisons. We show that our group key management service, using any of the three rekeying strategies, is scalable to large groups with frequent joins and leaves. In particular, the average measured processing time per join/leave increases linearly with the logarithm of group size.','',1646267323,0,0,1646267323,26,_binary 'sha2-ù°:∏(I¡[õ¢Q\Â4\’.Æ3!´\‘41W\„˛¸˛â\Âq',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(26,_binary 'Achieving bounded fairness for multicast and TCP traffic in the internet',_binary 'Huayan Amy	Wang	whycu@ctr.columbia.edu	Department of Electrical Engineering, Columbia University\nMischa	Schwartz	schwartz@ctr.columbia.edu	Department of Electrical Engineering, Columbia University\n',_binary 'There is an urgent need for effective multicast congestion control algorithms which enable reasonably fair sharing of network resources between multicast and unicast TCP traffic under the current Internet infrastructure. In this paper, we propose a quantitative definition of a type of bounded fairness between multicast and unicast best-effort traffic, termed essentially fair. We also propose a window-based Random Listening Algorithm (RLA) for multicast congestion control. The algorithm is proven to be essentially fair to TCP connections under a restricted topology with equal round-trip times and with phase effects eliminated. The algorithm is also fair to multiple multicast sessions. This paper provides the theoretical proofs and some simulation results to demonstrate that the RLA achieves good performance under various network topologies. These include the performance of a generalization of the RLA algorithm for topologies with different round-trip times.','',1646267323,0,0,1646267323,27,_binary 'sha2-\ÿj-u\˜¥\…◊öˇÄ\»\Î[[.áéb\ÌèN.ál^∞',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(27,_binary 'The MASC/BGMP Architecture for Inter-domain Multicast Routing',_binary 'Satish	Kumar	kkumar@isi.edu	Information Sciences Institute, University of Southern California\nPavlin	Radoslavov	pavlin@isi.edu	Information Sciences Institute, University of Southern California\nDavid	Thaler	thalerd@eecs.umich.edu	University of Michigan\nCengiz	Alaettinoƒülu	cengiz@isi.edu	Information Sciences Institute, University of Southern California\nDeborah	Estrin	estrin@isi.edu	Information Sciences Institute, University of Southern California\nMark	Handley	mjh@isi.edu	Information Sciences Institute, University of Southern California\n',_binary 'Multicast routing enables efficient data distribution to multiple recipients. However, existing work has concentrated on extending single-domain techniques to wide-area networks, rather than providing mechanisms to realize inter-domain multicast on a global scale in the Internet.\n\nWe describe an architecture for inter-domain multicast routing that consists of two complementary protocols. The Multicast Address-Set Claim (MASC) protocol forms the basis for a hierarchical address allocation architecture. It dynamically allocates to domains multicast address ranges from which groups initiated in the domain get their multicast addresses. The Border-Gateway Multicast Protocol (BGMP), run by the border routers of a domain, constructs inter-domain bidirectional shared trees, while allowing any existing multicast routing protocol to be used within individual domains. The resulting shared tree for a group is rooted at the domain whose address range covers the group\'s address; this domain is typically the group initiator\'s domain. We demonstrate the feasibility and performance of these complementary protocols through simulation. This architecture, together with existing protocols operating within each domain, is intended as a framework in which to solve the problems facing the current multicast addressing and routing infrastructure.','',1646267323,0,0,1646267323,28,_binary 'sha2-\ÿ\˜+œÖø\Ó≠OF3⁄ãπIèárõN∏N\Ú	vUD=',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(28,_binary 'Session Directories and Internet Multicast Address Allocation',_binary 'Mark	Handley	mjh@isi.edu	USC Information Sciences Institute\n',_binary 'A multicast session directory is a mechanism by which users can discover the existence of multicast sessions. In the Mbone, session announcements have also served as multicast address reservations - a dual purpose that is efficient, but which may cause some side-affects as session directories scale.\n\nIn this paper we examine the scaling of multicast address allocation when it is performed by such a multicast session directory. Despite our best efforts to make such an approach scale, this analysis ultimately reveals significant scaling problems, and suggests a new approach to multicast address allocation in the Internet environment.','',1646267323,0,0,1646267323,29,_binary 'sha2-R\ÿÂäæ\ˆ¸ÜóAF†˙´óåK0òªxÃáv\ ≠',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(29,_binary '*Core*-Stateless Fair Queueing: Achieving Approximately Fair Bandwidth Allocations in High Speed Networks',_binary 'Ion	Stoica	istoica@cs.cmu.edu	CMU\nScott	Shenker	shenker@parc.xerox.com	Xerox PARC\nHui	Zhang	hzhang@cs.cmu.edu	CMU\n',_binary 'Router mechanisms designed to achieve fair bandwidth allocations, like Fair Queueing, have many desirable properties for congestion control in the Internet. However, such mechanisms usually need to maintain state, manage buffers, and/or perform packet scheduling on a per ow basis, and this complexity may prevent them from being cost-effectively implemented and widely deployed. In this paper, we propose an architecture that significantly reduces this implementation complexity yet still achieves approximately fair bandwidth allocations. We apply this approach to an island of routers { that is, a contiguous region of the network { and we distinguish between edge routers and core routers. Edge routers maintain per ow state; they estimate the incoming rate of each ow and insert a label into each packet header based on this estimate. Core routers maintain no per ow state; they use FIFO packet scheduling augmented by a probabilistic dropping algorithm that uses the packet labels and an estimate of the aggregate traffic at the router. We call the scheme Core-Stateless Fair Queueing. We present simulations and analysis on the performance of this approach, and discuss an alternate approach.','',1646267323,0,0,1646267323,30,_binary 'sha2-û©&lJÄ\È∫-á=πÉ=a\Ÿ\ÛáÇR\‚±+∫˙Å\'!',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL),(30,_binary 'Uniform versus Priority Dropping for Layered Video',_binary 'Sandeep	Bajaj	bajaj@parc.xerox.com	Xerox Palo Alto Research Center\nLee	Breslau	breslau@parc.xerox.com	Xerox Palo Alto Research Center\nScott	Shenker	shenker@parc.xerox.com	Xerox Palo Alto Research Center\n',_binary 'In this paper, we analyze the relative merits of uniform versus priority dropping for the transmission of layered video. We first present our original intuitions about these two approaches, and then investigate the issue more thoroughly through simulations and analysis in which we explicitly model the performance of layered video applications. We compare both their performance characteristics and incentive properties, and find that the performance benefit of priority dropping is smaller than we expected, while uniform dropping has worse incentive properties than we previously believed.','',1646267323,0,0,1646267323,31,_binary 'sha2-=W;üû\ ﬁ∫ó˙\œL\»Za1b\Ânˇ$¿\‚\'ú&Qr\Ê',0,1,0,0,0,0,0,15,_binary 'application/pdf',1646267323,0,NULL,NULL);
/*!40000 ALTER TABLE `Paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperComment`
--

DROP TABLE IF EXISTS `PaperComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperComment` (
  `paperId` int NOT NULL,
  `commentId` int NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL,
  `timeModified` bigint NOT NULL,
  `timeNotified` bigint NOT NULL DEFAULT '0',
  `timeDisplayed` bigint NOT NULL DEFAULT '0',
  `comment` varbinary(32767) DEFAULT NULL,
  `commentType` int NOT NULL DEFAULT '0',
  `replyTo` int NOT NULL,
  `paperStorageId` int NOT NULL DEFAULT '0',
  `ordinal` int NOT NULL DEFAULT '0',
  `authorOrdinal` int NOT NULL DEFAULT '0',
  `commentTags` varbinary(1024) DEFAULT NULL,
  `commentRound` int NOT NULL DEFAULT '0',
  `commentFormat` tinyint(1) DEFAULT NULL,
  `commentOverflow` longblob,
  PRIMARY KEY (`paperId`,`commentId`),
  UNIQUE KEY `commentId` (`commentId`),
  KEY `contactId` (`contactId`),
  KEY `timeModifiedContact` (`timeModified`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperComment`
--

LOCK TABLES `PaperComment` WRITE;
/*!40000 ALTER TABLE `PaperComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperConflict`
--

DROP TABLE IF EXISTS `PaperConflict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperConflict` (
  `paperId` int NOT NULL,
  `contactId` int NOT NULL,
  `conflictType` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contactId`,`paperId`),
  KEY `paperId` (`paperId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperConflict`
--

LOCK TABLES `PaperConflict` WRITE;
/*!40000 ALTER TABLE `PaperConflict` DISABLE KEYS */;
INSERT INTO `PaperConflict` VALUES (1,4,9),(4,6,10),(5,7,9),(17,8,10),(17,11,10),(27,11,9),(28,11,10),(3,12,2),(18,12,9),(1,17,9),(12,18,2),(20,18,9),(29,18,9),(30,18,10),(1,19,9),(2,21,10),(3,22,10),(4,23,10),(5,24,10),(6,25,10),(7,26,10),(8,27,10),(9,28,10),(10,29,10),(11,30,10),(11,31,10),(11,32,10),(12,33,10),(13,34,10),(15,34,10),(14,35,10),(16,36,10),(16,37,10),(18,38,10),(19,39,10),(20,40,10),(30,40,9),(21,41,10),(22,42,10),(21,43,9),(22,43,10),(16,44,9),(23,44,10),(24,45,10),(24,46,10),(25,47,10),(26,48,10),(27,49,10),(29,50,10);
/*!40000 ALTER TABLE `PaperConflict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperOption`
--

DROP TABLE IF EXISTS `PaperOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperOption` (
  `paperId` int NOT NULL,
  `optionId` int NOT NULL,
  `value` bigint NOT NULL DEFAULT '0',
  `data` varbinary(32767) DEFAULT NULL,
  `dataOverflow` longblob,
  PRIMARY KEY (`paperId`,`optionId`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperOption`
--

LOCK TABLES `PaperOption` WRITE;
/*!40000 ALTER TABLE `PaperOption` DISABLE KEYS */;
INSERT INTO `PaperOption` VALUES (1,1,1020,NULL,NULL),(2,1,200,NULL,NULL),(3,1,1040,NULL,NULL),(4,1,1040,NULL,NULL),(5,1,0,NULL,NULL);
/*!40000 ALTER TABLE `PaperOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperReview`
--

DROP TABLE IF EXISTS `PaperReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperReview` (
  `paperId` int NOT NULL,
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL,
  `reviewToken` int NOT NULL DEFAULT '0',
  `reviewType` tinyint(1) NOT NULL DEFAULT '0',
  `reviewRound` int NOT NULL DEFAULT '0',
  `requestedBy` int NOT NULL DEFAULT '0',
  `timeRequested` bigint NOT NULL DEFAULT '0',
  `timeRequestNotified` bigint NOT NULL DEFAULT '0',
  `reviewBlind` tinyint(1) NOT NULL DEFAULT '1',
  `reviewModified` bigint NOT NULL DEFAULT '0',
  `reviewAuthorModified` bigint DEFAULT NULL,
  `reviewSubmitted` bigint DEFAULT NULL,
  `reviewNotified` bigint DEFAULT NULL,
  `reviewAuthorNotified` bigint NOT NULL DEFAULT '0',
  `reviewAuthorSeen` bigint DEFAULT NULL,
  `reviewOrdinal` int NOT NULL DEFAULT '0',
  `timeDisplayed` bigint NOT NULL DEFAULT '0',
  `timeApprovalRequested` bigint NOT NULL DEFAULT '0',
  `reviewEditVersion` int NOT NULL DEFAULT '0',
  `reviewNeedsSubmit` tinyint(1) NOT NULL DEFAULT '1',
  `reviewWordCount` int DEFAULT NULL,
  `reviewFormat` tinyint(1) DEFAULT NULL,
  `overAllMerit` tinyint(1) NOT NULL DEFAULT '0',
  `reviewerQualification` tinyint(1) NOT NULL DEFAULT '0',
  `novelty` tinyint(1) NOT NULL DEFAULT '0',
  `technicalMerit` tinyint(1) NOT NULL DEFAULT '0',
  `interestToCommunity` tinyint(1) NOT NULL DEFAULT '0',
  `longevity` tinyint(1) NOT NULL DEFAULT '0',
  `grammar` tinyint(1) NOT NULL DEFAULT '0',
  `likelyPresentation` tinyint(1) NOT NULL DEFAULT '0',
  `suitableForShort` tinyint(1) NOT NULL DEFAULT '0',
  `potential` tinyint NOT NULL DEFAULT '0',
  `fixability` tinyint NOT NULL DEFAULT '0',
  `tfields` longblob,
  `sfields` varbinary(2048) DEFAULT NULL,
  PRIMARY KEY (`paperId`,`reviewId`),
  UNIQUE KEY `reviewId` (`reviewId`),
  KEY `contactId` (`contactId`),
  KEY `reviewType` (`reviewType`),
  KEY `reviewRound` (`reviewRound`),
  KEY `requestedBy` (`requestedBy`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReview`
--

LOCK TABLES `PaperReview` WRITE;
/*!40000 ALTER TABLE `PaperReview` DISABLE KEYS */;
INSERT INTO `PaperReview` VALUES (1,1,12,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(1,2,11,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(1,3,6,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(2,4,1,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(2,5,8,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(2,6,15,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(3,7,11,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(3,8,14,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(3,9,16,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(4,10,4,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(4,11,11,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(4,12,18,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(5,13,3,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(5,14,17,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(5,15,9,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(6,16,7,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(6,17,13,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(6,18,18,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(7,19,9,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(7,20,16,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(7,21,6,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(8,22,4,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(8,23,2,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(8,24,10,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(9,25,10,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(9,26,14,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(9,27,13,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(10,28,2,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(10,29,7,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(10,30,6,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(11,31,7,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(11,32,9,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(11,33,10,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(12,34,3,0,4,1,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(12,35,14,0,4,2,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(12,36,13,0,4,1,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(13,37,1,0,4,1,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(13,38,2,0,4,1,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(13,39,12,0,4,3,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(14,40,11,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(14,41,16,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(14,42,6,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(15,43,17,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(15,44,8,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(15,45,18,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(16,46,1,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(16,47,17,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(16,48,8,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(17,49,9,0,4,1,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(17,50,12,0,4,3,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(17,51,15,0,4,1,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(18,52,3,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(18,53,4,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL),(18,54,15,0,4,0,1,1646267323,0,1,0,NULL,NULL,NULL,0,NULL,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `PaperReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperReviewPreference`
--

DROP TABLE IF EXISTS `PaperReviewPreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperReviewPreference` (
  `paperId` int NOT NULL,
  `contactId` int NOT NULL,
  `preference` int NOT NULL DEFAULT '0',
  `expertise` int DEFAULT NULL,
  PRIMARY KEY (`paperId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReviewPreference`
--

LOCK TABLES `PaperReviewPreference` WRITE;
/*!40000 ALTER TABLE `PaperReviewPreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReviewPreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperReviewRefused`
--

DROP TABLE IF EXISTS `PaperReviewRefused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperReviewRefused` (
  `paperId` int NOT NULL,
  `contactId` int NOT NULL,
  `requestedBy` int NOT NULL,
  `reason` varbinary(32767) DEFAULT NULL,
  PRIMARY KEY (`paperId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReviewRefused`
--

LOCK TABLES `PaperReviewRefused` WRITE;
/*!40000 ALTER TABLE `PaperReviewRefused` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReviewRefused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperStorage`
--

DROP TABLE IF EXISTS `PaperStorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperStorage` (
  `paperId` int NOT NULL,
  `paperStorageId` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `mimetype` varbinary(80) NOT NULL DEFAULT '',
  `paper` longblob,
  `compression` tinyint(1) NOT NULL DEFAULT '0',
  `sha1` varbinary(64) NOT NULL DEFAULT '',
  `documentType` int NOT NULL DEFAULT '0',
  `filename` varbinary(255) DEFAULT NULL,
  `infoJson` varbinary(32768) DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `filterType` int DEFAULT NULL,
  `originalStorageId` int DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paperId`,`paperStorageId`),
  UNIQUE KEY `paperStorageId` (`paperStorageId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperStorage`
--

LOCK TABLES `PaperStorage` WRITE;
/*!40000 ALTER TABLE `PaperStorage` DISABLE KEYS */;
INSERT INTO `PaperStorage` VALUES (0,1,0,_binary 'text/plain','',0,_binary '\⁄9£\Ó^kK\r2Uø\Ôï`êØ\ÿ	',0,NULL,NULL,0,NULL,NULL,0),(1,2,1646267323,_binary 'application/pdf',_binary '%PDF-whatever',0,_binary 'sha2-\Ë\ÛT[Ñ™ ˙SM-ï\˜\‹\‰Fﬂè¿ﬂö\Û-ÆSñ\“#¡±o',0,NULL,NULL,13,NULL,NULL,0),(2,3,1646267323,_binary 'application/pdf',_binary '%PDF-whatever2',0,_binary 'sha2-zPô\Ê“• `:o\»h\ÕÆKJ˝\ŸŒñ-h∞\ÀC|PW',0,NULL,NULL,14,NULL,NULL,0),(3,4,1646267323,_binary 'application/pdf',_binary '%PDF-whatever3',0,_binary 'sha2-π©\ƒcy≥p¡l\Ï&Nµ\Ù∏N\ˆ÷Ö6ïˇV¯\›\rP\r`',0,NULL,NULL,14,NULL,NULL,0),(4,5,1646267323,_binary 'application/pdf',_binary '%PDF-whatever4',0,_binary 'sha2-Üi\ƒ{\Ùô@	}v\ˆæŒùZf\0¿6J§é0pÿì≈¥ß\Òan',0,NULL,NULL,14,NULL,NULL,0),(5,6,1646267323,_binary 'application/pdf',_binary '%PDF-whatever5',0,_binary 'sha2-–µ’ôºñU}wå}˙\›},,÷øñal&üT6ø\Â\Ë\“',0,NULL,NULL,14,NULL,NULL,0),(6,7,1646267323,_binary 'application/pdf',_binary '%PDF-whatever6',0,_binary 'sha2-\Z±\ﬂó5ã\ı˛\\\ˆ≥jä‚òë®\ Zò8≥¬±∑\r',0,NULL,NULL,14,NULL,NULL,0),(7,8,1646267323,_binary 'application/pdf',_binary '%PDF-whatever7',0,_binary 'sha2-?HQ¸˙0j9≥7\Ú>/•6A°ë]¸\Ù{∞é˚Zû\Ò%',0,NULL,NULL,14,NULL,NULL,0),(8,9,1646267323,_binary 'application/pdf',_binary '%PDF-whatever8',0,_binary 'sha2-V\¬;êq¡~\ZΩâ\…\‘\·\·™sP\ﬁlçªsU\‘:fj∞',0,NULL,NULL,14,NULL,NULL,0),(9,10,1646267323,_binary 'application/pdf',_binary '%PDF-whatever9',0,_binary 'sha2-…ã\Ù´0Ø(Ü\Ô\›2\Ã	èñAK\ÀBlã…°\‚C\'\Ï§i∏',0,NULL,NULL,14,NULL,NULL,0),(10,11,1646267323,_binary 'application/pdf',_binary '%PDF-whatever10',0,_binary 'sha2-9ds˝\ÒA\ÚÇH§ÆT\Ÿ\“{0\÷\Û2\‡\wU€≠°∑\¬≈ôøo',0,NULL,NULL,15,NULL,NULL,0),(11,12,1646267323,_binary 'application/pdf',_binary '%PDF-whatever11',0,_binary 'sha2-*\«!+â*&î\ﬁLõ\…\ƒaT\–:4∂ªôCõ)˛¯Mb\∆',0,NULL,NULL,15,NULL,NULL,0),(12,13,1646267323,_binary 'application/pdf',_binary '%PDF-whatever12',0,_binary 'sha2-\\çÅ7x¶ãaW≠â˚\Z\r)\Ù0˝t\‡\ÍN´±\"a&f	',0,NULL,NULL,15,NULL,NULL,0),(13,14,1646267323,_binary 'application/pdf',_binary '%PDF-whatever13',0,_binary 'sha2-o\·¡**{ömûù)$ΩTux|H3;Yf&d\Û;ï*',0,NULL,NULL,15,NULL,NULL,0),(14,15,1646267323,_binary 'application/pdf',_binary '%PDF-whatever14',0,_binary 'sha2-¿a\ +p*ï\‰@ºaTd£Á®≥ ã¥]2å\ﬂM',0,NULL,NULL,15,NULL,NULL,0),(15,16,1646267323,_binary 'application/pdf',_binary '%PDF-whatever15',0,_binary 'sha2-(º\'PÉß>X]5øì\ŒD{DpnoÄO.”´\›\Ÿ$á˙Ä¨ü',0,NULL,NULL,15,NULL,NULL,0),(16,17,1646267323,_binary 'application/pdf',_binary '%PDF-whatever16',0,_binary 'sha2-N\Û;\Ô=\—nê+\"\”![\0Yy\nz∞≥ó¿æP8’å',0,NULL,NULL,15,NULL,NULL,0),(17,18,1646267323,_binary 'application/pdf',_binary '%PDF-whatever17',0,_binary 'sha2-\›{Ω)V˛;\„\À÷∑U0eE4é\"°\¬TTãÇß˝∑=_I',0,NULL,NULL,15,NULL,NULL,0),(18,19,1646267323,_binary 'application/pdf',_binary '%PDF-whatever18',0,_binary 'sha2-f	\ı¯\¬\\∞((\œ#ª\Ô_ç\ﬂ\n9∫C\Ô!è\«\»L\∆\–',0,NULL,NULL,15,NULL,NULL,0),(19,20,1646267323,_binary 'application/pdf',_binary '%PDF-whatever19',0,_binary 'sha2-É4Eùeª\À\€\\ÖåT\Í\Ÿ˝	|b§æg\œ+U\·D°\ı',0,NULL,NULL,15,NULL,NULL,0),(20,21,1646267323,_binary 'application/pdf',_binary '%PDF-whatever20',0,_binary 'sha2-¸áFæ[ñëpãa \nv\„,∂o\˜\Õ\Ê\◊tBπ\√…ü\ÁP',0,NULL,NULL,15,NULL,NULL,0),(21,22,1646267323,_binary 'application/pdf',_binary '%PDF-whatever21',0,_binary 'sha2-g©dÃ©É;Çn˛\Ë%\Â*Dó…î\  Ñì\Ú!äaùî}',0,NULL,NULL,15,NULL,NULL,0),(22,23,1646267323,_binary 'application/pdf',_binary '%PDF-whatever22',0,_binary 'sha2-\œ8\‡\∆\Z¸s∫dyªï\ÒTs∫3Oyåô\›(*QvØ_Z\Ê',0,NULL,NULL,15,NULL,NULL,0),(23,24,1646267323,_binary 'application/pdf',_binary '%PDF-whatever23',0,_binary 'sha2-\\ˇ	´b\≈\\¶\Ï€§\"ˇM5L(Ç°ò/à\‹\˜ñ5R\Ÿ\Œ',0,NULL,NULL,15,NULL,NULL,0),(24,25,1646267323,_binary 'application/pdf',_binary '%PDF-whatever24',0,_binary 'sha2-Uœñ`\„ ≥FÉJØ(µtGs\nY\Ë˘5#\Ï	,\Ú\ÌT\‘+\„',0,NULL,NULL,15,NULL,NULL,0),(25,26,1646267323,_binary 'application/pdf',_binary '%PDF-whatever25',0,_binary 'sha2-ù°:∏(I¡[õ¢Q\Â4\’.Æ3!´\‘41W\„˛¸˛â\Âq',0,NULL,NULL,15,NULL,NULL,0),(26,27,1646267323,_binary 'application/pdf',_binary '%PDF-whatever26',0,_binary 'sha2-\ÿj-u\˜¥\…◊öˇÄ\»\Î[[.áéb\ÌèN.ál^∞',0,NULL,NULL,15,NULL,NULL,0),(27,28,1646267323,_binary 'application/pdf',_binary '%PDF-whatever27',0,_binary 'sha2-\ÿ\˜+œÖø\Ó≠OF3⁄ãπIèárõN∏N\Ú	vUD=',0,NULL,NULL,15,NULL,NULL,0),(28,29,1646267323,_binary 'application/pdf',_binary '%PDF-whatever28',0,_binary 'sha2-R\ÿÂäæ\ˆ¸ÜóAF†˙´óåK0òªxÃáv\ ≠',0,NULL,NULL,15,NULL,NULL,0),(29,30,1646267323,_binary 'application/pdf',_binary '%PDF-whatever29',0,_binary 'sha2-û©&lJÄ\È∫-á=πÉ=a\Ÿ\ÛáÇR\‚±+∫˙Å\'!',0,NULL,NULL,15,NULL,NULL,0),(30,31,1646267323,_binary 'application/pdf',_binary '%PDF-whatever30',0,_binary 'sha2-=W;üû\ ﬁ∫ó˙\œL\»Za1b\Ânˇ$¿\‚\'ú&Qr\Ê',0,NULL,NULL,15,NULL,NULL,0);
/*!40000 ALTER TABLE `PaperStorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperTag`
--

DROP TABLE IF EXISTS `PaperTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperTag` (
  `paperId` int NOT NULL,
  `tag` varchar(80) NOT NULL,
  `tagIndex` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`paperId`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperTag`
--

LOCK TABLES `PaperTag` WRITE;
/*!40000 ALTER TABLE `PaperTag` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperTagAnno`
--

DROP TABLE IF EXISTS `PaperTagAnno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperTagAnno` (
  `tag` varchar(80) NOT NULL,
  `annoId` int NOT NULL,
  `tagIndex` float NOT NULL DEFAULT '0',
  `heading` varbinary(8192) DEFAULT NULL,
  `annoFormat` tinyint(1) DEFAULT NULL,
  `infoJson` varbinary(32768) DEFAULT NULL,
  PRIMARY KEY (`tag`,`annoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperTagAnno`
--

LOCK TABLES `PaperTagAnno` WRITE;
/*!40000 ALTER TABLE `PaperTagAnno` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperTagAnno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperTopic`
--

DROP TABLE IF EXISTS `PaperTopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperTopic` (
  `paperId` int NOT NULL,
  `topicId` int NOT NULL,
  PRIMARY KEY (`paperId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperTopic`
--

LOCK TABLES `PaperTopic` WRITE;
/*!40000 ALTER TABLE `PaperTopic` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperWatch`
--

DROP TABLE IF EXISTS `PaperWatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperWatch` (
  `paperId` int NOT NULL,
  `contactId` int NOT NULL,
  `watch` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`paperId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperWatch`
--

LOCK TABLES `PaperWatch` WRITE;
/*!40000 ALTER TABLE `PaperWatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperWatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewRating`
--

DROP TABLE IF EXISTS `ReviewRating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewRating` (
  `paperId` int NOT NULL,
  `reviewId` int NOT NULL,
  `contactId` int NOT NULL,
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paperId`,`reviewId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewRating`
--

LOCK TABLES `ReviewRating` WRITE;
/*!40000 ALTER TABLE `ReviewRating` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReviewRating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewRequest`
--

DROP TABLE IF EXISTS `ReviewRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewRequest` (
  `paperId` int NOT NULL,
  `email` varchar(120) NOT NULL,
  `firstName` varbinary(120) DEFAULT NULL,
  `lastName` varbinary(120) DEFAULT NULL,
  `affiliation` varbinary(2048) DEFAULT NULL,
  `reason` varbinary(32767) DEFAULT NULL,
  `requestedBy` int NOT NULL,
  `reviewRound` int DEFAULT NULL,
  PRIMARY KEY (`paperId`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewRequest`
--

LOCK TABLES `ReviewRequest` WRITE;
/*!40000 ALTER TABLE `ReviewRequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReviewRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Settings`
--

DROP TABLE IF EXISTS `Settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Settings` (
  `name` varbinary(256) NOT NULL,
  `value` bigint NOT NULL,
  `data` varbinary(32767) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Settings`
--

LOCK TABLES `Settings` WRITE;
/*!40000 ALTER TABLE `Settings` DISABLE KEYS */;
INSERT INTO `Settings` VALUES (_binary '__capability_gc',1646267323,NULL),(_binary 'allowPaperOption',199,NULL),(_binary 'cap_key',1,_binary '1ZVOjkCPv9UapqLmgy5+Ig=='),(_binary 'conf_key',1,_binary '\ÒÜULOû@Ωf7å\Ï\ƒ*\Î–î\Ôt\ÒöÜxzP£'),(_binary 'extrev_view',2,NULL),(_binary 'options',1,_binary '[{\"id\":1,\"name\":\"Calories\",\"abbr\":\"calories\",\"type\":\"numeric\",\"position\":1,\"display\":\"default\"}]'),(_binary 'outcome_map',1,_binary '{\"0\":\"Unspecified\",\"-1\":\"Rejected\",\"1\":\"Accepted\"}'),(_binary 'pcrev_any',1,NULL),(_binary 'pcrev_assigntime',1646267323,NULL),(_binary 'review_form',1,_binary '{\"overAllMerit\":{\"name\":\"Overall merit\",\"position\":1,\"visibility\":\"au\",\"options\":[\"Reject\",\"Weak reject\",\"Weak accept\",\"Accept\",\"Strong accept\"]},\"reviewerQualification\":{\"name\":\"Reviewer expertise\",\"position\":2,\"visibility\":\"au\",\"options\":[\"No familiarity\",\"Some familiarity\",\"Knowledgeable\",\"Expert\"]},\"t01\":{\"name\":\"Paper summary\",\"position\":3,\"display_space\":5,\"visibility\":\"au\"},\"t02\":{\"name\":\"Comments for author\",\"position\":4,\"display_space\":15,\"visibility\":\"au\"},\"t03\":{\"name\":\"Comments for PC\",\"position\":5,\"display_space\":10,\"visibility\":\"pc\"}}'),(_binary 'sub_pcconf',1,NULL),(_binary 'tag_chair',1,_binary 'accept reject pcpaper'),(_binary 'tag_rounds',1,_binary ' R1 R3 R2 ');
/*!40000 ALTER TABLE `Settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TopicArea`
--

DROP TABLE IF EXISTS `TopicArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TopicArea` (
  `topicId` int NOT NULL AUTO_INCREMENT,
  `topicName` varbinary(1024) DEFAULT NULL,
  PRIMARY KEY (`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TopicArea`
--

LOCK TABLES `TopicArea` WRITE;
/*!40000 ALTER TABLE `TopicArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `TopicArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TopicInterest`
--

DROP TABLE IF EXISTS `TopicInterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TopicInterest` (
  `contactId` int NOT NULL,
  `topicId` int NOT NULL,
  `interest` int NOT NULL,
  PRIMARY KEY (`contactId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TopicInterest`
--

LOCK TABLES `TopicInterest` WRITE;
/*!40000 ALTER TABLE `TopicInterest` DISABLE KEYS */;
/*!40000 ALTER TABLE `TopicInterest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-03  0:35:25
