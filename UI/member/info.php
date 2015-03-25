<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  
  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	$_SESSION[SESSIONNAME]["login_require_url"]=$_SERVER["REQUEST_URI"];
	 $smarty->display(ROOT.'/templates/member/login.html');
	exit();
  }

  $member=$_SESSION[SESSIONNAME]["Member"];
  $memberInfo=$memberMgr->getMemberInfo($member["id"]);

  $smarty->assign("member",$member);
  $smarty->assign("info",$memberInfo);

  $smarty->display(ROOT.'/templates/member/info.html');
  /*
  ALTER TABLE `medicalplatform`.`dr_tb_member_info` 
ADD COLUMN `height` VARCHAR(45) NULL AFTER `is_completed`,
ADD COLUMN `weight` VARCHAR(45) NULL AFTER `height`,
ADD COLUMN `has_new_die` VARCHAR(45) NULL AFTER `weight`,
ADD COLUMN `has_ill_relate` VARCHAR(45) NULL AFTER `has_new_die`,
ADD COLUMN `has_vaccine` VARCHAR(45) NULL AFTER `has_ill_relate`,
ADD COLUMN `has_treat` VARCHAR(45) NULL AFTER `has_vaccine`,
ADD COLUMN `smoke` VARCHAR(45) NULL AFTER `has_treat`,
ADD COLUMN `drink` VARCHAR(45) NULL AFTER `smoke`,
ADD COLUMN `long_medicine` VARCHAR(45) NULL AFTER `drink`,
ADD COLUMN `allergy` VARCHAR(45) NULL AFTER `long_medicine`;


  */


?>