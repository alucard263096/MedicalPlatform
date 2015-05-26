<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  include ROOT.'/classes/datamgr/appointment.cls.php';

  $action=$_REQUEST["action"];
  if($action=="HANDLE"){
	$appointmentMgr->Handle($_REQUEST["id"],$_REQUEST["h_status"],$_REQUEST["h_comment"]);
	echo "SUCCESS";
  }else{
	$model=new XmlModel("appointment","appointment.php");
	$smarty->assign("MyModule","appointment");
	$model->DefaultShow($smarty,$dbmgr,$action,"appointment",$_REQUEST);
  }
?>