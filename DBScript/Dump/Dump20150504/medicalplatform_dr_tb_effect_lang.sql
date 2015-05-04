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
-- Table structure for table `dr_tb_effect_lang`
--

DROP TABLE IF EXISTS `dr_tb_effect_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_effect_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '功效名称',
  `description` varchar(1000) NOT NULL COMMENT '功效详细描述',
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='治疗功效多语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_effect_lang`
--

LOCK TABLES `dr_tb_effect_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_effect_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_effect_lang` VALUES (1,'en-us','HPV','Prevent Cervical Cancer, Vaginal Cancer, Vulvar Cancer, Genital Warts. '),(1,'zh-cn','子宫颈癌','预防子宫颈癌、外阴癌、阴道癌和生殖器官湿疣'),(1,'zh-hk','子宮頸癌','預防子宮頸癌、外陰癌、陰道癌和生殖器官濕疣'),(2,'en-us','Influenza (flu)','Influenza (flu)'),(2,'zh-cn','流行性感冒（流感）','流行性感冒（流感）'),(2,'zh-hk','流行性感冒（流感）','流行性感冒（流感）'),(3,'en-us','Herpes Zoster','a viral disease characterized by a painful skin rash with blisters in a limited area on one side of the body (left or right), often in a stripe.'),(3,'zh-cn','带状疱疹（生蛇）','一种令人痛楚而呈带状的红疹，并带有水泡。“生蛇”是由水痘病毒引起的疾病。'),(3,'zh-hk','帶狀疱疹（生蛇）','一種令人痛楚而呈帶狀的紅疹，並帶有水泡。“生蛇”是由水痘病毒引起的疾病。'),(4,'en-us','Streptococcus pneumoniae','Pneumococcal infection is caused by a type of bacteria called Streptococcus pneumoniae (pneumococcus). '),(4,'zh-cn','肺炎球菌','肺炎球菌感染是由肺炎链球菌（肺炎球菌）引致的疾病。'),(4,'zh-hk','肺炎球菌','肺炎球菌感染是由肺炎鏈球菌（肺炎球菌）引致的疾病。'),(5,'en-us','GP','GP'),(5,'zh-cn','全科门诊','收费便宜，普通的常见病都可以看，收费包含医生诊疗费及3天药费，不另外收取药费。'),(5,'zh-hk','全科门诊','全科门诊'),(6,'en-us','SP','SP'),(6,'zh-cn','专科门诊','收费较贵，针对性较强，适合已看过专科或经全科医生转介。'),(6,'zh-hk','专科门诊','专科门诊');
/*!40000 ALTER TABLE `dr_tb_effect_lang` ENABLE KEYS */;
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
