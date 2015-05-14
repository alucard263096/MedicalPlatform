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
		echo $SysLang["gene"]["guidhasbeenused"];
		exit();
	}
	$geneAppointmentMgr->UpdateGuid($id,$guid,$user["id"]);
	echo "SUCCESS";
  }elseif($_REQUEST["action"]=="UPDATE_EXPRESSNO"){
	
	$id=$_POST["id"];
	$express_no=$_POST["express_no"];
	$geneAppointmentMgr->UpdateExpressNo($id,$express_no);
	echo "SUCCESS";

  }elseif($_REQUEST["action"]=="UPDATE_RECEIVE"){
	
	$id=$_POST["id"];
	$geneAppointmentMgr->UpdateReceive($id);
	echo "SUCCESS";

  }elseif($_REQUEST["action"]=="UPDATE_REPORTEXPRESSNO"){
	
	$id=$_POST["id"];
	$report_express_no=$_POST["report_express_no"];
	$geneAppointmentMgr->UpdateReportExpressNo($id,$report_express_no);
	echo "SUCCESS";

  }elseif($_REQUEST["action"]=="UPDATE_FINISHED"){
	
	$id=$_POST["id"];
	$geneAppointmentMgr->UpdateFinished($id);
	echo "SUCCESS";

  }else{
	$_REQUEST["doctor_id"]=$SysUser["doctor_id"];
	$model->DefaultShow($smarty,$dbmgr,$action,"geneappointment",$_REQUEST);
  }

?>