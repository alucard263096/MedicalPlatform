<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/modelmgr/GeneXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new GeneXmlModel("gene.php");
  
	$smarty->assign("MyModule","baseinfo");
  
  
  $model->DefaultShow($smarty,$dbmgr,$action,"gene",$_REQUEST);

?>