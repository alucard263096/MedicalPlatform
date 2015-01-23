<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("vaccinepromoted","vaccinepromoted.php");
	$smarty->assign("MyModule","website");

  if($action==""){
	$smarty->assign("MyMenuId","vaccinepromoted");
	$model->Edit($dbmgr,$smarty,1);

  }else if($action=="save"){
  
	$result=$model->Save($dbmgr,$_REQUEST,$SysUser["id"]);
	echo $result;
  }

?>