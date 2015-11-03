<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/modelmgr/TestCatXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new TestCatXmlModel("testcat.php");


  if($action==""){
  
	$smarty->assign("MyModule","test");
	$smarty->assign("MyMenuId","tcat_list");
	$model->ShowList($dbmgr,$smarty);

  }else if($action=="search"){

	$model->ShowSearchResult($dbmgr,$smarty,$_REQUEST);

  }else if($action=="add"){

	$smarty->assign("MyModule","test");
	$smarty->assign("MyMenuId","tcat_add");
	$model->Add($dbmgr,$smarty);

  }else if($action=="edit"){

	$smarty->assign("MyModule","test");
	$smarty->assign("MyMenuId","tcat_add");
	$model->Edit($dbmgr,$smarty,$_REQUEST["id"]);

  }else if($action=="save"){

	$result=$model->Save($dbmgr,$_REQUEST,$SysUser["id"]);
	echo $result;

  }else if($action=="delete"){

	$result=$model->Delete($dbmgr,$_REQUEST["idlist"],$SysUser["id"]);
	echo $result;

  }
?>