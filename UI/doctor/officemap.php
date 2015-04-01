<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'common.inc.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';
  require 'common.inc.php';

  $office_id=$_REQUEST["id"];
  if($office_id==""){
	exit;
  }
	$info=$doctorMgr->getOfficeDetail($office_id);

	$smarty->assign("info",$info);
	$smarty->assign("ak",$CONFIG["map"]["ak"]);
	
  $smarty->display(ROOT.'/templates/doctor/officemap.html');


?>