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
-- Table structure for table `dr_tb_doctor_account`
--

DROP TABLE IF EXISTS `dr_tb_doctor_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_doctor_account` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL COMMENT '绑定医生',
  `login_id` varchar(45) NOT NULL COMMENT '登录账号',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `accessright` varchar(45) NOT NULL COMMENT '权限，D医生，N护士',
  `email` varchar(45) NOT NULL COMMENT '邮箱',
  `remarks` varchar(300) NOT NULL,
  `status` varchar(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生登录账号管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_doctor_account`
--

LOCK TABLES `dr_tb_doctor_account` WRITE;
/*!40000 ALTER TABLE `dr_tb_doctor_account` DISABLE KEYS */;
INSERT INTO `dr_tb_doctor_account` VALUES (1,1,'aaa','0b4e7a0e5fe84ad35fb5f95b9ceeac79','D','aaa','','A','2014-12-16 22:25:35',1,'2014-12-16 22:25:35',1),(2,1,'aaaa','47bce5c74f589f4867dbd57e9ca9f808','D','aaa','','A','2014-12-16 22:26:00',1,'2014-12-16 22:26:00',1),(3,1,'aaaaa','74b87337454200d4d33f80c4663dc5e5','N','aa','','A','2014-12-16 22:26:13',1,'2014-12-16 22:26:13',1),(4,1,'test_1','4e70ffa82fbe886e3c4ac00ac374c29b','D','aaa','','A','2014-12-18 21:30:14',1,'2014-12-18 21:32:09',1);
/*!40000 ALTER TABLE `dr_tb_doctor_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-04 22:15:25
