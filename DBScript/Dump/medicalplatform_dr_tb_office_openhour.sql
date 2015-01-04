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
-- Table structure for table `dr_tb_office_openhour`
--

DROP TABLE IF EXISTS `dr_tb_office_openhour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_office_openhour` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL COMMENT '医生',
  `office_id` int(11) NOT NULL COMMENT '诊所',
  `meet_day1` varchar(200) NOT NULL COMMENT '周一开放时间',
  `meet_day2` varchar(200) NOT NULL COMMENT '周二开放时间',
  `meet_day3` varchar(200) NOT NULL COMMENT '周三开放时间',
  `meet_day4` varchar(200) NOT NULL COMMENT '周四开放时间',
  `meet_day5` varchar(200) NOT NULL COMMENT '周五开放时间',
  `meet_day6` varchar(200) NOT NULL COMMENT '周六开放时间',
  `meet_day0` varchar(200) NOT NULL COMMENT '周日开放时间',
  `remarks` varchar(1000) NOT NULL,
  `status` varchar(1) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生诊所工作时间';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_office_openhour`
--

LOCK TABLES `dr_tb_office_openhour` WRITE;
/*!40000 ALTER TABLE `dr_tb_office_openhour` DISABLE KEYS */;
INSERT INTO `dr_tb_office_openhour` VALUES (1,1,1,'1,9','1,9,18,20','9,13','11,20','','1,17','12','','A',1,'2014-12-27 00:20:21',4,'2014-12-27 02:20:02'),(2,1,2,'1,2,3,4,8,9,10,11,16,18,25','18','24','','','','2,9,10,16,17,23,24','','A',1,'2014-12-29 16:15:03',1,'2014-12-29 16:15:03');
/*!40000 ALTER TABLE `dr_tb_office_openhour` ENABLE KEYS */;
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
