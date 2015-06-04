<?php

  require 'include/common.inc.php';

  
  $sql="CREATE TABLE `medicalplatform`.`dr_tb_office_specialhour` (
  `doctor_id` INT NOT NULL,
  `office_id` INT NOT NULL,
  `o_date` DATE NOT NULL,
  `o_time` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`doctor_id`, `office_id`, `o_date`, `o_time`));
";
	$query = $dbmgr->query($sql);
	
	
?>