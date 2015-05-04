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
-- Table structure for table `dr_tb_block_lang`
--

DROP TABLE IF EXISTS `dr_tb_block_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_block_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_block_lang`
--

LOCK TABLES `dr_tb_block_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_block_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_block_lang` VALUES (1,'en_us','Cyberport'),(1,'zh-cn','数码港'),(1,'zh-hk','數碼港'),(2,'en_us','Pok Fu Lam'),(2,'zh-cn','薄扶林'),(2,'zh-hk','薄扶林'),(3,'en_us','Sai Wan'),(3,'zh-cn','西环'),(3,'zh-hk','西環'),(4,'en_us','Sheung Wan'),(4,'zh-cn','上环'),(4,'zh-hk','上環'),(5,'en_us','Central'),(5,'zh-cn','中环'),(5,'zh-hk','中環'),(6,'en_us','Admiralty'),(6,'zh-cn','金钟'),(6,'zh-hk','金鐘'),(7,'en_us','Wan Chai'),(7,'zh-cn','湾仔'),(7,'zh-hk','灣仔'),(8,'en_us','Causeway Bay'),(8,'zh-cn','铜锣湾'),(8,'zh-hk','銅鑼灣'),(9,'en_us','Happy Valley'),(9,'zh-cn','跑马地'),(9,'zh-hk','跑馬地'),(10,'en_us','Tin Hau'),(10,'zh-cn','天后'),(10,'zh-hk','天後'),(11,'en_us','Fortress Hill'),(11,'zh-cn','炮台山'),(11,'zh-hk','炮臺山'),(12,'en_us','North Point'),(12,'zh-cn','北角'),(12,'zh-hk','北角'),(13,'en_us','Quarry Bay'),(13,'zh-cn','鲗鱼涌'),(13,'zh-hk','鲗魚湧'),(14,'en_us','Tai Koo'),(14,'zh-cn','太古'),(14,'zh-hk','太古'),(15,'en_us','Sai Wan Ho'),(15,'zh-cn','西湾河'),(15,'zh-hk','西灣河'),(16,'en_us','Shau Kei Wan'),(16,'zh-cn','筲箕湾'),(16,'zh-hk','筲箕灣'),(17,'en_us','HengFaChuen'),(17,'zh-cn','杏花村'),(17,'zh-hk','杏花村'),(18,'en_us','Chai Wan'),(18,'zh-cn','柴湾'),(18,'zh-hk','柴灣'),(19,'en_us','SiuSai Wan'),(19,'zh-cn','小西湾'),(19,'zh-hk','小西灣'),(20,'en_us','Aberdeen'),(20,'zh-cn','香港仔'),(20,'zh-hk','香港仔'),(21,'en_us','Ap Lei Chau'),(21,'zh-cn','鸭脷洲'),(21,'zh-hk','鴨脷洲'),(22,'en_us','Deep Water Bay'),(22,'zh-cn','深水湾'),(22,'zh-hk','深水灣'),(23,'en_us','Repulse Bay'),(23,'zh-cn','浅水湾'),(23,'zh-hk','淺水灣'),(24,'en_us','Stanley'),(24,'zh-cn','赤柱'),(24,'zh-hk','赤柱'),(25,'en_us','Shek O'),(25,'zh-cn','石澳'),(25,'zh-hk','石澳'),(26,'en_us','Peak'),(26,'zh-cn','山顶'),(26,'zh-hk','山頂'),(27,'en_us','Jordan'),(27,'zh-cn','佐敦'),(27,'zh-hk','佐敦'),(28,'en_us','MongKok'),(28,'zh-cn','旺角'),(28,'zh-hk','旺角'),(29,'en_us','Yau Tong'),(29,'zh-cn','油塘'),(29,'zh-hk','油塘'),(30,'en_us','Hung Hom'),(30,'zh-cn','红磡'),(30,'zh-hk','紅磡'),(31,'en_us','Mei Foo'),(31,'zh-cn','美孚'),(31,'zh-hk','美孚'),(32,'en_us','Choi Hung'),(32,'zh-cn','彩虹'),(32,'zh-hk','彩虹'),(33,'en_us','Lam Tin'),(33,'zh-cn','蓝田'),(33,'zh-hk','藍田'),(34,'en_us','Kwun Tong'),(34,'zh-cn','观塘'),(34,'zh-hk','觀塘'),(35,'en_us','Kowloon City'),(35,'zh-cn','九龙城'),(35,'zh-hk','九龍城'),(36,'en_us','Kowloon Tong'),(36,'zh-cn','九龙塘'),(36,'zh-hk','九龍塘'),(37,'en_us','Kowloon Bay'),(37,'zh-cn','九龙湾'),(37,'zh-hk','九龍灣'),(38,'en_us','To Kwa Wan'),(38,'zh-cn','土瓜湾'),(38,'zh-hk','土瓜灣'),(39,'en_us','Tai KokTsui'),(39,'zh-cn','大角咀'),(39,'zh-hk','大角咀'),(40,'en_us','Ngau Tau Kok'),(40,'zh-cn','牛头角'),(40,'zh-hk','牛頭角'),(41,'en_us','TsimShaTsui'),(41,'zh-cn','尖沙咀'),(41,'zh-hk','尖沙咀'),(42,'en_us','Ho Man Tin'),(42,'zh-cn','何文田'),(42,'zh-hk','何文田'),(43,'en_us','Yau Ma Tei'),(43,'zh-cn','油麻地'),(43,'zh-hk','油麻地'),(44,'en_us','Cheung Sha Wan'),(44,'zh-cn','长沙湾'),(44,'zh-hk','長沙灣'),(45,'en_us','Lai Chi Kok'),(45,'zh-cn','荔枝角'),(45,'zh-hk','荔枝角'),(46,'en_us','Sham Shui Po'),(46,'zh-cn','深水埗'),(46,'zh-hk','深水埗'),(47,'en_us','Wong Tai Sin'),(47,'zh-cn','黄大仙'),(47,'zh-hk','黃大仙'),(48,'en_us','San Po Kong'),(48,'zh-cn','新蒲岗'),(48,'zh-hk','新蒲崗'),(49,'en_us','Diamond Hill'),(49,'zh-cn','钻石山'),(49,'zh-hk','鉆石山'),(50,'en_us','SheungShui'),(50,'zh-cn','上水'),(50,'zh-hk','上水'),(51,'en_us','Fan Ling'),(51,'zh-cn','粉岭'),(51,'zh-hk','粉嶺'),(52,'en_us','Tai Po'),(52,'zh-cn','大埔'),(52,'zh-hk','大埔'),(53,'en_us','Fo Tan'),(53,'zh-cn','火炭'),(53,'zh-hk','火炭'),(54,'en_us','Sha Tin'),(54,'zh-cn','沙田'),(54,'zh-hk','沙田'),(55,'en_us','Tai Wai'),(55,'zh-cn','大围'),(55,'zh-hk','大圍'),(56,'en_us','Ma On Shan'),(56,'zh-cn','马鞍山'),(56,'zh-hk','馬鞍山'),(57,'en_us','Kwai Chung'),(57,'zh-cn','葵涌'),(57,'zh-hk','葵湧'),(58,'en_us','Tsuen Wan'),(58,'zh-cn','荃湾'),(58,'zh-hk','荃灣'),(59,'en_us','Sai Kung'),(59,'zh-cn','西贡'),(59,'zh-hk','西貢'),(60,'en_us','Tseung Kwan O'),(60,'zh-cn','将军澳'),(60,'zh-hk','將軍澳'),(61,'en_us','TuenMun'),(61,'zh-cn','屯门'),(61,'zh-hk','屯門'),(62,'en_us','Yuen Long'),(62,'zh-cn','元朗'),(62,'zh-hk','元朗'),(63,'en_us','Tsing Yi'),(63,'zh-cn','青衣'),(63,'zh-hk','青衣'),(64,'en_us','Tin ShuiWai'),(64,'zh-cn','天水围'),(64,'zh-hk','天水圍'),(65,'en_us','Sham Tseng'),(65,'zh-cn','深井'),(65,'zh-hk','深井'),(66,'en_us','Tung Chung'),(66,'zh-cn','东涌'),(66,'zh-hk','東湧'),(67,'en_us','Airport'),(67,'zh-cn','机场'),(67,'zh-hk','機場'),(68,'en_us','Discovery Bay'),(68,'zh-cn','愉景湾'),(68,'zh-hk','愉景灣');
/*!40000 ALTER TABLE `dr_tb_block_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:36
