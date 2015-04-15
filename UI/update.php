<?php

  require 'include/common.inc.php';

  $sql="ALTER TABLE `medicalplatform`.`dr_tb_office_lang` 
ADD COLUMN `addressnav` VARCHAR(1000) NULL AFTER `open_hour`;
";
	$query = $dbmgr->query($sql);

?>