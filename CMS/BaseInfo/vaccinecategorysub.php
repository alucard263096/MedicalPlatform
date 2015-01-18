<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("vaccinecategorysub","vaccinecategorysub.php");
  
	$smarty->assign("MyModule","baseinfo");
  
  
  $model->DefaultShow($smarty,$dbmgr,$action,"vaccine_category_sub",$_REQUEST);

?>