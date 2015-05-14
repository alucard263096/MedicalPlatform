<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("geneappointment","geneappointment.php");
  
	$smarty->assign("MyModule","appointment");
  if($_REQUEST["action"]=="UPDATE_GUID"){
	$id=$_POST["id"];
	$guid=$_POST["guid"];
	$user=$_SESSION[SESSIONNAME]["SysUser"];
	if($geneAppointmentMgr->CheckGuidOnly($id,$guid)){
		echo "±êÊ¶ÂëÖØ¸´";
	}
	$geneAppointmentMgr->UpdateGuid($id,$guid,$user["id"]);
	echo "SUCCESS";
  }else{
	$model->DefaultShow($smarty,$dbmgr,$action,"geneappointment",$_REQUEST);
  }

?>