<?php

  require 'include/common.inc.php';

	

  
  $sql="CREATE TABLE `medicalplatform`.`dr_tb_gene_value` (
  `id` INT NOT NULL,
  `gene_id` INT NOT NULL,
  `booking_count` INT NOT NULL,
  PRIMARY KEY (`id`));

";
	$query = $dbmgr->query($sql);

	 $sql="CREATE TABLE `medicalplatform`.`dr_tb_doctor_gene` (
  `id` INT NOT NULL,
  `gene_id` INT NOT NULL,
  `doctor_list` VARCHAR(2000) NOT NULL,
  `status` VARCHAR(1) NOT NULL,
  `remarks` VARCHAR(255) NOT NULL,
  `created_user` INT NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_user` INT NOT NULL,
  `updated_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`));
";
	$query = $dbmgr->query($sql);


?>