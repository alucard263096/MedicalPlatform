<?php

  require 'include/common.inc.php';

  $sql="ALTER TABLE `medicalplatform`.`dr_tb_member_question` 
ADD COLUMN `read` VARCHAR(1) NULL AFTER `replied_date`;
";
	$query = $dbmgr->query($sql);

?>