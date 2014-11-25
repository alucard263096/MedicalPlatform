<?php
  require 'include/common.inc.php';
  require ROOT.'/classes/modelmgr/TestXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new TestXmlModel("test.php");
  if($action==""){

	$model->ShowList($smarty);

  }else if($action=="search"){
	$model->ShowSearchResult($dbmgr,$smarty,$_REQUEST);
  }else if($action=="add"){
	$model->Add($smarty);
  }else if($action=="edit"){
	$model->Edit($dbmgr,$smarty,$_REQUEST["id"]);
  }
?>