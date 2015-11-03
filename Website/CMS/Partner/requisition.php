<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("requisition","requisition.php");
  
	$smarty->assign("MyModule","partner");
	$smarty->assign("MyMenuId","requisition_list");

  if($action==""){

	$model->ShowList($dbmgr,$smarty);

  }else if($action=="search"){

	$model->ShowSearchResult($dbmgr,$smarty,$_REQUEST);

  }else if($action=="edit"){

	$model->Edit($dbmgr,$smarty,$_REQUEST["id"]);

  }else if($action=="save"){

	$result=$model->Save($dbmgr,$_REQUEST,$SysUser["id"]);
	echo $result;

  }
?>