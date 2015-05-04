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
-- Table structure for table `dr_tb_gene_lang`
--

DROP TABLE IF EXISTS `dr_tb_gene_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_gene_lang` (
  `oid` int(11) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `name` varchar(200) NOT NULL COMMENT '����',
  `summary` varchar(1000) NOT NULL COMMENT '����',
  `propose` varchar(1000) NOT NULL COMMENT '���Ŀ��',
  `certification` varchar(1000) NOT NULL COMMENT 'רҵ�Ͽ�',
  `advantage` varchar(1000) NOT NULL COMMENT '���ô�',
  `process` varchar(1000) NOT NULL COMMENT 'process',
  `used_group` varchar(45) NOT NULL COMMENT 'used_group',
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_gene_lang`
--

LOCK TABLES `dr_tb_gene_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_gene_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_gene_lang` VALUES (1,'en-us','名称','简述','检测目的','专业认可','检测好处','检测流程','适用人群文本'),(1,'zh-cn','名称','简述','检测目的','专业认可','检测好处','检测流程','适用人群文本'),(1,'zh-hk','名称','简述','检测目的','专业认可','检测好处','检测流程','适用人群文本'),(2,'en-us','Pre-Pregnancy DNA Test (saliva)','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.'),(2,'zh-cn','孕前DN​​A遗传疾病检测（唾液）','通过唾液检测夫妇的基因组合，分析下一代患遗传疾病的风险','1. 检测夫妇二人或其中一方的基因组合，及\n2. 分析下一代受指定遗传疾病影响的机会','DNA检测的实验室位于美国，拥有CAP和CLIA的认证，被公认为是世界上最先进、最可靠的实验室。此外，实验室平均每个月完成了数万的DNA测试，所累积的经验可确保专家团队于短时间内完成基因检测。\n\nDNA检测选择使用 Sequenom 公司（纳斯达克股票代码: SQNM）先进的Sequenom MassARRAY 检测系统，及 Illumina 公司（纳斯达克股票代码：ILMN）的技术。','专为汉族华人设计；\n针对最普遍的遗传疾病；\n无须抽血、无创性、非入侵性；\n简单快捷；\n准确度高于99%；\n由专业的香港医生为您解读报告。','1. 网上订购检测套餐\n2. 我们会将采样工具箱快递给您\n3. 按工具箱的指示收集唾液，然后寄回给我们\n4. 出检测报告，由专业的香港医生为您解读','准备怀孕的男女'),(2,'zh-hk','孕前DNA遺傳疾病檢測（唾液）','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.'),(3,'en-us','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.'),(3,'zh-cn','药物DNA检测（唾液）','通过唾液检测您对药物的疗效及副作用','了解您的身体对药物的代谢反应；\n找到对您最有疗效的药品；\n避免服食对您有潜在副作用的药品。\n','由美国CAP及CLIA认可的专业基因实验室进行，并获美国食品和药物管理局(FDA)推荐。\n\nDNA检测的实验室位于美国，拥有CAP和CLIA的认证，被公认为是世界上最先进、最可靠的实验室。此外，实验室平均每个月完成了数万的DNA测试，所累积的经验可确保专家团队于短时间内完成基因检测。\n\nDNA检测选择使用 Sequenom 公司（纳斯达克股票代码: SQNM）先进的Sequenom MassARRAY 检测系统，及 Illumina 公司（纳斯达克股票代码：ILMN）的技术。\n    ','无须抽血、无创性、非入侵性；\n简单快捷；\n准确度高于99%；\n由专业的香港医生为您解读报告。','1. 网上订购检测套餐\n2. 我们会将采样工具箱快递给您\n3. 按工具箱的指示收集唾液，然后寄回给我们\n4. 出检测报告，由专业的香港医生为您解读','任何人，尤其是慢性病患者或需要长期服食药物人士'),(3,'zh-hk','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.'),(4,'en-us','遗传性癌症DNA检测（唾液）','通过唾液检测基因变异，了解哪些癌症的风险会增加','检测您的基因变异；\n分析哪些癌症的发病率会增加。','DNA检测的实验室位于美国，拥有CAP和CLIA的认证，被公认为是世界上最先进、最可靠的实验室。此外，实验室平均每个月完成了数万的DNA测试，所累积的经验可确保专家团队于短时间内完成基因检测。\n\nDNA检测选择使用 Sequenom 公司（纳斯达克股票代码: SQNM）先进的Sequenom MassARRAY 检测系统，及 Illumina 公司（纳斯达克股票代码：ILMN）的技术。','无须抽血、无创性、非入侵性；\n简单快捷；\n准确度高于99%；\n由专业的香港医生为您解读报告。','1. 网上订购检测套餐\n2. 我们会将采样工具箱快递给您\n3. 按工具箱的指示收集唾液，然后寄回给我们\n4. 出检测报告，由专业的香港医生为您解读','任何人，尤其是家族内有癌症遗传史的人士'),(4,'zh-cn','遗传性癌症DNA检测（唾液）','通过唾液检测基因变异，了解哪些癌症的风险会增加','检测您的基因变异；\n分析哪些癌症的发病率会增加。','DNA检测的实验室位于美国，拥有CAP和CLIA的认证，被公认为是世界上最先进、最可靠的实验室。此外，实验室平均每个月完成了数万的DNA测试，所累积的经验可确保专家团队于短时间内完成基因检测。\n\nDNA检测选择使用 Sequenom 公司（纳斯达克股票代码: SQNM）先进的Sequenom MassARRAY 检测系统，及 Illumina 公司（纳斯达克股票代码：ILMN）的技术。','无须抽血、无创性、非入侵性；\n简单快捷；\n准确度高于99%；\n由专业的香港医生为您解读报告。','1. 网上订购检测套餐\n2. 我们会将采样工具箱快递给您\n3. 按工具箱的指示收集唾液，然后寄回给我们\n4. 出检测报告，由专业的香港医生为您解读','任何人，尤其是家族内有癌症遗传史的人士'),(4,'zh-hk','遗传性癌症DNA检测（唾液）','通过唾液检测基因变异，了解哪些癌症的风险会增加','检测您的基因变异；\n分析哪些癌症的发病率会增加。','DNA检测的实验室位于美国，拥有CAP和CLIA的认证，被公认为是世界上最先进、最可靠的实验室。此外，实验室平均每个月完成了数万的DNA测试，所累积的经验可确保专家团队于短时间内完成基因检测。\n\nDNA检测选择使用 Sequenom 公司（纳斯达克股票代码: SQNM）先进的Sequenom MassARRAY 检测系统，及 Illumina 公司（纳斯达克股票代码：ILMN）的技术。','无须抽血、无创性、非入侵性；\n简单快捷；\n准确度高于99%；\n由专业的香港医生为您解读报告。','1. 网上订购检测套餐\n2. 我们会将采样工具箱快递给您\n3. 按工具箱的指示收集唾液，然后寄回给我们\n4. 出检测报告，由专业的香港医生为您解读','任何人，尤其是家族内有癌症遗传史的人士');
/*!40000 ALTER TABLE `dr_tb_gene_lang` ENABLE KEYS */;
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
