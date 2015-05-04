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
-- Table structure for table `dr_tb_specialist_lang`
--

DROP TABLE IF EXISTS `dr_tb_specialist_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_specialist_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生专科语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_specialist_lang`
--

LOCK TABLES `dr_tb_specialist_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_specialist_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_specialist_lang` VALUES (1,'en-us','Dermatology'),(1,'zh-cn','皮肤科'),(1,'zh-hk','皮膚科'),(2,'en-us','Urology'),(2,'zh-cn','泌尿外科'),(2,'zh-hk','泌尿外科'),(3,'en-us','Gastroenterology & Hepatology'),(3,'zh-cn','肠胃肝脏科'),(3,'zh-hk','腸胃肝臟科'),(4,'en-us','Nephrology'),(4,'zh-cn','肾病科'),(4,'zh-hk','腎病科'),(5,'en-us','Ophthalmology'),(5,'zh-cn','眼科'),(5,'zh-hk','眼科'),(6,'en-us','Paediatrics'),(6,'zh-cn','儿科'),(6,'zh-hk','兒科'),(7,'en-us','medical department\n'),(7,'zh-cn','内科'),(7,'zh-hk','內科'),(8,'en-us','TCM'),(8,'zh-cn','中医'),(8,'zh-hk','中医'),(9,'en-us','GP'),(9,'zh-cn','全科（普通科）'),(9,'zh-hk','全科（普通科）'),(10,'en-us','cardio'),(10,'zh-cn','心脏科'),(10,'zh-hk','心脏科'),(11,'en-us','ONCOLOGY'),(11,'zh-cn','临床肿瘤科'),(11,'zh-hk','临床肿瘤科'),(12,'en-us','DERMATOLOGY & VENEREOLOGY'),(12,'zh-cn','皮肤及性病科'),(12,'zh-hk','皮肤及性病科'),(13,'en-us','ENDOCRINOLOGY, DIABETES & METABOLISM'),(13,'zh-cn','内分泌及糖尿科'),(13,'zh-hk','内分泌及糖尿科'),(14,'en-us','GENERAL SURGERY'),(14,'zh-cn','外科'),(14,'zh-hk','外科'),(15,'en-us','OBSTETRICS & GYNAECOLOGY'),(15,'zh-cn','妇产科'),(15,'zh-hk','妇产科'),(16,'en-us','ORTHOPAEDICS & TRAUMATOLOGY'),(16,'zh-cn','骨科'),(16,'zh-hk','骨科'),(17,'en-us','OTORHINOLARYNGOLOGY'),(17,'zh-cn','耳鼻喉科'),(17,'zh-hk','耳鼻喉科'),(18,'en-us','RESPIRATORY MEDICINE'),(18,'zh-cn','呼吸系統科'),(18,'zh-hk','呼吸系統科'),(20,'en-us','普通科'),(20,'zh-cn','普通科'),(20,'zh-hk','普通科'),(21,'en-us','心胸肺外科'),(21,'zh-cn','心胸肺外科'),(21,'zh-hk','心胸肺外科'),(22,'en-us','老人科'),(22,'zh-cn','老人科'),(22,'zh-hk','老人科'),(23,'en-us','血液及血液肿瘤科'),(23,'zh-cn','血液及血液肿瘤科'),(23,'zh-hk','血液及血液肿瘤科'),(24,'en-us','内科肿瘤科'),(24,'zh-cn','内科肿瘤科'),(24,'zh-hk','内科肿瘤科'),(25,'en-us','脑神经科'),(25,'zh-cn','脑神经科'),(25,'zh-hk','脑神经科'),(26,'en-us','神经外科'),(26,'zh-cn','神经外科'),(26,'zh-hk','神经外科'),(27,'en-us','小儿外科'),(27,'zh-cn','小儿外科'),(27,'zh-hk','小儿外科'),(28,'en-us','呼吸系统科'),(28,'zh-cn','呼吸系统科'),(28,'zh-hk','呼吸系统科'),(29,'en-us','风湿病科'),(29,'zh-cn','风湿病科'),(29,'zh-hk','风湿病科');
/*!40000 ALTER TABLE `dr_tb_specialist_lang` ENABLE KEYS */;
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
