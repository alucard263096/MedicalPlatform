<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/modelmgr/DoctorAccountXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new DoctorAccountXmlModel("doctoraccount.php");
  
  $smarty->assign("MyModule","admin");
  
  
  $model->DefaultShow($smarty,$dbmgr,$action,"doctoraccount",$_REQUEST);

?>