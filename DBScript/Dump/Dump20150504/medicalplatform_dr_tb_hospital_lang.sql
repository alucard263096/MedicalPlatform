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
-- Table structure for table `dr_tb_hospital_lang`
--

DROP TABLE IF EXISTS `dr_tb_hospital_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_hospital_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(200) NOT NULL COMMENT '医院名称',
  `description` varchar(1000) NOT NULL COMMENT '医院描述',
  `address` varchar(1000) NOT NULL COMMENT '医院地址',
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院多语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_hospital_lang`
--

LOCK TABLES `dr_tb_hospital_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_hospital_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_hospital_lang` VALUES (1,'en-us','Canossa Hospital (Caritas)','Tel : 2522 2181\nFax: 2840 1986','1 Old Peak Road, Hong Kong'),(1,'zh-cn','嘉诺撒医院','电话 : 2522 2181\n传真 : 2840 1986','香港旧山顶道1号'),(1,'zh-hk','嘉諾撒醫院','電話 : 2522 2181\n傳真 : 2840 1986','香港舊山頂道1號'),(2,'en-us','Evangel Hospital','Tel : 2711 5221\nFax: 2761 1469','222 Argyle Street, Kowloon'),(2,'zh-cn','播道医院','电话 : 2711 5221\n传真 : 2761 1469','九龙亚皆老街222号'),(2,'zh-hk','播道醫院','電話 : 2711 5221\n傳真 : 2761 1469','九龍亞皆老街222號'),(3,'en-us','Hong Kong Adventist Hospital','Tel : 3651 8888\nFax: 3651 8800','40 Stubbs Road, Hong Kong'),(3,'zh-cn','香港港安医院','电话 : 3651 8888\n传真 : 3651 8800','香港司徒拔道40号'),(3,'zh-hk','香港港安醫院','電話 : 3651 8888\n傳真 : 3651 8800','香港司徒拔道40號'),(4,'en-us','Hong Kong Baptist Hospital','Tel : 2339 8888\nFax: 2338 5394','222 Waterloo Road, Kowloon'),(4,'zh-cn','香港浸信会医院','电 话 : 2339 8888\n传 真 : 2338 5394','九龙窝打老道222号'),(4,'zh-hk','香港浸信會醫院','電 話 : 2339 8888\n傳 真 : 2338 5394','九龍窩打老道222號'),(5,'en-us','Hong Kong Sanatorium and Hospital','Tel : 2572 0211\nFax: 2835 5186','No. 2 Village Road, Happy Valley, Hong Kong'),(5,'zh-cn','香港养和医院','电 话 : 2572 0211\n传 真 : 2835 5186','香港跑马地山村道2号'),(5,'zh-hk','香港養和醫院','電 話 : 2572 0211\n傳 真 : 2835 5186','香港跑馬地山村道2號'),(6,'en-us','Matilda & War Memorial Hospital','Tel : 2849 0111\nFax: 2849 7411','41 Mount Kellett Road, The Peak, Hong Kong'),(6,'zh-cn','明德医院','电 话 : 2849 0111\n传 真 : 2849 7411','香港山顶加列山道41号'),(6,'zh-hk','明德醫院','電 話 : 2849 0111\n傳 真 : 2849 7411','香港山頂加列山道41號'),(7,'en-us','Precious Blood Hospital (Caritas)','Tel : 3971 9900\nFax: 2728 4290','113 Castle Peak Road, Sham Shui Po, Kowloon'),(7,'zh-cn','宝血医院 (明爱)','电 话 : 3971 9900\n传 真 : 2728 4290','九龙深水埗青山道113号'),(7,'zh-hk','寶血醫院 (明愛)','電 話 : 3971 9900\n傳 真 : 2728 4290','九龍深水埗青山道113號'),(8,'en-us','St. Paul\'s Hospital','Tel : 2890 6008\nFax: 2576 4558','2 Eastern Hospital Road, Causeway Bay, Hong Kong'),(8,'zh-cn','圣保禄医院','电 话 : 2890 6008\n传 真 : 2576 4558','香港铜锣湾东院道2号'),(8,'zh-hk','聖保祿醫院','電 話 : 2890 6008\n傳 真 : 2576 4558','香港銅鑼灣東院道2號'),(9,'en-us','St. Teresa\'s Hospital','Tel : 2711 9111, 2200 3434\nFax: 2711 9779','327 Prince Edward Road, Kowloon'),(9,'zh-cn','圣德肋撒医院','电 话 : 2711 9111, 2200 3434\n传 真 : 2711 9779','九龙太子道327号'),(9,'zh-hk','聖德肋撒醫院','電 話 : 2711 9111, 2200 3434\n傳 真 : 2711 9779','九龍太子道327號'),(10,'en-us','Tsuen Wan Adventist Hospital','Tel : 2276 7676\nFax: 2413 5311, 2415 6767','199 Tsuen King Circuit, Tsuen Wan, New Territories'),(10,'zh-cn','荃湾港安医院','电 话 : 2276 7676\n传 真 : 2413 5311, 2415 6767','新界荃湾荃景围199号'),(10,'zh-hk','荃灣港安醫院','電 話 : 2276 7676\n傳 真 : 2413 5311, 2415 6767','新界荃灣荃景圍199號'),(11,'en-us','Union Hospital','Tel : 2608 3388\nFax: 2605 3334','No. 18 Fu Kin Street, Tai Wai, Shatin, New Territories'),(11,'zh-cn','仁安医院','电 话 : 2608 3388\n传 真 : 2605 3334','新界沙田大围富健街18号'),(11,'zh-hk','仁安醫院','電 話 : 2608 3388\n傳 真 : 2605 3334','新界沙田大圍富健街18號'),(12,'en-us','Others','n.a.','n.a.'),(12,'zh-cn','其他','不适用','不适用'),(12,'zh-hk','其他','不适用','不适用');
/*!40000 ALTER TABLE `dr_tb_hospital_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:32
