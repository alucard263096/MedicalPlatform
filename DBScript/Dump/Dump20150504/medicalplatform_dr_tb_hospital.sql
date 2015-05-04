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
-- Table structure for table `dr_tb_hospital`
--

DROP TABLE IF EXISTS `dr_tb_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_hospital` (
  `id` int(11) NOT NULL COMMENT '主键',
  `coordinate` varchar(45) NOT NULL,
  `remarks` varchar(1000) NOT NULL COMMENT '备注',
  `status` varchar(1) NOT NULL COMMENT '状态',
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_hospital`
--

LOCK TABLES `dr_tb_hospital` WRITE;
/*!40000 ALTER TABLE `dr_tb_hospital` DISABLE KEYS */;
INSERT INTO `dr_tb_hospital` VALUES (1,'114.16567,22.280151','','A','2015-03-23 23:23:38',4,'2015-03-23 23:23:38',4),(2,'114.198413,22.328234','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(3,'114.195655,22.266555','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(4,'114.190979,22.342663','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(5,'114.194725,22.272254','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(6,'114.161156,22.263047','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(7,'114.173179,22.336897','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(8,'114.199468,22.281288','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(9,'114.196324,22.329028','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(10,'114.116061,22.380203','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(11,'114.187045,22.363534','','A','2015-03-23 23:23:39',4,'2015-03-23 23:23:39',4),(12,'n.a.','','A','2015-03-23 23:23:43',4,'2015-03-23 23:23:43',4);
/*!40000 ALTER TABLE `dr_tb_hospital` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:17
