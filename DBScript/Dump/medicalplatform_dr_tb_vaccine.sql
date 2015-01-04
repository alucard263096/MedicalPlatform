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
-- Table structure for table `dr_tb_vaccine`
--

DROP TABLE IF EXISTS `dr_tb_vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_vaccine` (
  `id` int(11) NOT NULL COMMENT '主键',
  `code` varchar(45) NOT NULL COMMENT '疫苗编号',
  `effect_id` int(11) NOT NULL COMMENT '功效',
  `image` varchar(145) NOT NULL,
  `injection_count` int(11) NOT NULL COMMENT '注射次数',
  `is_index` varchar(1) NOT NULL DEFAULT 'N',
  `used_group_id` varchar(1000) NOT NULL COMMENT '适用人群',
  `is_hk_project` varchar(1) NOT NULL COMMENT '是否为香港计划内疫苗',
  `is_china_project` varchar(1) NOT NULL COMMENT '是否为中国计划内疫苗',
  `standard_price` decimal(10,3) NOT NULL COMMENT '疫苗接种标准价格',
  `discount` int(11) NOT NULL COMMENT '折扣',
  `content` text NOT NULL,
  `remarks` varchar(500) NOT NULL COMMENT '备注',
  `status` varchar(1) NOT NULL COMMENT '状态A,I,D',
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `seq` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疫苗';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_vaccine`
--

LOCK TABLES `dr_tb_vaccine` WRITE;
/*!40000 ALTER TABLE `dr_tb_vaccine` DISABLE KEYS */;
INSERT INTO `dr_tb_vaccine` VALUES (1,'001',2,'14122515019Chrysanthemum.jpg',3,'N','3','Y','Y',10000.000,99,'','','A','2014-12-11 00:00:24',1,'2014-12-25 23:49:22',1,'1'),(2,'002',1,'14122515005Desert.jpg',1,'N','1,3','Y','N',1344.000,99,'','','A','2014-12-11 00:03:20',1,'2014-12-25 23:45:16',1,'1');
/*!40000 ALTER TABLE `dr_tb_vaccine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-04 22:15:23