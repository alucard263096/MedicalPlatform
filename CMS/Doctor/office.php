<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("office","office.php");
  
	$smarty->assign("MyModule","doctor");

  $model->DefaultShow($smarty,$dbmgr,$action,"office",$_REQUEST);
?>