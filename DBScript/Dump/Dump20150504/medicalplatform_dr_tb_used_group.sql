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
-- Table structure for table `dr_tb_used_group`
--

DROP TABLE IF EXISTS `dr_tb_used_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_used_group` (
  `id` int(11) NOT NULL COMMENT '主键',
  `type` varchar(1) NOT NULL COMMENT '类型，A无限制 Y，疫苗专用',
  `min_age` int(11) NOT NULL COMMENT '最小年龄',
  `max_age` int(11) NOT NULL COMMENT '最大年龄',
  `sexual` varchar(1) NOT NULL COMMENT '适用性别A,M,F',
  `remarks` varchar(500) NOT NULL COMMENT '备注',
  `status` varchar(1) NOT NULL COMMENT '状态，A,I,D',
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='适用人群';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_used_group`
--

LOCK TABLES `dr_tb_used_group` WRITE;
/*!40000 ALTER TABLE `dr_tb_used_group` DISABLE KEYS */;
INSERT INTO `dr_tb_used_group` VALUES (1,'Y',0,18,'A','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41',4),(2,'Y',50,100,'A','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41',4),(3,'Y',0,100,'A','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41',4),(4,'Y',9,100,'A','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41',4);
/*!40000 ALTER TABLE `dr_tb_used_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:26
