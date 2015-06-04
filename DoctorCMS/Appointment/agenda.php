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
	}
	
	$workdayTime=$officeMgr->getWorkDayTimeList($office_id,$SysUser["doctor_id"]);


	$list=$officeMgr->getAppointmentList($office_id,$SysUser["doctor_id"]);
	$smarty->assign("office_id",$office_id);
	$smarty->assign("MyMenuId","agenda_$office_id");

	$smarty->assign("MyModule","appointment");
	$smarty->assign("MyMenuId","agenda_$office_id");
	$smarty->assign("eventlist",$list);
	$smarty->assign("workday",$workdayTime);
	$smarty->display(ROOT.'/templates/appointment/agenda.html');



?>