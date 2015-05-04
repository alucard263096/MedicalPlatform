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
  `name` varchar(200) NOT NULL COMMENT '名称',
  `summary` varchar(1000) NOT NULL COMMENT '简述',
  `propose` varchar(1000) NOT NULL COMMENT '检测目的',
  `certification` varchar(1000) NOT NULL COMMENT '专业认可',
  `advantage` varchar(1000) NOT NULL COMMENT '检测好处',
  `process` varchar(1000) NOT NULL COMMENT 'process',
  `used_group` varchar(45) NOT NULL COMMENT 'used_group',
  PRIMARY KEY (`oid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基因多语言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_tb_gene_lang`
--

LOCK TABLES `dr_tb_gene_lang` WRITE;
/*!40000 ALTER TABLE `dr_tb_gene_lang` DISABLE KEYS */;
INSERT INTO `dr_tb_gene_lang` VALUES (1,'en-us','鍚嶇О','绠�杩�','妫�娴嬬洰鐨�','涓撲笟璁ゅ彲','妫�娴嬪ソ澶�','妫�娴嬫祦绋�','閫傜敤浜虹兢鏂囨湰'),(1,'zh-cn','鍚嶇О','绠�杩�','妫�娴嬬洰鐨�','涓撲笟璁ゅ彲','妫�娴嬪ソ澶�','妫�娴嬫祦绋�','閫傜敤浜虹兢鏂囨湰'),(1,'zh-hk','鍚嶇О','绠�杩�','妫�娴嬬洰鐨�','涓撲笟璁ゅ彲','妫�娴嬪ソ澶�','妫�娴嬫祦绋�','閫傜敤浜虹兢鏂囨湰'),(2,'en-us','Pre-Pregnancy DNA Test (saliva)','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.'),(2,'zh-cn','瀛曞墠DN鈥嬧�婣閬椾紶鐤剧梾妫�娴嬶紙鍞炬恫锛�','閫氳繃鍞炬恫妫�娴嬪か濡囩殑鍩哄洜缁勫悎锛屽垎鏋愪笅涓�浠ｆ偅閬椾紶鐤剧梾鐨勯闄�','1. 妫�娴嬪か濡囦簩浜烘垨鍏朵腑涓�鏂圭殑鍩哄洜缁勫悎锛屽強\n2. 鍒嗘瀽涓嬩竴浠ｅ彈鎸囧畾閬椾紶鐤剧梾褰卞搷鐨勬満浼�','DNA妫�娴嬬殑瀹為獙瀹や綅浜庣編鍥斤紝鎷ユ湁CAP鍜孋LIA鐨勮璇侊紝琚叕璁や负鏄笘鐣屼笂鏈�鍏堣繘銆佹渶鍙潬鐨勫疄楠屽銆傛澶栵紝瀹為獙瀹ゅ钩鍧囨瘡涓湀瀹屾垚浜嗘暟涓囩殑DNA娴嬭瘯锛屾墍绱Н鐨勭粡楠屽彲纭繚涓撳鍥㈤槦浜庣煭鏃堕棿鍐呭畬鎴愬熀鍥犳娴嬨�俓n\nDNA妫�娴嬮�夋嫨浣跨敤 Sequenom 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮�: SQNM锛夊厛杩涚殑Sequenom MassARRAY 妫�娴嬬郴缁燂紝鍙� Illumina 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮侊細ILMN锛夌殑鎶�鏈��','涓撲负姹夋棌鍗庝汉璁捐锛沑n閽堝鏈�鏅亶鐨勯仐浼犵柧鐥咃紱\n鏃犻』鎶借銆佹棤鍒涙�с�侀潪鍏ヤ镜鎬э紱\n绠�鍗曞揩鎹凤紱\n鍑嗙‘搴﹂珮浜�99%锛沑n鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ鎶ュ憡銆�','1. 缃戜笂璁㈣喘妫�娴嬪椁怽n2. 鎴戜滑浼氬皢閲囨牱宸ュ叿绠卞揩閫掔粰鎮╘n3. 鎸夊伐鍏风鐨勬寚绀烘敹闆嗗斁娑诧紝鐒跺悗瀵勫洖缁欐垜浠琝n4. 鍑烘娴嬫姤鍛婏紝鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ','鍑嗗鎬�瀛曠殑鐢峰コ'),(2,'zh-hk','瀛曞墠DNA閬哄偝鐤剧梾妾㈡脯锛堝斁娑诧級','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.'),(3,'en-us','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.'),(3,'zh-cn','鑽墿DNA妫�娴嬶紙鍞炬恫锛�','閫氳繃鍞炬恫妫�娴嬫偍瀵硅嵂鐗╃殑鐤楁晥鍙婂壇浣滅敤','浜嗚В鎮ㄧ殑韬綋瀵硅嵂鐗╃殑浠ｈ阿鍙嶅簲锛沑n鎵惧埌瀵规偍鏈�鏈夌枟鏁堢殑鑽搧锛沑n閬垮厤鏈嶉瀵规偍鏈夋綔鍦ㄥ壇浣滅敤鐨勮嵂鍝併�俓n','鐢辩編鍥紺AP鍙奀LIA璁ゅ彲鐨勪笓涓氬熀鍥犲疄楠屽杩涜锛屽苟鑾风編鍥介鍝佸拰鑽墿绠＄悊灞�(FDA)鎺ㄨ崘銆俓n\nDNA妫�娴嬬殑瀹為獙瀹や綅浜庣編鍥斤紝鎷ユ湁CAP鍜孋LIA鐨勮璇侊紝琚叕璁や负鏄笘鐣屼笂鏈�鍏堣繘銆佹渶鍙潬鐨勫疄楠屽銆傛澶栵紝瀹為獙瀹ゅ钩鍧囨瘡涓湀瀹屾垚浜嗘暟涓囩殑DNA娴嬭瘯锛屾墍绱Н鐨勭粡楠屽彲纭繚涓撳鍥㈤槦浜庣煭鏃堕棿鍐呭畬鎴愬熀鍥犳娴嬨�俓n\nDNA妫�娴嬮�夋嫨浣跨敤 Sequenom 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮�: SQNM锛夊厛杩涚殑Sequenom MassARRAY 妫�娴嬬郴缁燂紝鍙� Illumina 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮侊細ILMN锛夌殑鎶�鏈�俓n    ','鏃犻』鎶借銆佹棤鍒涙�с�侀潪鍏ヤ镜鎬э紱\n绠�鍗曞揩鎹凤紱\n鍑嗙‘搴﹂珮浜�99%锛沑n鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ鎶ュ憡銆�','1. 缃戜笂璁㈣喘妫�娴嬪椁怽n2. 鎴戜滑浼氬皢閲囨牱宸ュ叿绠卞揩閫掔粰鎮╘n3. 鎸夊伐鍏风鐨勬寚绀烘敹闆嗗斁娑诧紝鐒跺悗瀵勫洖缁欐垜浠琝n4. 鍑烘娴嬫姤鍛婏紝鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ','浠讳綍浜猴紝灏ゅ叾鏄參鎬х梾鎮ｈ�呮垨闇�瑕侀暱鏈熸湇椋熻嵂鐗╀汉澹�'),(3,'zh-hk','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.','n.a.'),(4,'en-us','閬椾紶鎬х檶鐥嘍NA妫�娴嬶紙鍞炬恫锛�','閫氳繃鍞炬恫妫�娴嬪熀鍥犲彉寮傦紝浜嗚В鍝簺鐧岀棁鐨勯闄╀細澧炲姞','妫�娴嬫偍鐨勫熀鍥犲彉寮傦紱\n鍒嗘瀽鍝簺鐧岀棁鐨勫彂鐥呯巼浼氬鍔犮��','DNA妫�娴嬬殑瀹為獙瀹や綅浜庣編鍥斤紝鎷ユ湁CAP鍜孋LIA鐨勮璇侊紝琚叕璁や负鏄笘鐣屼笂鏈�鍏堣繘銆佹渶鍙潬鐨勫疄楠屽銆傛澶栵紝瀹為獙瀹ゅ钩鍧囨瘡涓湀瀹屾垚浜嗘暟涓囩殑DNA娴嬭瘯锛屾墍绱Н鐨勭粡楠屽彲纭繚涓撳鍥㈤槦浜庣煭鏃堕棿鍐呭畬鎴愬熀鍥犳娴嬨�俓n\nDNA妫�娴嬮�夋嫨浣跨敤 Sequenom 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮�: SQNM锛夊厛杩涚殑Sequenom MassARRAY 妫�娴嬬郴缁燂紝鍙� Illumina 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮侊細ILMN锛夌殑鎶�鏈��','鏃犻』鎶借銆佹棤鍒涙�с�侀潪鍏ヤ镜鎬э紱\n绠�鍗曞揩鎹凤紱\n鍑嗙‘搴﹂珮浜�99%锛沑n鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ鎶ュ憡銆�','1. 缃戜笂璁㈣喘妫�娴嬪椁怽n2. 鎴戜滑浼氬皢閲囨牱宸ュ叿绠卞揩閫掔粰鎮╘n3. 鎸夊伐鍏风鐨勬寚绀烘敹闆嗗斁娑诧紝鐒跺悗瀵勫洖缁欐垜浠琝n4. 鍑烘娴嬫姤鍛婏紝鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ','浠讳綍浜猴紝灏ゅ叾鏄鏃忓唴鏈夌檶鐥囬仐浼犲彶鐨勪汉澹�'),(4,'zh-cn','閬椾紶鎬х檶鐥嘍NA妫�娴嬶紙鍞炬恫锛�','閫氳繃鍞炬恫妫�娴嬪熀鍥犲彉寮傦紝浜嗚В鍝簺鐧岀棁鐨勯闄╀細澧炲姞','妫�娴嬫偍鐨勫熀鍥犲彉寮傦紱\n鍒嗘瀽鍝簺鐧岀棁鐨勫彂鐥呯巼浼氬鍔犮��','DNA妫�娴嬬殑瀹為獙瀹や綅浜庣編鍥斤紝鎷ユ湁CAP鍜孋LIA鐨勮璇侊紝琚叕璁や负鏄笘鐣屼笂鏈�鍏堣繘銆佹渶鍙潬鐨勫疄楠屽銆傛澶栵紝瀹為獙瀹ゅ钩鍧囨瘡涓湀瀹屾垚浜嗘暟涓囩殑DNA娴嬭瘯锛屾墍绱Н鐨勭粡楠屽彲纭繚涓撳鍥㈤槦浜庣煭鏃堕棿鍐呭畬鎴愬熀鍥犳娴嬨�俓n\nDNA妫�娴嬮�夋嫨浣跨敤 Sequenom 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮�: SQNM锛夊厛杩涚殑Sequenom MassARRAY 妫�娴嬬郴缁燂紝鍙� Illumina 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮侊細ILMN锛夌殑鎶�鏈��','鏃犻』鎶借銆佹棤鍒涙�с�侀潪鍏ヤ镜鎬э紱\n绠�鍗曞揩鎹凤紱\n鍑嗙‘搴﹂珮浜�99%锛沑n鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ鎶ュ憡銆�','1. 缃戜笂璁㈣喘妫�娴嬪椁怽n2. 鎴戜滑浼氬皢閲囨牱宸ュ叿绠卞揩閫掔粰鎮╘n3. 鎸夊伐鍏风鐨勬寚绀烘敹闆嗗斁娑诧紝鐒跺悗瀵勫洖缁欐垜浠琝n4. 鍑烘娴嬫姤鍛婏紝鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ','浠讳綍浜猴紝灏ゅ叾鏄鏃忓唴鏈夌檶鐥囬仐浼犲彶鐨勪汉澹�'),(4,'zh-hk','閬椾紶鎬х檶鐥嘍NA妫�娴嬶紙鍞炬恫锛�','閫氳繃鍞炬恫妫�娴嬪熀鍥犲彉寮傦紝浜嗚В鍝簺鐧岀棁鐨勯闄╀細澧炲姞','妫�娴嬫偍鐨勫熀鍥犲彉寮傦紱\n鍒嗘瀽鍝簺鐧岀棁鐨勫彂鐥呯巼浼氬鍔犮��','DNA妫�娴嬬殑瀹為獙瀹や綅浜庣編鍥斤紝鎷ユ湁CAP鍜孋LIA鐨勮璇侊紝琚叕璁や负鏄笘鐣屼笂鏈�鍏堣繘銆佹渶鍙潬鐨勫疄楠屽銆傛澶栵紝瀹為獙瀹ゅ钩鍧囨瘡涓湀瀹屾垚浜嗘暟涓囩殑DNA娴嬭瘯锛屾墍绱Н鐨勭粡楠屽彲纭繚涓撳鍥㈤槦浜庣煭鏃堕棿鍐呭畬鎴愬熀鍥犳娴嬨�俓n\nDNA妫�娴嬮�夋嫨浣跨敤 Sequenom 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮�: SQNM锛夊厛杩涚殑Sequenom MassARRAY 妫�娴嬬郴缁燂紝鍙� Illumina 鍏徃锛堢撼鏂揪鍏嬭偂绁ㄤ唬鐮侊細ILMN锛夌殑鎶�鏈��','鏃犻』鎶借銆佹棤鍒涙�с�侀潪鍏ヤ镜鎬э紱\n绠�鍗曞揩鎹凤紱\n鍑嗙‘搴﹂珮浜�99%锛沑n鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ鎶ュ憡銆�','1. 缃戜笂璁㈣喘妫�娴嬪椁怽n2. 鎴戜滑浼氬皢閲囨牱宸ュ叿绠卞揩閫掔粰鎮╘n3. 鎸夊伐鍏风鐨勬寚绀烘敹闆嗗斁娑诧紝鐒跺悗瀵勫洖缁欐垜浠琝n4. 鍑烘娴嬫姤鍛婏紝鐢变笓涓氱殑棣欐腐鍖荤敓涓烘偍瑙ｈ','浠讳綍浜猴紝灏ゅ叾鏄鏃忓唴鏈夌檶鐥囬仐浼犲彶鐨勪汉澹�');
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
