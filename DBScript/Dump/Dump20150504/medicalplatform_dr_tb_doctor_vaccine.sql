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
-- Table structure for table `dr_tb_doctor_vaccine`
--

DROP TABLE IF EXISTS `dr_tb_doctor_vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_doctor_vaccine` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL COMMENT '医生',
  `vaccine_id` int(11) NOT NULL COMMENT '疫苗',
  `price` int(11) DEFAULT NULL COMMENT '单次接种疫苗收费',
  `web_price` int(11) NOT NULL COMMENT '一次性付款收费',
  `remarks` varchar(1000) NOT NULL,
  `status` varchar(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生的疫苗';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_doctor_vaccine`
--

LOCK TABLES `dr_tb_doctor_vaccine` WRITE;
/*!40000 ALTER TABLE `dr_tb_doctor_vaccine` DISABLE KEYS */;
INSERT INTO `dr_tb_doctor_vaccine` VALUES (1,7,1,3300,2500,'','D','2015-03-23 23:23:44',4,'2015-04-24 17:46:18',4),(2,2,1,3300,2500,'','D','2015-03-23 23:23:44',4,'2015-04-24 17:46:18',4),(3,4,1,3300,2500,'','A','2015-03-23 23:23:44',4,'2015-03-23 23:23:44',4),(4,1,1,3300,2500,'','D','2015-03-23 23:23:44',4,'2015-04-24 17:46:07',4),(5,6,1,3300,2500,'','D','2015-03-23 23:23:44',4,'2015-04-24 17:46:18',4),(6,3,1,3300,2500,'','D','2015-03-23 23:23:44',4,'2015-04-22 16:13:08',4),(7,8,1,3300,2500,'','D','2015-03-23 23:23:44',4,'2015-04-24 17:46:18',4),(8,5,1,3300,2500,'','D','2015-03-23 23:23:44',4,'2015-04-24 17:46:26',4),(9,4,3,1500,1100,'','A','2015-03-23 23:23:44',4,'2015-03-23 23:23:44',4),(10,4,5,950,800,'','A','2015-03-23 23:23:44',4,'2015-03-23 23:23:44',4),(11,5,3,1500,1200,'','D','2015-03-27 11:33:14',1,'2015-04-24 17:46:07',4),(12,4,4,850,800,'','A','2015-04-10 14:50:35',1,'2015-04-10 14:50:35',1),(13,357,1,3300,2700,'','A','2015-04-24 17:43:58',4,'2015-04-24 17:43:58',4),(14,357,3,1700,1300,'','A','2015-04-24 17:44:59',4,'2015-04-24 17:44:59',4),(15,357,4,1300,1100,'','A','2015-04-24 17:45:26',4,'2015-04-24 17:45:26',4),(16,357,5,1300,1100,'','A','2015-04-24 17:45:46',4,'2015-04-24 17:45:46',4);
/*!40000 ALTER TABLE `dr_tb_doctor_vaccine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:33
