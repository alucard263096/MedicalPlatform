-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	6.0.11-alpha-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


USE portalsite_lm;

--
-- Dumping data for table `portalsite_lm`.`tb_access_right`
--



/*!40000 ALTER TABLE `tb_access_right` DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO `portalsite_lm`.`tb_access_right` (`right_id`,`name`,`seq`) VALUES 
  (2,'Edit',2);
INSERT INTO `portalsite_lm`.`tb_access_right` (`right_id`,`name`,`seq`) VALUES 
  (3,'Delete',3);
COMMIT;
/*!40000 ALTER TABLE `tb_access_right` ENABLE KEYS */;


--
-- Dumping data for table `portalsite_lm`.`tb_function`
--

/*!40000 ALTER TABLE `tb_function` DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (1,'内容管理','#',1,1,1,1,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (2,'一般内容','general.php',1,9,1,11,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (3,'下载中心','download.php',1,9,1,12,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (4,'新闻中心','news.php',1,9,1,13,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (5,'伙伴管理','#',5,1,1,14,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (6,'分区经理','manager.php',5,9,1,15,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (10,'供应商管理','partner.php',5,9,1,15,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (7,'日常管理','#',7,1,2,2,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (8,'网站管理','user.php',7,9,7,71,'A');
INSERT INTO `portalsite_lm`.`tb_function` (`function_id`,`function_name`,`function_link`,`parent_id`,`function_type`,`function_group`,`seq`,`status`) VALUES 
  (9,'用户管理','website.php',7,9,7,72,'A');
COMMIT;
/*!40000 ALTER TABLE `tb_function` ENABLE KEYS */;


--
-- Dumping data for table `portalsite_lm`.`tb_function_right`
--

/*!40000 ALTER TABLE `tb_function_right` DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (2,2,1);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (3,2,2);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (3,3,3);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (4,2,4);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (4,3,5);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (10,2,6);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (10,3,7);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (6,2,8);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (6,3,9);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (8,2,10);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (9,2,11);
INSERT INTO `portalsite_lm`.`tb_function_right` (`function_id`,`right_id`,`id`) VALUES 
  (9,3,12);
COMMIT;
/*!40000 ALTER TABLE `tb_function_right` ENABLE KEYS */;


--
-- Dumping data for table `portalsite_lm`.`tb_seq`
--

/*!40000 ALTER TABLE `tb_seq` DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO `portalsite_lm`.`tb_seq` (`table_name`,`curval`) VALUES 
  ('tb_user',42);
COMMIT;
/*!40000 ALTER TABLE `tb_seq` ENABLE KEYS */;


--
-- Dumping data for table `portalsite_lm`.`tb_user`
--

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO `portalsite_lm`.`tb_user` (`user_id`,`login_id`,`password`,`user_name`,`email`,`remarks`,`status`,`created_user`,`created_date`,`updated_user`,`updated_date`) VALUES 
  (1,'admin','e19d5cd5af0378da05f63f891c7467af','System Administrator','info@i4deas.com','','A',1,'2011-02-07 17:26:55',1,'2014-07-06 21:23:12');
COMMIT;
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;


--
-- Dumping data for table `portalsite_lm`.`tb_user_access_right`
--

/*!40000 ALTER TABLE `tb_user_access_right` DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,2,2,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,3,2,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,3,3,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,4,2,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,4,3,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,10,2,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,10,3,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,6,2,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,6,3,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,8,2,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,8,3,1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_access_right` ("user_id","function_id","right_id","created_user","created_date") VALUES 
  (1,9,2,1,'2014-07-06 21:23:12');
COMMIT;
/*!40000 ALTER TABLE `tb_user_access_right` ENABLE KEYS */;


--
-- Dumping data for table `portalsite_lm`.`tb_user_function`
--

/*!40000 ALTER TABLE `tb_user_function` DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO `portalsite_lm`.`tb_user_function` ("user_id","function_id","status","created_user","created_date") VALUES 
  (1,2,'A',1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_function` ("user_id","function_id","status","created_user","created_date") VALUES 
  (1,3,'A',1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_function` ("user_id","function_id","status","created_user","created_date") VALUES 
  (1,4,'A',1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_function` ("user_id","function_id","status","created_user","created_date") VALUES 
  (1,10,'A',1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_function` ("user_id","function_id","status","created_user","created_date") VALUES 
  (1,6,'A',1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_function` ("user_id","function_id","status","created_user","created_date") VALUES 
  (1,8,'A',1,'2014-07-06 21:23:12');
INSERT INTO `portalsite_lm`.`tb_user_function` ("user_id","function_id","status","created_user","created_date") VALUES 
  (1,9,'A',1,'2014-07-06 21:23:12');
COMMIT;
/*!40000 ALTER TABLE `tb_user_function` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
