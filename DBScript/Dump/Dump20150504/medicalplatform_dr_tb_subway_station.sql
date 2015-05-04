CREATE DATABASE  IF NOT EXISTS `medicalplatform` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `medicalplatform`;
-- MySQL dump 10.13  Distrib 5.6.19, for Win32 (x86)
--
-- Host: 120.24.239.49    Database: medicalplatform
-- ------------------------------------------------------
-- Server version	5.6.21-enterprise-commercial-advanced-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dr_tb_subway_station`
--

DROP TABLE IF EXISTS `dr_tb_subway_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_subway_station` (
  `id` int(11) NOT NULL,
  `subway_id` int(11) NOT NULL,
  `remarks` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_subway_station`
--

LOCK TABLES `dr_tb_subway_station` WRITE;
/*!40000 ALTER TABLE `dr_tb_subway_station` DISABLE KEYS */;
INSERT INTO `dr_tb_subway_station` VALUES (1,1,''),(2,1,''),(3,1,''),(4,1,''),(5,1,''),(6,1,''),(7,1,''),(8,1,''),(9,1,''),(10,1,''),(11,1,''),(12,1,''),(13,1,''),(14,2,''),(15,2,''),(16,2,''),(17,2,''),(18,2,''),(19,2,''),(20,2,''),(21,2,''),(22,2,''),(23,2,''),(24,2,''),(25,2,''),(26,2,''),(27,2,''),(28,2,''),(29,3,''),(30,3,''),(31,3,''),(32,3,''),(33,3,''),(34,3,''),(35,3,''),(36,3,''),(37,3,''),(38,3,''),(39,3,''),(40,3,''),(41,3,''),(42,3,''),(43,3,''),(44,3,''),(45,3,''),(46,4,''),(47,4,''),(48,4,''),(49,4,''),(50,4,''),(51,4,''),(52,4,''),(53,4,''),(54,4,''),(55,4,''),(56,4,''),(57,4,''),(58,4,''),(59,4,''),(60,4,''),(61,4,''),(62,5,''),(63,5,''),(64,5,''),(65,5,''),(66,5,''),(67,5,''),(68,5,''),(69,5,''),(70,6,''),(71,6,''),(72,6,''),(73,6,''),(74,6,''),(75,6,''),(76,6,''),(77,6,''),(78,6,''),(79,7,''),(80,7,''),(81,7,''),(82,7,''),(83,7,''),(84,7,''),(85,7,''),(86,7,''),(87,7,''),(88,7,''),(89,7,''),(90,7,''),(91,8,''),(92,8,''),(93,8,''),(94,8,''),(95,8,''),(96,8,''),(97,8,''),(98,8,''),(99,9,''),(100,9,''),(101,9,''),(102,9,'');
/*!40000 ALTER TABLE `dr_tb_subway_station` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:21
