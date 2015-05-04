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
-- Table structure for table `dr_tb_subway_station_lang`
--

DROP TABLE IF EXISTS `dr_tb_subway_station_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_subway_station_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(145) NOT NULL,
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_subway_station_lang`
--

LOCK TABLES `dr_tb_subway_station_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_subway_station_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_subway_station_lang` VALUES (1,'en_us','Hung Hom '),(1,'zh-cn','红磡'),(1,'zh-hk','紅磡'),(2,'en_us','Mong Kok East'),(2,'zh-cn','旺角东'),(2,'zh-hk','旺角東'),(3,'en_us','Kowloon Tong'),(3,'zh-cn','九龙塘'),(3,'zh-hk','九龍塘'),(4,'en_us','Tai Wai '),(4,'zh-cn','大围'),(4,'zh-hk','大圍'),(5,'en_us','Sha Tin '),(5,'zh-cn','沙田'),(5,'zh-hk','沙田'),(6,'en_us','Fo Tan '),(6,'zh-cn','火炭'),(6,'zh-hk','火炭'),(7,'en_us','University '),(7,'zh-cn','大学'),(7,'zh-hk','大學'),(8,'en_us','Tai Po Market '),(8,'zh-cn','大埔墟'),(8,'zh-hk','大埔墟'),(9,'en_us','Tai Wo '),(9,'zh-cn','太和'),(9,'zh-hk','太和'),(10,'en_us','Fanling '),(10,'zh-cn','粉岭'),(10,'zh-hk','粉嶺'),(11,'en_us','Sheung Shui '),(11,'zh-cn','上水'),(11,'zh-hk','上水'),(12,'en_us','Lo Wu '),(12,'zh-cn','罗湖'),(12,'zh-hk','羅湖'),(13,'en_us','Lok Ma Chau'),(13,'zh-cn','落马洲'),(13,'zh-hk','落馬洲'),(14,'en_us','Yau Ma Tei '),(14,'zh-cn','油麻地'),(14,'zh-hk','油麻地'),(15,'en_us','Mong Kok '),(15,'zh-cn','旺角'),(15,'zh-hk','旺角'),(16,'en_us','Prince Edward '),(16,'zh-cn','太子'),(16,'zh-hk','太子'),(17,'en_us','Shek Kip Mei '),(17,'zh-cn','石硖尾'),(17,'zh-hk','石硖尾'),(18,'en_us','Kowloon Tong'),(18,'zh-cn','九龙塘'),(18,'zh-hk','九龍塘'),(19,'en_us','Lok Fu '),(19,'zh-cn','乐富'),(19,'zh-hk','樂富'),(20,'en_us','Wong Tai Sin '),(20,'zh-cn','黄大仙'),(20,'zh-hk','黃大仙'),(21,'en_us','Diamond Hill '),(21,'zh-cn','钻石山'),(21,'zh-hk','鑽石山'),(22,'en_us','Choi Hung '),(22,'zh-cn','彩虹'),(22,'zh-hk','彩虹'),(23,'en_us','Kowloon Bay '),(23,'zh-cn','九龙湾'),(23,'zh-hk','九龍灣'),(24,'en_us','Ngau Tau Kok '),(24,'zh-cn','牛头角'),(24,'zh-hk','牛頭角'),(25,'en_us','Kwun Tong '),(25,'zh-cn','观塘'),(25,'zh-hk','觀塘'),(26,'en_us','Lam Tin '),(26,'zh-cn','蓝田'),(26,'zh-hk','藍田'),(27,'en_us','Yau Tong '),(27,'zh-cn','油塘'),(27,'zh-hk','油塘'),(28,'en_us','Tiu Keng Leng'),(28,'zh-cn','调景岭'),(28,'zh-hk','調景嶺'),(29,'en_us','Kennedy Town'),(29,'zh-cn','坚尼地城'),(29,'zh-hk','堅尼地城'),(30,'en_us','HKU'),(30,'zh-cn','香港大学'),(30,'zh-hk','香港大學'),(31,'en_us','Sai Ying Pun'),(31,'zh-cn','西营盘'),(31,'zh-hk','西營盤'),(32,'en_us','Sheung Wan '),(32,'zh-cn','上环'),(32,'zh-hk','上環'),(33,'en_us','Central '),(33,'zh-cn','中环'),(33,'zh-hk','中環'),(34,'en_us','Admiralty '),(34,'zh-cn','金钟'),(34,'zh-hk','金鍾'),(35,'en_us','Wan Chai '),(35,'zh-cn','湾仔'),(35,'zh-hk','灣仔'),(36,'en_us','Causeway Bay '),(36,'zh-cn','铜锣湾'),(36,'zh-hk','銅鑼灣'),(37,'en_us','Tin Hau '),(37,'zh-cn','天后'),(37,'zh-hk','天後'),(38,'en_us','Fortress Hill '),(38,'zh-cn','炮台山'),(38,'zh-hk','炮台山'),(39,'en_us','North Point '),(39,'zh-cn','北角'),(39,'zh-hk','北角'),(40,'en_us','Quarry Bay '),(40,'zh-cn','鱼则鱼涌'),(40,'zh-hk','魚則魚湧'),(41,'en_us','Tai Koo '),(41,'zh-cn','太古'),(41,'zh-hk','太古'),(42,'en_us','Sai Wan Ho '),(42,'zh-cn','西湾河'),(42,'zh-hk','西灣河'),(43,'en_us','Shau Kei Wan '),(43,'zh-cn','筲箕湾'),(43,'zh-hk','筲箕灣'),(44,'en_us','Heng Fa Chuen '),(44,'zh-cn','杏花村'),(44,'zh-hk','杏花村'),(45,'en_us','Chai Wan'),(45,'zh-cn','柴湾'),(45,'zh-hk','柴灣'),(46,'en_us','Central '),(46,'zh-cn','中环'),(46,'zh-hk','中環'),(47,'en_us','Admiralty '),(47,'zh-cn','金钟'),(47,'zh-hk','金鍾'),(48,'en_us','Tsim Sha Tsui'),(48,'zh-cn','尖沙咀'),(48,'zh-hk','尖沙咀'),(49,'en_us','Jordan '),(49,'zh-cn','佐敦'),(49,'zh-hk','佐敦'),(50,'en_us','Yau Ma Tei '),(50,'zh-cn','油麻地'),(50,'zh-hk','油麻地'),(51,'en_us','Mong Kok '),(51,'zh-cn','旺角'),(51,'zh-hk','旺角'),(52,'en_us','Prince Edward '),(52,'zh-cn','太子'),(52,'zh-hk','太子'),(53,'en_us','Sham Shui Po'),(53,'zh-cn','深水涉'),(53,'zh-hk','深水涉'),(54,'en_us','Cheung Sha Wan'),(54,'zh-cn','长沙湾'),(54,'zh-hk','長沙灣'),(55,'en_us','Lai Chi Kok '),(55,'zh-cn','荔枝角'),(55,'zh-hk','荔枝角'),(56,'en_us','Mei Foo'),(56,'zh-cn','美孚'),(56,'zh-hk','美孚'),(57,'en_us','Lai King '),(57,'zh-cn','荔景'),(57,'zh-hk','荔景'),(58,'en_us','Kwai Fong '),(58,'zh-cn','葵芳'),(58,'zh-hk','葵芳'),(59,'en_us','Kwai Hing '),(59,'zh-cn','葵兴'),(59,'zh-hk','葵興'),(60,'en_us','Tai Wo Hau'),(60,'zh-cn','大窝口'),(60,'zh-hk','大窩口'),(61,'en_us','Tsuen Wan '),(61,'zh-cn','荃湾'),(61,'zh-hk','荃灣'),(62,'en_us','North Point '),(62,'zh-cn','北角'),(62,'zh-hk','北角'),(63,'en_us','Quarry Bay '),(63,'zh-cn','鱼则鱼涌'),(63,'zh-hk','魚則魚湧'),(64,'en_us','Yau Tong '),(64,'zh-cn','油塘'),(64,'zh-hk','油塘'),(65,'en_us','Tiu Keng Leng '),(65,'zh-cn','调景岭'),(65,'zh-hk','調景嶺'),(66,'en_us','Tseung Kwan O'),(66,'zh-cn','将军澳'),(66,'zh-hk','將軍澳'),(67,'en_us','Hang Hau '),(67,'zh-cn','坑口'),(67,'zh-hk','坑口'),(68,'en_us','Po Lam '),(68,'zh-cn','宝琳'),(68,'zh-hk','寶琳'),(69,'en_us','Lohas Park'),(69,'zh-cn','康城'),(69,'zh-hk','康城'),(70,'en_us','Tai Wai '),(70,'zh-cn','大围'),(70,'zh-hk','大圍'),(71,'en_us','Che Kung Temple'),(71,'zh-cn','车公庙'),(71,'zh-hk','車公廟'),(72,'en_us','Sha Tin Wai'),(72,'zh-cn','沙田围'),(72,'zh-hk','沙田圍'),(73,'en_us','City One'),(73,'zh-cn','第一城'),(73,'zh-hk','第一城'),(74,'en_us','Shek Mun'),(74,'zh-cn','石门'),(74,'zh-hk','石門'),(75,'en_us','Tai Shui Hang'),(75,'zh-cn','大水坑'),(75,'zh-hk','大水坑'),(76,'en_us','Heng On'),(76,'zh-cn','恒安'),(76,'zh-hk','恒安'),(77,'en_us','Ma On Shan'),(77,'zh-cn','马鞍山'),(77,'zh-hk','馬鞍山'),(78,'en_us','Wu Kai Sha'),(78,'zh-cn','乌溪沙'),(78,'zh-hk','烏溪沙'),(79,'en_us','Hung Hom '),(79,'zh-cn','红磡'),(79,'zh-hk','紅磡'),(80,'en_us','East Tsim Sha Tsui '),(80,'zh-cn','尖东'),(80,'zh-hk','尖東'),(81,'en_us','Austin'),(81,'zh-cn','柯士甸'),(81,'zh-hk','柯士甸'),(82,'en_us','Nam Cheong'),(82,'zh-cn','南昌'),(82,'zh-hk','南昌'),(83,'en_us','Mei Foo'),(83,'zh-cn','美孚'),(83,'zh-hk','美孚'),(84,'en_us','Tsuen Wan West'),(84,'zh-cn','荃湾西'),(84,'zh-hk','荃灣西'),(85,'en_us','Kam Sheung Road'),(85,'zh-cn','锦上路'),(85,'zh-hk','錦上路'),(86,'en_us','Yuen Long'),(86,'zh-cn','元朗'),(86,'zh-hk','元朗'),(87,'en_us','Long Ping'),(87,'zh-cn','朗屏'),(87,'zh-hk','朗屏'),(88,'en_us','Tin Shui Wai'),(88,'zh-cn','天水围'),(88,'zh-hk','天水圍'),(89,'en_us','Siu Hong'),(89,'zh-cn','兆康'),(89,'zh-hk','兆康'),(90,'en_us','Tuen Mun'),(90,'zh-cn','屯门'),(90,'zh-hk','屯門'),(91,'en_us','Tung Chung '),(91,'zh-cn','东涌'),(91,'zh-hk','東湧'),(92,'en_us','Sunny Bay'),(92,'zh-cn','欣澳'),(92,'zh-hk','欣澳'),(93,'en_us','Tsing Yi '),(93,'zh-cn','青衣'),(93,'zh-hk','青衣'),(94,'en_us','Lai King '),(94,'zh-cn','荔景'),(94,'zh-hk','荔景'),(95,'en_us','Nam Cheong '),(95,'zh-cn','南昌'),(95,'zh-hk','南昌'),(96,'en_us','Olympic '),(96,'zh-cn','奥运'),(96,'zh-hk','奧運'),(97,'en_us','Kowloon '),(97,'zh-cn','九龙'),(97,'zh-hk','九龍'),(98,'en_us','Hong Kong '),(98,'zh-cn','香港'),(98,'zh-hk','香港'),(99,'en_us','Airport '),(99,'zh-cn','机场'),(99,'zh-hk','機場'),(100,'en_us','Tsing Yi '),(100,'zh-cn','青衣'),(100,'zh-hk','青衣'),(101,'en_us','Kowloon '),(101,'zh-cn','九龙'),(101,'zh-hk','九龍'),(102,'en_us','Hong Kong '),(102,'zh-cn','香港'),(102,'zh-hk','香港');
/*!40000 ALTER TABLE `dr_tb_subway_station_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:23
