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
-- Table structure for table `dr_tb_vaccine_lang`
--

DROP TABLE IF EXISTS `dr_tb_vaccine_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_vaccine_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '疫苗名称',
  `injection_time` varchar(300) NOT NULL COMMENT '接种时间',
  `injection_season` varchar(300) NOT NULL COMMENT '适用季节',
  `description` varchar(1000) NOT NULL COMMENT '疫苗详细介绍',
  `caution` varchar(1000) NOT NULL COMMENT '接种注意事项',
  `bad_effect` varchar(1000) NOT NULL COMMENT '可能产生的不良反应',
  `bad_effect_resolve` varchar(1000) NOT NULL COMMENT '产生不良反应的解决方法',
  `summary` varchar(1000) NOT NULL,
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疫苗多语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_vaccine_lang`
--

LOCK TABLES `dr_tb_vaccine_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_vaccine_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_vaccine_lang` VALUES (1,'en-us','Ji HUi YI Miao','1-3','一年四季','啊啊啊','aaa','aaa','eee','介个也好解决，针对三种主流服务器，我们都可以在服务器端配置http equiv规则：\napache服务器，确保 mod_headers 和 mod_setenvif 是available的，然后在httpd.conf「新版Apache的配置文件是 apache2.conf」或者在.htaccess中加入以下规则：'),(1,'zh-cn','脊灰疫苗','1到3岁','一年四季','啊啊啊','aaa','aaa','eee','介个也好解决，针对三种主流服务器，我们都可以在服务器端配置http equiv规则：apache服务器，确保 mod_headers 和 mod_setenvif 是available的，然后在httpd.conf「新版Apache的配置文件是 apache2.conf」或者在.htaccess中加入以下规则：'),(1,'zh-hk','脊灰疫苗','1到3岁','一年四季','啊啊啊','aaa','aaa','eee','介个也好解决，针对三种主流服务器，我们都可以在服务器端配置http equiv规则：\napache服务器，确保 mod_headers 和 mod_setenvif 是available的，然后在httpd.conf「新版Apache的配置文件是 apache2.conf」或者在.htaccess中加入以下规则：'),(2,'en-us','子宫疫苗','aaa','aaa','aaa','aaa','aaa','aaa','Title bars are full width and docked to the top of the viewport.'),(2,'zh-cn','子宫疫苗','aaa','2','aaa','aaa','aaa','aaa','Title bars are full width and docked to the top of the viewport.'),(2,'zh-hk','子宫疫苗','aaa','aaa','aaa','aaa','aaa','aaa','Title bars are full width and docked to the top of the viewport.');
/*!40000 ALTER TABLE `dr_tb_vaccine_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-04 22:15:26
