<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("appointment","appointment.php");
  
	$smarty->assign("MyModule","appointment");
  
  
  $model->DefaultShow($smarty,$dbmgr,$action,"appointment",$_REQUEST);

?>