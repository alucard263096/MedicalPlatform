<?php

  require 'include/common.inc.php';

	

  
  $sql="CREATE TABLE `medicalplatform`.`dr_tb_member_gene_order` (
  `id` INT NOT NULL,
  `order_no` VARCHAR(45) NULL,
  `guid` VARCHAR(45) NULL,
  `member_id` INT(11) NULL,
  `name` VARCHAR(200) NULL,
  `mobile` VARCHAR(200) NULL,
  `address` VARCHAR(200) NULL,
  `remark` VARCHAR(500) NULL,
  `gene_id` INT NULL,
  `doctor_id` INT NULL,
  `price` DECIMAL(10,2) NULL,
  `status` VARCHAR(1) NULL,
  `created_time` DATETIME NULL,
  `snapshot` VARCHAR(1000) NULL,
  `updated_user` INT NULL,
  `updated_date` DATETIME NULL,
  `h_status` VARCHAR(1) NULL,
  `h_comment` VARCHAR(1000) NULL,
  `payment` VARCHAR(1) NULL,
  `express_no` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


";
	$query = $dbmgr->query($sql);

	


?>