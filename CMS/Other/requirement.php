<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("requirement","requirement.php");
  
	$smarty->assign("MyModule","other");
  
  
  $model->DefaultShow($smarty,$dbmgr,$action,"requirement",$_REQUEST);

?>