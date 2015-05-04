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
-- Table structure for table `dr_tb_member_question`
--

DROP TABLE IF EXISTS `dr_tb_member_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_member_question` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_male` varchar(1) DEFAULT NULL,
  `age` varchar(2) DEFAULT NULL,
  `img_1` varchar(255) DEFAULT NULL,
  `img_2` varchar(255) DEFAULT NULL,
  `img_3` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_user` int(11) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `member_name` varchar(45) DEFAULT NULL,
  `member_mobile` varchar(45) DEFAULT NULL,
  `reply` varchar(1000) DEFAULT NULL,
  `replied_date` datetime DEFAULT NULL,
  `read` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_member_question`
--

LOCK TABLES `dr_tb_member_question` WRITE;
/*!40000 ALTER TABLE `dr_tb_member_question` DISABLE KEYS */;
INSERT INTO `dr_tb_member_question` VALUES (1,4,1,'我有病，点算！','Y','','15032523044share.jpg','','','P',NULL,NULL,NULL,'2015-03-25 23:21:45','','13751082562',NULL,NULL,NULL),(2,5,2,'头痛，脚麻','Y','26','15032617031msgVer.txt','15032617009welcome.jpg','','F','','2015-03-26 18:00:14',1,'2015-03-26 17:24:36','Tianj','15920593055','没大问题，死不了',NULL,NULL),(3,5,3,'头疼','N','21','15032823046image.jpg','','','P',NULL,NULL,NULL,'2015-03-28 23:44:49','123','13088821616',NULL,NULL,NULL),(4,7,3,'在','N','21','15032823058image.jpg','','','P',NULL,NULL,NULL,'2015-03-28 23:52:00','123','13088821616',NULL,NULL,NULL),(5,11,2,'Ggggggggg%ggfvcdffg','Y','','15041112039IMG_20150406_143226.jpg','','','P',NULL,NULL,NULL,'2015-04-11 12:13:05','Tianj','15920593055',NULL,NULL,'0'),(6,0,1,'我随便咨询个问题来测试一下','Y','','','','','F','','2015-04-20 17:04:10',4,'2015-04-15 14:48:52','','13751082562','你有啥个问题？？？？',NULL,'0');
/*!40000 ALTER TABLE `dr_tb_member_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:29
