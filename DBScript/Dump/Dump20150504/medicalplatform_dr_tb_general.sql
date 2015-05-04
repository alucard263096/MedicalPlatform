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
-- Table structure for table `dr_tb_general`
--

DROP TABLE IF EXISTS `dr_tb_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_general` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '标识符',
  `content_sc` text COMMENT '内容',
  `content_tc` text,
  `content_en` text,
  `remarks` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` varchar(45) NOT NULL,
  `updated_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文字管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_general`
--

LOCK TABLES `dr_tb_general` WRITE;
/*!40000 ALTER TABLE `dr_tb_general` DISABLE KEYS */;
INSERT INTO `dr_tb_general` VALUES (1,'aboutus','我们是谁？<br />\n我们是中国移动医疗的开创者<br />\n我们的理念是？<br />\n利用移动互联网帮助人们掌握健康、延缓衰老、治疗病痛','','','关于我们，港医汇','2015-03-27 00:39:55',1,'2015-03-27 00:39:55',1),(2,'aboutus-faith','<p>我们是谁？<br />\n我们是中国移动医疗的开创者<br />\n我们的理念是？<br />\n利用移动互联网帮助人们掌握健康、延缓衰老、治疗病痛</p>\n','','','关于我们，港医汇信念','2015-03-27 00:41:20',1,'2015-03-27 00:41:20',1),(3,'aboutus-dream','<p>我们是谁？<br />\n我们是中国移动医疗的开创者<br />\n我们的理念是？<br />\n利用移动互联网帮助人们掌握健康、延缓衰老、治疗病痛</p>','','','关于我们，港医汇梦想','2015-03-27 00:41:45',1,'2015-03-27 00:41:45',1),(4,'order_caution','<p align=\"left\">1. 请务必填写准确的个人信息，到港后须出示与姓名相符合的证件方可就诊。</p>\n\n<p align=\"left\">2. 所有费用都在就诊时支付。</p>\n\n<p align=\"left\">3. 支付方式为港币现金、信用卡(Visa, master)、部分诊所支持银联。</p>\n\n<p align=\"left\">4. 建议出发前兑换好足够港币现金。</p>\n','','','订单创建-》注意事项','2015-03-29 16:05:13',1,'2015-03-29 16:07:35',1);
/*!40000 ALTER TABLE `dr_tb_general` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:27
