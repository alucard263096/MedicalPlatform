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
-- Table structure for table `dr_tb_doctor_lang`
--

DROP TABLE IF EXISTS `dr_tb_doctor_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_doctor_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(145) NOT NULL COMMENT '医生姓名',
  `post_process` varchar(1000) NOT NULL COMMENT '任职历程',
  `summary` varchar(1000) NOT NULL COMMENT '个人简介',
  `pro_title` varchar(1000) NOT NULL COMMENT '获得的专业资格',
  `book_content` varchar(1000) NOT NULL COMMENT '预约内容',
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生多语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_doctor_lang`
--

LOCK TABLES `dr_tb_doctor_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_doctor_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_doctor_lang` VALUES (1,'en-us','Kevin','啊啊','aaa','ee','aa'),(1,'zh-cn','Kevin','啊啊','aaa','eee','aa'),(1,'zh-hk','Kevin','啊啊','aa','ee','aa');
/*!40000 ALTER TABLE `dr_tb_doctor_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-11 22:54:21
