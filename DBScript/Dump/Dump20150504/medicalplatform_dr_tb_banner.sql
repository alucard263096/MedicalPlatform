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
-- Table structure for table `dr_tb_banner`
--

DROP TABLE IF EXISTS `dr_tb_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_banner` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '代码',
  `title_sc` varchar(500) NOT NULL COMMENT '标题',
  `title_tc` varchar(500) NOT NULL,
  `title_en` varchar(500) NOT NULL,
  `link` varchar(500) NOT NULL COMMENT '超链接',
  `pic_sc` varchar(500) NOT NULL COMMENT '图片',
  `pic_tc` varchar(500) DEFAULT NULL,
  `pic_en` varchar(500) DEFAULT NULL,
  `remarks` varchar(500) NOT NULL COMMENT '说明',
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_banner`
--

LOCK TABLES `dr_tb_banner` WRITE;
/*!40000 ALTER TABLE `dr_tb_banner` DISABLE KEYS */;
INSERT INTO `dr_tb_banner` VALUES (1,'indextop1','无','无','无','http://myhkdoc.com/vaccine/detail.php?id=1','15041014033hpv.jpg','','','首页顶部广告第一张','2015-02-02 23:41:55',1,'2015-04-10 14:42:39',1,'A'),(2,'indextop2','无','无','无','http://myhkdoc.com/vaccine/detail.php?id=3','15041820008banner4.jpg','','','首页顶部广告第2张','2015-02-02 23:43:25',1,'2015-04-18 20:54:58',3,'A'),(3,'indextop3','无','无','无','http://myhkdoc.com/vaccine/detail.php?id=1','15041821027jiyin.jpg','','','首页顶部广告第3张','2015-02-02 23:45:20',1,'2015-04-18 21:18:39',3,'A'),(4,'indextop4','无','无','无','','15032423033banner4.jpg','','','首页顶部广告第4张','2015-03-23 23:23:38',1,'2015-03-24 23:39:35',3,'A'),(5,'indexpromotion','.','.','.','http://myhkdoc.com/vaccine/detail.php?id=1','15041200052shouyeguanggao.jpg','','','首页中间左边广告图','2015-03-23 23:23:38',1,'2015-04-12 00:55:39',3,'A');
/*!40000 ALTER TABLE `dr_tb_banner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:19
