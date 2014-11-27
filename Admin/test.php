<?php
  require 'include/common.inc.php';
  require ROOT.'/classes/modelmgr/TestXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new TestXmlModel("test.php");
  if($action==""){

	$model->ShowList($dbmgr,$smarty);

  }else if($action=="search"){
	$model->ShowSearchResult($dbmgr,$smarty,$_REQUEST);
  }else if($action=="add"){
	$model->Add($smarty);
  }else if($action=="edit"){
	$model->Edit($dbmgr,$smarty,$_REQUEST["id"]);
  }else if($action=="save"){
	$result=$model->Save($dbmgr,$_REQUEST,$sysuser);
	echo $result;
  }else if($action=="delete"){
	$result=$model->Delete($dbmgr,$_REQUEST["idlist"],$sysuser);
	echo $result;
  }
?>