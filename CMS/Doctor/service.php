<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new DoctorXmlModel("doctor.php");
  
  $smarty->assign("MyModule","doctor");
  $smarty->assign("MyMenuId",$menuId."doctor_service");
  
  
  if($action==""){
	
  }

?>