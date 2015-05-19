<?php

  require 'include/common.inc.php';

  
  $sql="ALTER TABLE `medicalplatform`.`dr_tb_member_gene_order` 
ADD COLUMN `express_com` VARCHAR(45) NULL AFTER `report_express_no`,
ADD COLUMN `report_express_com` VARCHAR(45) NULL AFTER `express_com`;

";
	$query = $dbmgr->query($sql);

	


?>