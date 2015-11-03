<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/modelmgr/BannerXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new BannerXmlModel("banner.php");
  
  
	
	
	$smarty->assign("MyModule","website");
  if($action==""){

	$smarty->assign("MyMenuId","banner_list");
	$model->ShowList($dbmgr,$smarty);

  }else if($action=="search"){

	$model->ShowSearchResult($dbmgr,$smarty,$_REQUEST);

  }else if($action=="add"){

	$smarty->assign("MyMenuId","banner_add");
	$model->Add($dbmgr,$smarty);

  }else if($action=="edit"){

	$smarty->assign("MyMenuId","banner_add");
	$model->Edit($dbmgr,$smarty,$_REQUEST["id"]);

  }else if($action=="save"){

	$result=$model->Save($dbmgr,$_REQUEST,$SysUser["id"]);
	echo $result;

  }else if($action=="delete"){

	$result=$model->Delete($dbmgr,$_REQUEST["idlist"],$SysUser["id"]);
	echo $result;

  }
?>