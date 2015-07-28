<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/datamgr/sms.cls.php';
  require ROOT.'/classes/modelmgr/DoctorQueryXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new DoctorQueryXmlModel("doctorquery.php");
  
  $smarty->assign("MyModule","appointment");
  
  $model->DefaultShow($smarty,$dbmgr,$action,"doctorquery",$_REQUEST);

?>