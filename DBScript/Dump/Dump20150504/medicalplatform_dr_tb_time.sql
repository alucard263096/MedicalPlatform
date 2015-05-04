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
-- Table structure for table `dr_tb_time`
--

DROP TABLE IF EXISTS `dr_tb_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_time` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `start_time` varchar(45) NOT NULL,
  `end_time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='期段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_time`
--

LOCK TABLES `dr_tb_time` WRITE;
/*!40000 ALTER TABLE `dr_tb_time` DISABLE KEYS */;
INSERT INTO `dr_tb_time` VALUES (1,'08:00-08:30','08:00','08:30'),(2,'08:30-09:00','08:30','09:00'),(3,'09:00-09:30','09:00','09:30'),(4,'09:30-10:00','09:30','10:00'),(5,'10:00-10:30','10:00','10:30'),(6,'10:30-11:00','10:30','11:00'),(7,'11:00-11:30','11:00','11:30'),(8,'11:30-12:00','11:30','12:00'),(9,'12:00-12:30','12:00','12:30'),(10,'12:30-13:00','12:30','13:00'),(11,'13:00-13:30','13:00','13:30'),(12,'13:30-14:00','13:30','14:00'),(13,'14:00-14:30','14:00','14:30'),(14,'14:30-15:00','14:30','15:00'),(15,'15:00-15:30','15:00','15:30'),(16,'15:30-16:00','15:30','16:00'),(17,'16:00-16:30','16:00','16:30'),(18,'16:30-17:00','16:30','17:00'),(19,'17:00-17:30','17:00','17:30'),(20,'17:30-18:00','17:30','18:00'),(21,'18:00-18:30','18:00','18:30'),(22,'18:30-19:00','18:30','19:00'),(23,'19:00-19:30','19:00','19:30'),(24,'19:30-20:00','19:30','20:00'),(25,'20:00-20:30','20:00','20:30'),(26,'20:30-21:00','20:30','21:00');
/*!40000 ALTER TABLE `dr_tb_time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:25
