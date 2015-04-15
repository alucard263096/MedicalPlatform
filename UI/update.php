<?php

  require 'include/common.inc.php';

  $sql="ALTER TABLE `medicalplatform`.`dr_tb_office_lang` 
ADD COLUMN `addressnav` VARCHAR(1000) NULL AFTER `open_hour`;
";
	$query = $dbmgr->query($sql);

  $sql="CREATE TABLE `medicalplatform`.`dr_tb_gene` (
  `id` INT NOT NULL,
  `code` VARCHAR(40) NOT NULL COMMENT '编码代码',
  `seq` VARCHAR(45) NOT NULL COMMENT '显示顺序',
  `service_introduce` TEXT NOT NULL COMMENT '服务介绍',
  `items` TEXT NOT NULL COMMENT '检测项目',
  `question` TEXT NOT NULL COMMENT '常见问题',
  `image` VARCHAR(200) NOT NULL,
  `image_1` VARCHAR(200) NOT NULL,
  `image_2` VARCHAR(200) NOT NULL,
  `image_3` VARCHAR(200) NOT NULL,
  `image_4` VARCHAR(200) NOT NULL,
  `used_group_id` VARCHAR(500) NOT NULL COMMENT '适用人群',
  `remarks` VARCHAR(200) NOT NULL,
  `price` INT NOT NULL,
  `status` VARCHAR(1) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `created_user` INT NOT NULL,
  `updated_date` DATETIME NOT NULL,
  `updated_user` INT NOT NULL,
  PRIMARY KEY (`id`))
COMMENT = '基因';
";
	$query = $dbmgr->query($sql);
	
	
  $sql="CREATE TABLE `medicalplatform`.`dr_tb_gene_lang` (
  `oid` INT NOT NULL,
  `lang` VARCHAR(45) NOT NULL,
  `name` VARCHAR(200) NOT NULL COMMENT '名称',
  `summary` VARCHAR(1000) NOT NULL COMMENT '简述',
  `propose` VARCHAR(1000) NOT NULL COMMENT '检测目的',
  `certification` VARCHAR(1000) NOT NULL COMMENT '专业认可',
  `advantage` VARCHAR(1000) NOT NULL COMMENT '检测好处',
  `process` VARCHAR(1000) NOT NULL COMMENT 'process',
  `used_group` VARCHAR(45) NOT NULL COMMENT 'used_group',
  PRIMARY KEY (`oid`, `lang`))
COMMENT = '基因多语言';

";
	$query = $dbmgr->query($sql);
?>