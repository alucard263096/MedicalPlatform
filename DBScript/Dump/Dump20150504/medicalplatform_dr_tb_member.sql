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
-- Table structure for table `dr_tb_member`
--

DROP TABLE IF EXISTS `dr_tb_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_member` (
  `id` int(11) NOT NULL,
  `email` varchar(1000) NOT NULL COMMENT '邮箱',
  `mobile` varchar(15) NOT NULL COMMENT '手机号码',
  `password` varchar(60) NOT NULL COMMENT '登录密码',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_member`
--

LOCK TABLES `dr_tb_member` WRITE;
/*!40000 ALTER TABLE `dr_tb_member` DISABLE KEYS */;
INSERT INTO `dr_tb_member` VALUES (1,'','13751082562','fd1dfc816d947e535d370565db588d3f','','A'),(2,'','15920593055','366c6dc765f8ddf156c1b3482cfcbbc7','Tianj','A'),(3,'','13088821616','e10adc3949ba59abbe56e057f20f883e','Sunny','A'),(4,'','13012345678','e10adc3949ba59abbe56e057f20f883e','Tttedff','A'),(5,'','13312345678','e10adc3949ba59abbe56e057f20f883e','','A'),(6,'','','d41d8cd98f00b204e9800998ecf8427e','','A'),(7,'','13926053099','b8ec03771594f859adb37067d05c6273','Kevin','A'),(8,'','18588821478','b8ec03771594f859adb37067d05c6273','','A');
/*!40000 ALTER TABLE `dr_tb_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:31
