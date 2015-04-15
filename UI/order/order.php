<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/vaccine/common.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';
  require ROOT.'/classes/datamgr/vaccine.cls.php';
  require ROOT.'/classes/datamgr/banner.cls.php';
  require ROOT."/classes/mgr/qrcode.cls.php";
  
  require ROOT.'/include/login.inc.php';

  $action=$_REQUEST["action"];

  if($action=="vaccine"){
	
	$doctor_id=$_REQUEST["did"];
	$vaccine_id=$_REQUEST["vid"];

	
	$type=$_REQUEST["type"];
	if($type=="modify"){
		$id=$_REQUEST["id"];
		$order_base=$orderMgr->getOrderData($id);
		if($order_base["id"]==""){
			WindowRedirect("../index.php");
		}
		$doctor_id=$order_base["doctor_id"];
		$vaccine_id=$order_base["vaccine_id"];
		if($order_base["status"]=="P"&&$order_base["passdate"]<3){
			$smarty->assign("modify","1");
		}
	}

	$caution=$bannerMgr->getGeneralText("order_caution");
	$smarty->assign("caution",$caution);

	$info=$doctorMgr->getVaccineDoctor($vaccine_id,$doctor_id);
	$info["doctor_pro_title"]=encodeRowText($info["doctor_pro_title"]);
	$smarty->assign("info",$info);
	$member=$_SESSION[SESSIONNAME]["Member"];
	$smarty->assign("member",$member);
	$smarty->assign("doctor_id",$doctor_id);
	$smarty->assign("vaccine_id",$vaccine_id);

	

	$orderinfo=$orderMgr->getVaccineAppointmentForCheck($member["id"],$doctor_id,$vaccine_id);
	$haveorder=$orderinfo["order_no"]==""?"0":"1";
	$url=$CONFIG["doctorurl"]."/Appointment/qrcodereader.php?key=vcorder&guid=".$ordeinfo["guid"];
	$qrfile=GenQRCode($url);
	$orderinfo["qrcode"]=$qrfile;
	$smarty->assign("orderinfo",$orderinfo);
	$smarty->assign("haveorder",$haveorder);


	$smarty->display(ROOT.'/templates/order/order.html');
  }
?>