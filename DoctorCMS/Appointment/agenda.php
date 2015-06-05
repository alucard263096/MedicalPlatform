<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require_once ROOT.'/classes/datamgr/office.cls.php';
  require_once ROOT.'/classes/datamgr/order.cls.php';
  $action=$_REQUEST["action"];
	$office_id=base64_decode($_REQUEST["id"]);
	if($action=="cancel"){
		$order_id=$_REQUEST["order_id"];
		$orderMgr->cancelVaccineAppointment($order_id);
		echo "SUCCESS";
		exit;
	}else if($action=="specialdate"){
		$events=$_REQUEST["events"];
		$datetype=$_REQUEST["datetype"];
		$office_id=$_REQUEST["office_id"];
		echo $officeMgr->updateSpecialDate($office_id,$SysUser["doctor_id"],$datetype,$events);
		exit;
	}else if($action=="cancelspecialdate"){
	
		$event=$_REQUEST["event"];
		$office_id=$_REQUEST["office_id"];
		echo $officeMgr->cancelSpecialDate($office_id,$SysUser["doctor_id"],$event);
		exit;
	}
	
	$workdayTime=$officeMgr->getWorkDayTimeList($office_id,$SysUser["doctor_id"]);
	$OTTime=$officeMgr->getSpecialDayTimeList($office_id,$SysUser["doctor_id"],"O");
	$LeaveTime=$officeMgr->getSpecialDayTimeList($office_id,$SysUser["doctor_id"],"L");


	$list=$officeMgr->getAppointmentList($office_id,$SysUser["doctor_id"]);
	$smarty->assign("office_id",$office_id);
	$smarty->assign("MyMenuId","agenda_$office_id");

	$smarty->assign("MyModule","appointment");
	$smarty->assign("MyMenuId","agenda_$office_id");
	$smarty->assign("eventlist",$list);
	$smarty->assign("workday",$workdayTime);
	$smarty->assign("OTworkday",$OTTime);
	$smarty->assign("Leaveworkday",$LeaveTime);
	$smarty->assign("order_id",1);
	$smarty->display(ROOT.'/templates/appointment/agenda.html');



?>