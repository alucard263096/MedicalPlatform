<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
include ROOT.'/classes/datamgr/geneappointment.cls.php';
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
	require ROOT.'/classes/datamgr/sms.cls.php';
	$info=$geneAppointmentMgr->GetAppointmentInfo($id);
	$smsMgr->SendGeneOrderConfirm($info["mobile"],$info["gene_name"]);

	echo "SUCCESS";
  }elseif($_REQUEST["action"]=="UPDATE_EXPRESSNO"){
	
	$id=$_POST["id"];
	$express_no=$_POST["express_no"];
	$express_com=$_POST["express_com"];
	$geneAppointmentMgr->UpdateExpressNo($id,$express_com,$express_no);
	echo "SUCCESS";

  }elseif($_REQUEST["action"]=="UPDATE_RECEIVE"){
	
	$id=$_POST["id"];
	$geneAppointmentMgr->UpdateReceive($id);
	require ROOT.'/classes/datamgr/sms.cls.php';
	$info=$geneAppointmentMgr->GetAppointmentInfo($id);
	$smsMgr->SendGeneToolReceived($info["mobile"],$info["guid"]);

	echo "SUCCESS";

  }elseif($_REQUEST["action"]=="UPDATE_REPORTEXPRESSNO"){
	
	$id=$_POST["id"];
	$report_express_no=$_POST["report_express_no"];
	$report_express_com=$_POST["report_express_com"];
	$geneAppointmentMgr->UpdateReportExpressNo($id,$report_express_com,$report_express_no);
	echo "SUCCESS";

  }elseif($_REQUEST["action"]=="UPDATE_FINISHED"){
	
	$id=$_POST["id"];
	$geneAppointmentMgr->UpdateFinished($id);
	echo "SUCCESS";

  }else{
	$model->DefaultShow($smarty,$dbmgr,$action,"geneappointment",$_REQUEST);
  }

?>