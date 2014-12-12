<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/modelmgr/VaccineXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new VaccineXmlModel("vaccine.php");
  
	$smarty->assign("MyModule","baseinfo");
  
  
  $model->DefaultShow($smarty,$dbmgr,$action,"vaccine",$_REQUEST);

?>