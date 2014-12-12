CREATE DATABASE  IF NOT EXISTS `medicalplatform` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `medicalplatform`;
-- MySQL dump 10.13  Distrib 5.6.19, for Win32 (x86)
--
-- Host: localhost    Database: medicalplatform
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
-- Table structure for table `dr_tb_weekday_lang`
--

DROP TABLE IF EXISTS `dr_tb_weekday_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_weekday_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作日多语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_weekday_lang`
--

LOCK TABLES `dr_tb_weekday_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_weekday_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_weekday_lang` VALUES (1,'en-us','Monday'),(1,'zh-cn','星期一'),(1,'zh-sc','星期一'),(2,'en-us','Tuesday'),(2,'zh-cn','星期二'),(2,'zh-sc','星期二'),(3,'en-us','Wednesday'),(3,'zh-cn','星期三'),(3,'zh-sc','星期三'),(4,'en-us','Thursday'),(4,'zh-cn','星期四'),(4,'zh-sc','星期四'),(5,'en-us','Friday'),(5,'zh-cn','星期五'),(5,'zh-sc','星期五'),(6,'en-us','Saturday'),(6,'zh-cn','星期六'),(6,'zh-sc','星期六'),(7,'en-us','Sunday'),(7,'zh-cn','星期日'),(7,'zh-sc','星期日');
/*!40000 ALTER TABLE `dr_tb_weekday_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-13  0:27:35
