<?php
/*
 * Created on 2011-4-10
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
  require '../include/common.inc.php';
  /*
  $query=$dbmgr->query("select function_id,function_name from tb_function");
  $result = $dbmgr->fetch_array_all($query); 
  print_r($result);
 */
 
 
 $array=array();
 
 
 $sql="


SET FOREIGN_KEY_CHECKS=0;



CREATE TABLE `tb_access_right` (
  `right_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `seq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_city` (
  `serialId` int(11) NOT NULL,
  `cityId` varchar(20) DEFAULT NULL,
  `cityName` varchar(20) DEFAULT NULL,
  `cityUpId` varchar(20) DEFAULT NULL,
  `cityUpIdNum` int(11) DEFAULT NULL,
  `cityPath` varchar(100) DEFAULT NULL,
  `cityType` varchar(20) DEFAULT NULL,
  `cityTypeNum` int(11) DEFAULT NULL,
  `shortName` varchar(11) DEFAULT NULL,
  `spell` varchar(11) DEFAULT NULL,
  `areaId` varchar(11) DEFAULT NULL,
  `postCode` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`serialId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_download_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `seq` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_download_file` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `length` int(11) NOT NULL,
  `seq` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_function` (
  `function_id` int(11) NOT NULL,
  `function_name` varchar(50) NOT NULL,
  `function_link` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `function_type` int(11) NOT NULL,
  `function_group` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_function_right` (
  `function_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;



CREATE TABLE `tb_general` (
  `id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `content` text,
  `updated_user` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_manager` (
  `id` int(11) NOT NULL,
  `chname` varchar(200) NOT NULL,
  `engname` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `tel` varchar(200) NOT NULL,
  `qq` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `provinces` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `status` char(1) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `published_date` date NOT NULL,
  `content` text,
  `viewcount` int(11) DEFAULT '0',
  `status` char(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_partner` (
  `id` int(11) NOT NULL,
  `type` char(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `logo_file` varchar(200) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `contacter` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city_id` int(11) NOT NULL,
  `coordinate` varchar(100) NOT NULL,
  `website` varchar(255) NOT NULL,
  `weixin` varchar(255) NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `content` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `status` char(1) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_partner_type` (
  `code` char(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_province` (
  `serialId` int(11) NOT NULL,
  `provinceId` varchar(20) DEFAULT NULL,
  `provinceName` varchar(20) DEFAULT NULL,
  `provinceUpId` varchar(20) DEFAULT NULL,
  `provinceUpIdNum` int(11) DEFAULT NULL,
  `provincePath` varchar(100) DEFAULT NULL,
  `provinceType` varchar(20) DEFAULT NULL,
  `provinceTypeNum` int(11) DEFAULT NULL,
  `shortName` varchar(11) DEFAULT NULL,
  `spell` varchar(20) DEFAULT NULL,
  `areaId` varchar(11) DEFAULT NULL,
  `postCode` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`serialId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_seq` (
  `table_name` varchar(50) NOT NULL,
  `curval` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL,
  `login_id` varchar(12) NOT NULL,
  `password` varchar(32) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_user` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_user_access_right` (
  `user_id` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_user_function` (
  `user_id` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_website_base` (
  `website_name` varchar(200) DEFAULT NULL,
  `favfile` varchar(200) DEFAULT NULL,
  `contacter` varchar(200) DEFAULT NULL,
  `qq` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `seo_title` varchar(200) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `seo_description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=1;
 
";
 
 
 $sa=explode(";",$sql);
 $dbmgr->begin_trans();
 foreach ($sa as $value){
 	if(trim($value)!=""){
 		$query=$dbmgr->query($value);
 	}
 }
 $dbmgr->commit_trans();
 
// for($i=0;$i<count($array);$i++)
// {
// 	$id=$array[$i]["id"];
// 	$name=$array[$i]["name"];
// 	$position=$array[$i]["position"];
// 
// 	$sql="update tb_general set name='$name',position='$position'" .
// 			" where id=$id";
// 
//    
// 
// }
// 
 
 
?>