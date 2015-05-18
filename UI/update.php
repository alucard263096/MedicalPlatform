<?php

  require 'include/common.inc.php';

  
  $sql="DROP TABLE `medicalplatform`.`dr_tb_doctor_gene`;
";
	$query = $dbmgr->query($sql);

	
  $sql="ALTER TABLE `medicalplatform`.`dr_tb_member_gene_order` 
DROP COLUMN `doctor_id`;
";
	$query = $dbmgr->query($sql);


?>