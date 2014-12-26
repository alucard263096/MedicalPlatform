<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  
  require_once ROOT.'/classes/datamgr/officeopenhour.cls.php';

  $action=$_REQUEST["action"];
  $model=new XmlModel("officeopenhour","officeopenhour.php");
  
  $smarty->assign("MyModule","reserver");

  if($action=="save"){
	$result=$officeOpenHourMgr->getOfficeOpenHour($_REQUEST["primary_id"]);
	  if($result["doctor_id"]!=$SysUser["doctor_id"]){
		echo "hack";
	  }
  }else{
	$action="edit";
    $_REQUEST["id"]=base64_decode($_REQUEST["id"]);
	
	  $result=$officeOpenHourMgr->getOfficeOpenHour($_REQUEST["id"]);
		  if($result["doctor_id"]!=$SysUser["doctor_id"]){
			echo "hack";
		  }
	  $model->XmlData["name"]=$result["office_name"].$SysLang["reserver"]["openhour"];
  }
  $model->DefaultShow($smarty,$dbmgr,$action,"officeopenhour_".$_REQUEST["id"],$_REQUEST);

?>