CREATE DATABASE  IF NOT EXISTS `medicalplatform` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `medicalplatform`;
-- MySQL dump 10.13  Distrib 5.6.19, for Win64 (x86_64)
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
-- Table structure for table `dr_tb_requirement`
--

DROP TABLE IF EXISTS `dr_tb_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_requirement` (
  `id` int(11) NOT NULL,
  `submit_user` int(11) NOT NULL COMMENT '提交人',
  `title` varchar(250) NOT NULL COMMENT '需求标题',
  `type` varchar(1) NOT NULL COMMENT '需求类型',
  `description` varchar(1000) NOT NULL COMMENT '需求描述',
  `attachment_1` varchar(250) NOT NULL COMMENT '附件1',
  `attachment_2` varchar(250) NOT NULL COMMENT '附件2',
  `attachment_3` varchar(250) NOT NULL COMMENT '附件3',
  `handling_comment` varchar(1000) NOT NULL COMMENT '处理意见',
  `handling_type` varchar(1) NOT NULL COMMENT '处理类型',
  `handling_user` varchar(45) NOT NULL COMMENT '处理人',
  `review_type` varchar(1) NOT NULL COMMENT '审阅类型',
  `review_comment` varchar(45) NOT NULL COMMENT '审阅评论',
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='需求申请';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-06 16:37:00
