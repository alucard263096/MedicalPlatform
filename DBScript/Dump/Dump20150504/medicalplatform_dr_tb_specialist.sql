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
-- Table structure for table `dr_tb_specialist`
--

DROP TABLE IF EXISTS `dr_tb_specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_specialist` (
  `id` int(11) NOT NULL,
  `effect_list` varchar(200) NOT NULL COMMENT '效果列表',
  `remarks` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生专科';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_specialist`
--

LOCK TABLES `dr_tb_specialist` WRITE;
/*!40000 ALTER TABLE `dr_tb_specialist` DISABLE KEYS */;
INSERT INTO `dr_tb_specialist` VALUES (1,'','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41','4'),(2,'','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41','4'),(3,'','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41','4'),(4,'','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41','4'),(5,'','','A','2015-03-23 23:23:41',4,'2015-03-23 23:23:41','4'),(6,'6','','A','2015-03-23 23:23:41',4,'2015-03-25 15:46:54','1'),(7,'','内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。内科一般分为：心内科、神经内科(头痛面瘫 瘫痪昏迷 抽搐眩晕 肌肉萎缩不自主运动)、呼吸内科(发热 咳嗽咯血 呼吸困难呃逆)、消化内科、肾内科、内分泌科(水肿 生长发育异常尿量异常 尿糖甲状腺肿大)、风湿病科、血液科、肝科、传染科、耳鼻咽喉科、小儿内科。','A','2015-03-23 23:23:43',3,'2015-03-23 23:23:43','3'),(8,'6','','A','2015-03-23 23:23:47',4,'2015-03-23 23:23:47','4'),(9,'5','','A','2015-03-25 15:44:41',1,'2015-03-25 15:44:58','1'),(10,'6','','A','2015-03-25 15:46:39',1,'2015-03-25 15:46:39','1'),(11,'','','A','2015-03-25 15:49:25',1,'2015-03-25 15:49:25','1'),(12,'','','A','2015-03-25 15:50:20',1,'2015-03-25 15:50:20','1'),(13,'','','A','2015-03-25 15:50:53',1,'2015-03-25 15:50:53','1'),(14,'','','A','2015-03-25 15:51:52',1,'2015-03-25 15:51:52','1'),(15,'','','A','2015-03-25 15:52:19',1,'2015-03-25 15:52:19','1'),(16,'','','A','2015-03-25 15:54:23',1,'2015-03-25 15:54:23','1'),(17,'','','A','2015-03-25 15:54:50',1,'2015-03-25 15:54:50','1'),(18,'','','A','2015-03-25 15:55:16',1,'2015-03-25 15:55:16','1'),(20,'','','A','2015-04-10 14:32:56',1,'2015-04-10 14:32:56','1'),(21,'','','A','2015-04-10 14:33:11',1,'2015-04-10 14:33:11','1'),(22,'','','A','2015-04-10 14:33:17',1,'2015-04-10 14:33:17','1'),(23,'','','A','2015-04-10 14:33:18',1,'2015-04-10 14:33:18','1'),(24,'','','A','2015-04-10 14:33:18',1,'2015-04-10 14:33:18','1'),(25,'','','A','2015-04-10 14:33:18',1,'2015-04-10 14:33:18','1'),(26,'','','A','2015-04-10 14:33:18',1,'2015-04-10 14:33:18','1'),(27,'','','A','2015-04-10 14:33:24',1,'2015-04-10 14:33:24','1'),(28,'','','A','2015-04-10 14:33:26',1,'2015-04-10 14:33:26','1'),(29,'','','A','2015-04-10 14:33:27',1,'2015-04-10 14:33:27','1');
/*!40000 ALTER TABLE `dr_tb_specialist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:37
