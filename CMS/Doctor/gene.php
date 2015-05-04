<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/modelmgr/DoctorGeneXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new DoctorGeneXmlModel("gene.php");
  
  $smarty->assign("MyModule","doctor");
  
  
  $model->DefaultShow($smarty,$dbmgr,$action,"doctorgene",$_REQUEST);

?>