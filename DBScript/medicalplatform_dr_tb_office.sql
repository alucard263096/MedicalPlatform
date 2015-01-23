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
-- Table structure for table `dr_tb_office`
--

DROP TABLE IF EXISTS `dr_tb_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_office` (
  `id` int(11) NOT NULL COMMENT '主键',
  `coordinate` varchar(45) NOT NULL,
  `remarks` varchar(1000) NOT NULL COMMENT '备注',
  `status` varchar(1) NOT NULL COMMENT '状态',
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `hot_district_id` int(11) NOT NULL,
  `station1_id` int(11) NOT NULL,
  `station2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='诊所';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_office`
--

LOCK TABLES `dr_tb_office` WRITE;
/*!40000 ALTER TABLE `dr_tb_office` DISABLE KEYS */;
INSERT INTO `dr_tb_office` VALUES (1,'116.387021,40.039448','','A','2014-12-22 00:38:51',1,'2015-01-11 00:59:44',1,1,0),(2,'116.366899,39.966493','aaaa','A','2014-12-29 16:14:19',1,'2014-12-29 16:14:19',1,0,0);
/*!40000 ALTER TABLE `dr_tb_office` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-11 22:54:20
