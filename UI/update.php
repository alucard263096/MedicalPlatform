<?php

  require 'include/common.inc.php';

  
  $sql="ALTER TABLE `medicalplatform`.`dr_tb_member_gene_order` 
ADD COLUMN `payment_type` VARCHAR(45) NULL AFTER `express_no`
ADD COLUMN `trade_pin_code` VARCHAR(45) NULL AFTER `payment_type`
ADD COLUMN `is_submit` VARCHAR(1) NULL AFTER `payment_type`
ADD COLUMN `trade_no` VARCHAR(45) NULL AFTER `is_submit`
ADD COLUMN `payment_time` DATETIME NULL AFTER `trade_no`;
";
	$query = $dbmgr->query($sql);

	


?>