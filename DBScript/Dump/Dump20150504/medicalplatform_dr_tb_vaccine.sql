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
-- Table structure for table `dr_tb_vaccine`
--

DROP TABLE IF EXISTS `dr_tb_vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_tb_vaccine` (
  `id` int(11) NOT NULL COMMENT '主键',
  `code` varchar(45) NOT NULL COMMENT '疫苗编号',
  `effect_list` varchar(300) NOT NULL COMMENT '功效',
  `image` varchar(145) NOT NULL,
  `seq` varchar(10) NOT NULL DEFAULT '0',
  `used_group_id` varchar(1000) NOT NULL COMMENT '适用人群',
  `is_hk_project` varchar(1) NOT NULL COMMENT '是否为香港计划内疫苗',
  `is_china_project` varchar(1) NOT NULL COMMENT '是否为中国计划内疫苗',
  `content` text NOT NULL,
  `remarks` varchar(500) NOT NULL COMMENT '备注',
  `status` varchar(1) NOT NULL COMMENT '状态A,I,D',
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `image_1` varchar(145) DEFAULT NULL,
  `image_2` varchar(145) DEFAULT NULL,
  `image_3` varchar(145) DEFAULT NULL,
  `image_4` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疫苗';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_vaccine`
--

LOCK TABLES `dr_tb_vaccine` WRITE;
/*!40000 ALTER TABLE `dr_tb_vaccine` DISABLE KEYS */;
INSERT INTO `dr_tb_vaccine` VALUES (1,'VA01','1','15032609058hpv.jpg','1','4','N','N','<p><span style=\"font-size:14px;\">HPV子宫颈癌疫苗是经美国食品及药物管理局(FDA)、欧盟及香港卫生署认可的一 种预防性疫苗，覆盖4种HPV病毒(HPV 6、11、16、18)，有助预防子宫颈癌、外阴癌、阴道癌和生殖器官湿疣。该疫苗已经过全球多个应用于妇女的临床研究，于全球逾 120 个国家或地区注册使用，并已注射逾2亿剂。</span></p>\n\n<p><span style=\"font-size:14px;\">HPV子宫颈癌疫苗适合9-45岁女性及9-26岁男性。接种年龄越年轻或在初次性接触之前接种，效果会更好。该疫苗已通过大规模临床测试，不会影响发育及经期。</span></p>\n\n<p><span style=\"font-size:14px;\">接种疫苗前一般不需作任何检查。</span></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:14px;\"><u><strong>两种主要子宫颈癌疫苗对比</strong></u></span></p>\n\n<table align=\"left\" border=\"1\" cellpadding=\"5\" cellspacing=\"0\" height=\"412\" style=\"border-collapse:collapse;\" width=\"100%\">\n	<tbody>\n		<tr>\n			<td style=\"width:84px;height:50px;\">\n			<p align=\"center\"><strong>疫苗名称</strong></p>\n			</td>\n			<td style=\"width:219px;height:50px;\">\n			<p align=\"center\"><strong>加卫苗</strong><strong> Gardasil<br />\n			(</strong><strong>HPV 子宫颈癌4</strong><strong>合</strong><strong>1疫苗)</strong></p>\n			</td>\n			<td style=\"width:236px;height:50px;\">\n			<p align=\"center\"><strong>卉妍康</strong><strong> Cervarix<br />\n			(</strong><strong>HPV 子宫颈癌2</strong><strong>合</strong><strong>1疫苗)</strong></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:84px;height:25px;\">\n			<p align=\"center\"><strong>药厂</strong></p>\n			</td>\n			<td style=\"width:219px;height:25px;\">\n			<p align=\"center\">美国默沙东</p>\n			</td>\n			<td style=\"width:236px;height:25px;\">\n			<p align=\"center\">英国葛兰素史克 (GSK)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:84px;height:25px;\">\n			<p align=\"center\"><strong>独具配方</strong></p>\n			</td>\n			<td style=\"width:219px;height:25px;\">\n			<p align=\"center\">AAHS</p>\n			</td>\n			<td style=\"width:236px;height:25px;\">\n			<p align=\"center\">ASO4 免疫力加强剂</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:84px;height:60px;\">\n			<p align=\"center\"><strong>预防</strong><strong>HPV</strong><br />\n			<strong>类型</strong></p>\n			</td>\n			<td style=\"width:219px;height:60px;\">\n			<p align=\"left\">&bull; HPV 16/18 型号 (高危致癌型)<br />\n			&bull; HPV 6/11 型号 (低危致癌型)</p>\n			</td>\n			<td style=\"width:236px;height:60px;\">\n			<p align=\"left\">&bull; HPV 16/18 型号 (高危致癌型)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:84px;height:90px;\">\n			<p align=\"center\"><strong>功效</strong></p>\n			</td>\n			<td style=\"width:219px;height:90px;\">\n			<p align=\"left\">&bull; 预防高危致癌的 HPV 16/18 型号，可减低 70% 患子宫颈癌的风险<br />\n			<br />\n			&bull; 减低引致生殖器官湿疣的HPV 6/11 型的感染，可减低超过 90% 患生殖器官湿疣的风险</p>\n			</td>\n			<td style=\"width:236px;height:90px;\">\n			<p align=\"left\">&bull; 100% 预防高危致癌的 HPV 16/18 型号，可减低 70% 患子宫颈癌的风险</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:14px;\"><u><strong>什么是子宫颈癌</strong></u></span></p>\n\n<p><span style=\"font-size:14px;\">子宫颈癌是一种影响子宫颈的恶性肿瘤。它是一种侵袭性的肿瘤，能从子宫颈的表面侵入到较深入的组织，并传至毗连的器官 (例如阴道、神经、骨盆和肾)，最后扩散到较远的器官，例如肝脏、肺和脑。</span></p>\n\n<p><span style=\"font-size:14px;\">子宫颈癌并非通过遗传而感染。感染人类乳头瘤病毒 (HPV) 是导致子宫颈癌的主要原因。不论男女，感染HPV的情况极之普遍，由初次性接触开始，风险已经存在。但HPV并非只靠性交传播，单单生殖器部位的皮肤接触已可传染。</span></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:14px;\"><u><strong>子宫颈癌的发病率</strong></u></span></p>\n\n<p><span style=\"font-size:14px;\">子宫颈癌发病率的排名为全球女性癌症第二位，仅次于乳癌。世界卫生组织统计数据显示，每年均诊断出约 50万个子宫颈癌新案例，并约有 23万多位女性死于子宫颈癌。也就是说，每一分钟就有一位女性诊断患上子宫颈癌，每两分钟就有一位女性死于这种癌症。<strong>近 20 年来，中国</strong><strong>子</strong><strong>宫颈癌的发病率和死亡率持续上升。目前子宫颈癌在中国的发病率已高居世界第二位，仅次于智利，且发病年轻化趋势明显。</strong></span></p>\n\n<p>&nbsp;</p>\n','','A','2015-03-23 23:23:42',4,'2015-04-11 18:33:09',4,'1503260904815032423030b.jpg','1503251700115032423032banner2.jpg','',''),(2,'VA02','2','','3','3','N','N','','','A','2015-03-23 23:23:42',4,'2015-04-10 14:44:57',1,'','','',''),(3,'VA03','3','150326100131-1501151R602400qq.jpg','2','2','N','N','<p><span style=\"font-size:14px;\">带状疱疹（生蛇）是一种令人痛楚而呈带状的红疹，并带有水泡。&ldquo;生蛇&rdquo;是由水痘病毒引起的疾病。水痘愈合后, 病毒会潜伏人体神经， 处于休眠状态，日后随着年龄渐长，免疫力下降, 压力大及休息不足，病毒会再度活跃，引至&ldquo;生蛇&rdquo;。&ldquo;生蛇&rdquo;的后果可以非常严重, 如果病毒进入眼睛或耳朵, 甚至有机会引致眼盲或耳聋。</span></p>\n\n<p><span style=\"font-size:14px;\">美国食物及药物管理局部(FDA)于2006年开始批准美国国民接种预防&ldquo;生蛇&rdquo;疫苗。这疫苗于近年已正式在香港注册使用, 适用于50岁以上男女人士接种(只需接种一针)。疫苗除了在曾感染水痘病者但未患&ldquo;生蛇&rdquo;人士身上有效外，对于曾经&ldquo;生蛇&rdquo;的人士也能降低复发的痛感和病发的时间长度。</span></p>\n\n<p><span style=\"font-size:14px;\">全世界&ldquo;生蛇&rdquo;的发病率从每年每1000人1.2至3.4例迅速增加至3.9至11.8例，且多发于年龄大于65岁的老人。因此建议50岁以上老人都注射。</span></p>\n\n<p>&nbsp;</p>\n','','A','2015-03-23 23:23:42',4,'2015-04-10 14:57:44',1,'1503261003115032423015banner3.jpg','1503261001515032423015banner3.jpg','',''),(4,'VA04','4','15042000056yinger.jpg','4','1','Y','N','<p><span style=\"font-size:14px;\"><strong>13价肺炎球菌疫苗是目前世界上保护率最高的肺炎球菌疫苗</strong>，被83个国家儿童疫苗计划所采用。它是7价肺炎疫苗的升级版，比国内市场上的7价、10价及23价疫苗更具保护作用，适合2-17岁幼儿和青少年及50以上男女。该疫苗属于香港儿童免疫接种计划范围内。</span></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:14px;\"><u><strong>什么是肺炎球菌</strong></u></span></p>\n\n<p><span style=\"font-size:14px;\">肺 炎球菌感染是由肺炎链球菌（肺炎球菌）引致的疾病。此细菌有超过90种血清型。肺炎球菌是引致中耳炎和肺炎的常见病原体。此细菌亦可引致侵入性肺炎球菌感 染，如入侵脑膜 (引致脑膜炎) 和血液 (引致败血病)，导致严重甚至致命的疾病。肺炎球菌主要经患者咳嗽和打喷嚏而产生的飞沫，或与患者亲密接触和触摸被这细菌污染的对象而传播。</span></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:14px;\"><u><strong>对比国内的23价疫苗及香港的13价疫苗</strong></u></span></p>\n\n<table align=\"left\" border=\"1\" cellpadding=\"5\" cellspacing=\"0\" height=\"532\" style=\"border-collapse:collapse;\" width=\"479\">\n	<tbody>\n		<tr>\n			<td style=\"width:73px;height:15px;\">\n			<p>&nbsp;</p>\n			</td>\n			<td style=\"width:295px;height:15px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>13价肺炎球菌</strong></span><span style=\"font-size:12px;\"><strong>疫苗</strong><br />\n			（香港疫苗）</span></p>\n			</td>\n			<td style=\"width:263px;height:15px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>23 价肺炎球菌疫苗</strong><br />\n			（国内疫苗）</span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:73px;height:35px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>适合年龄</strong></span></p>\n			</td>\n			<td style=\"width:295px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">新生婴儿</span></p>\n\n			<p align=\"left\"><span style=\"font-size:12px;\">幼儿及青少年︰2岁至17岁及<br />\n			成人︰50岁或以上</span></p>\n			</td>\n			<td style=\"width:263px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">2岁或以上高风险人士<br />\n			(不适合 50 岁以下非高危人士接种)</span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:73px;height:35px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>血清型数目</strong></span></p>\n			</td>\n			<td style=\"width:295px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">13 种<br />\n			(可覆盖抗药性血清型6A及19A)</span></p>\n			</td>\n			<td style=\"width:263px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">23 种<br />\n			(不覆盖血清型6A)</span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:73px;height:35px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>接种针数</strong></span></p>\n			</td>\n			<td style=\"width:295px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">新生婴儿：共四针<br />\n			2-17岁小童：只须一针<br />\n			50岁或以上人士：只须一针</span></p>\n			</td>\n			<td style=\"width:263px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">高危人士接种第一针后需在 5 年后补种第二针<br />\n			65 岁以上人士只需接种一针</span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:73px;height:105px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>特点</strong></span></p>\n			</td>\n			<td style=\"width:295px;height:105px;\">\n			<p><span style=\"font-size:12px;\">结合疫苗技术能促成免疫记忆，提供长效保护</span></p>\n\n			<p><span style=\"font-size:12px;\">曾接种7价或10价肺炎球菌疫苗人士，可补种一针13价，以获得更广泛的保护</span></p>\n\n			<p><span style=\"font-size:12px;\">被83个国家儿童疫苗计划所采用</span></p>\n			</td>\n			<td style=\"width:263px;height:105px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">药效时间短</span></p>\n\n			<p align=\"left\"><span style=\"font-size:12px;\">2﹣50岁以下非高危人士并不建议接种</span></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<div style=\"clear:both;\">&nbsp;</div>\n','','A','2015-03-23 23:23:42',4,'2015-04-20 01:28:36',3,'15042001020yingeryimiao.jpg','15042001004yingeryimiao.jpg','15042001029yingeryimiao.jpg',''),(5,'VA05','4','1504200001613bu.jpg','5','4','N','N','<p><span style=\"font-size:14px;\"><strong>13价肺炎球菌疫苗是目前世界上保护率最高的肺炎球菌疫苗</strong>，被83个国家儿童疫苗计划所采用。它是7价肺炎疫苗的升级版，比国内市场上的7价、10价及23价疫苗更具保护作用，适合2-17岁幼儿和青少年及50以上男女。该疫苗属于香港儿童免疫接种计划范围内。</span></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:14px;\"><u><strong>什么是肺炎球菌</strong></u></span></p>\n\n<p><span style=\"font-size:14px;\">肺炎球菌感染是由肺炎链球菌（肺炎球菌）引致的疾病。此细菌有超过90种血清型。肺炎球菌是引致中耳炎和肺炎的常见病原体。此细菌亦可引致侵入性肺炎球菌感染，如入侵脑膜 (引致脑膜炎) 和血液 (引致败血病)，导致严重甚至致命的疾病。肺炎球菌主要经患者咳嗽和打喷嚏而产生的飞沫，或与患者亲密接触和触摸被这细菌污染的对象而传播。</span></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:14px;\"><u><strong>对比国内的23价疫苗及香港的13价疫苗</strong></u></span></p>\n\n<table align=\"left\" border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" height=\"532\" style=\"border-collapse:collapse;\" width=\"479\">\n	<tbody>\n		<tr>\n			<td style=\"width:73px;height:15px;\">\n			<p>&nbsp;</p>\n			</td>\n			<td style=\"width:295px;height:15px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>13价肺炎球菌</strong></span><span style=\"font-size:12px;\"><strong>疫苗</strong><br />\n			（香港疫苗）</span></p>\n			</td>\n			<td style=\"width:263px;height:15px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>23 价肺炎球菌疫苗</strong><br />\n			（国内疫苗）</span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:73px;height:35px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>适合年龄</strong></span></p>\n			</td>\n			<td style=\"width:295px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">新生婴儿</span></p>\n\n			<p align=\"left\"><span style=\"font-size:12px;\">幼儿及青少年︰2岁至17岁及<br />\n			成人︰50岁或以上</span></p>\n			</td>\n			<td style=\"width:263px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">2岁或以上高风险人士<br />\n			(不适合 50 岁以下非高危人士接种)</span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:73px;height:35px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>血清型数目</strong></span></p>\n			</td>\n			<td style=\"width:295px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">13 种<br />\n			(可覆盖抗药性血清型6A及19A)</span></p>\n			</td>\n			<td style=\"width:263px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">23 种<br />\n			(不覆盖血清型6A)</span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:73px;height:35px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>接种针数</strong></span></p>\n			</td>\n			<td style=\"width:295px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">新生婴儿：共四针<br />\n			2-17岁小童：只须一针<br />\n			50岁或以上人士：只须一针</span></p>\n			</td>\n			<td style=\"width:263px;height:35px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">高危人士接种第一针后需在 5 年后补种第二针<br />\n			65 岁以上人士只需接种一针</span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:73px;height:105px;\">\n			<p align=\"center\"><span style=\"font-size:12px;\"><strong>特点</strong></span></p>\n			</td>\n			<td style=\"width:295px;height:105px;\">\n			<p><span style=\"font-size:12px;\">结合疫苗技术能促成免疫记忆，提供长效保护</span></p>\n\n			<p><span style=\"font-size:12px;\">曾接种7价或10价肺炎球菌疫苗人士，可补种一针13价，以获得更广泛的保护</span></p>\n\n			<p><span style=\"font-size:12px;\">被83个国家儿童疫苗计划所采用<span id=\"cke_bm_158E\" style=\"display: none;\">&nbsp;</span></span></p>\n			</td>\n			<td style=\"width:263px;height:105px;\">\n			<p align=\"left\"><span style=\"font-size:12px;\">药效时间短</span></p>\n\n			<p align=\"left\"><span style=\"font-size:12px;\">2﹣50岁以下非高危人士并不建议接种</span></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<div style=\"clear:both;\">&nbsp;</div>\n','','A','2015-03-23 23:23:42',4,'2015-04-20 00:57:59',3,'1504200005213jiabuzhong.jpg','150410140481503250005913jiabuzhong.jpg','','');
/*!40000 ALTER TABLE `dr_tb_vaccine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 22:53:30
