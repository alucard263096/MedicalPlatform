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
-- Table structure for table `dr_tb_member_info`
--

DROP TABLE IF EXISTS `dr_tb_member_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_member_info` (
  `member_id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_male` varchar(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `is_completed` varchar(1) DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `has_new_die` varchar(45) DEFAULT NULL,
  `has_ill_relate` varchar(45) DEFAULT NULL,
  `has_vaccine` varchar(45) DEFAULT NULL,
  `has_treat` varchar(45) DEFAULT NULL,
  `smoke` varchar(45) DEFAULT NULL,
  `drink` varchar(45) DEFAULT NULL,
  `long_medicine` varchar(45) DEFAULT NULL,
  `allergy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_member_info`
--

LOCK TABLES `dr_tb_member_info` WRITE;
/*!40000 ALTER TABLE `dr_tb_member_info` DISABLE KEYS */;
INSERT INTO `dr_tb_member_info` VALUES (1,'15041514035Koala.jpg',NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'15040812003start_pic.png','Y','1980-03-26','深圳','1','170','60',NULL,'Y','Y','Y',NULL,NULL,NULL,NULL),(3,'15032823016image.jpg','N','2015-03-28','深圳','1','170','55','N','N','N','Y',NULL,NULL,NULL,NULL),(4,'','Y',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,'1980-10-22',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'15040809019image.jpg','Y','1981-11-29','广州','1','171','72',NULL,NULL,NULL,NULL,NULL,'2',NULL,NULL);
/*!40000 ALTER TABLE `dr_tb_member_info` ENABLE KEYS */;
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
