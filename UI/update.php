<?php

  require 'include/common.inc.php';

  $sql="ALTER TABLE `medicalplatform`.`dr_tb_office_lang` 
ADD COLUMN `addressnav` VARCHAR(1000) NULL AFTER `open_hour`;
";
	$query = $dbmgr->query($sql);

  $sql="CREATE TABLE `medicalplatform`.`dr_tb_gene` (
  `id` INT NOT NULL,
  `code` VARCHAR(40) NOT NULL COMMENT '�������',
  `seq` VARCHAR(45) NOT NULL COMMENT '��ʾ˳��',
  `service_introduce` TEXT NOT NULL COMMENT '�������',
  `items` TEXT NOT NULL COMMENT '�����Ŀ',
  `question` TEXT NOT NULL COMMENT '��������',
  `image` VARCHAR(200) NOT NULL,
  `image_1` VARCHAR(200) NOT NULL,
  `image_2` VARCHAR(200) NOT NULL,
  `image_3` VARCHAR(200) NOT NULL,
  `image_4` VARCHAR(200) NOT NULL,
  `used_group_id` VARCHAR(500) NOT NULL COMMENT '������Ⱥ',
  `remarks` VARCHAR(200) NOT NULL,
  `price` INT NOT NULL,
  `status` VARCHAR(1) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `created_user` INT NOT NULL,
  `updated_date` DATETIME NOT NULL,
  `updated_user` INT NOT NULL,
  PRIMARY KEY (`id`))
COMMENT = '����';
";
	$query = $dbmgr->query($sql);
	
	
  $sql="CREATE TABLE `medicalplatform`.`dr_tb_gene_lang` (
  `oid` INT NOT NULL,
  `lang` VARCHAR(45) NOT NULL,
  `name` VARCHAR(200) NOT NULL COMMENT '����',
  `summary` VARCHAR(1000) NOT NULL COMMENT '����',
  `propose` VARCHAR(1000) NOT NULL COMMENT '���Ŀ��',
  `certification` VARCHAR(1000) NOT NULL COMMENT 'רҵ�Ͽ�',
  `advantage` VARCHAR(1000) NOT NULL COMMENT '���ô�',
  `process` VARCHAR(1000) NOT NULL COMMENT 'process',
  `used_group` VARCHAR(45) NOT NULL COMMENT 'used_group',
  PRIMARY KEY (`oid`, `lang`))
COMMENT = '���������';

";
	$query = $dbmgr->query($sql);
?>