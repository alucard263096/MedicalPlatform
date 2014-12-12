<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("doctorvaccine","doctorvaccine.php");
  
	$smarty->assign("MyModule","doctor");

  $model->DefaultShow($smarty,$dbmgr,$action,"doctorvaccine",$_REQUEST);
?>