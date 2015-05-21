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
-- Table structure for table `dr_tb_order`
--

DROP TABLE IF EXISTS `dr_tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_order` (
  `id` int(11) NOT NULL,
  `order_no` varchar(45) DEFAULT NULL COMMENT '订单号',
  `guid` varchar(45) DEFAULT NULL COMMENT '标识码，用于区别单据唯一',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `name` varchar(45) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(45) DEFAULT NULL COMMENT '电话',
  `price` varchar(45) DEFAULT NULL COMMENT '价格',
  `act` varchar(45) DEFAULT NULL COMMENT '类型',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `snapshot` varchar(1000) DEFAULT NULL COMMENT '信息缩略',
  `updated_user` int(11) DEFAULT NULL COMMENT '更新者',
  `updated_date` datetime DEFAULT NULL COMMENT '更新日期',
  `h_status` varchar(45) DEFAULT NULL COMMENT '操作状态',
  `h_comment` varchar(255) DEFAULT NULL COMMENT '操作留言',
  `status` varchar(45) DEFAULT NULL COMMENT '状态，不同订单类型可能不同，但是P是开始，F是完成是必然的',
  `idport_type` varchar(45) DEFAULT NULL COMMENT '证件类型',
  `idport` varchar(45) DEFAULT NULL COMMENT '证件号码',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `remark` varchar(200) DEFAULT NULL COMMENT '客户备注',
  `order_date` date DEFAULT NULL,
  `order_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_order`
--

LOCK TABLES `dr_tb_order` WRITE;
/*!40000 ALTER TABLE `dr_tb_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_tb_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-21 17:40:08
