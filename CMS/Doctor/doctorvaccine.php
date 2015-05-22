<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/modelmgr/DoctorVaccineXmlModel.cls.php';
  $action=$_REQUEST["action"];
  $model=new DoctorVaccineXmlModel("doctorvaccine.php");
  
	$smarty->assign("MyModule","doctor");

  $model->DefaultShow($smarty,$dbmgr,$action,"doctorvaccine",$_REQUEST);
?>