<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  require ROOT.'/classes/datamgr/vaccine.cls.php';
  require ROOT."/classes/mgr/qrcode.cls.php";
  require ROOT.'/classes/datamgr/sms.cls.php';

  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	
	echo "WITHOUTLOGIN";
	exit();
  }
  $member=$_SESSION[SESSIONNAME]["Member"];
  $member_id=$member["id"];
  $name=$_REQUEST["name"];
  $mobile=$_REQUEST["mobile"];
  $idport_type=$_REQUEST["idport_type"];
  $idport=$_REQUEST["idport"];
  $order_date=$_REQUEST["order_date"];
  $order_time=$_REQUEST["order_time"];
  $price=$_REQUEST["price"];
  $vaccine_id=$_REQUEST["vaccine_id"];
  $doctor_id=$_REQUEST["doctor_id"];
  $office_id=$_REQUEST["office_id"];
  $snapshot=$_REQUEST["snapshot"];

  $action=$_REQUEST["action"];
  $modify_id=$_REQUEST["tag"];


  if($orderMgr->checkBookingUsed($office_id,$doctor_id,$order_date,$order_time)){
	echo "USED";
	exit();
  }
  if($action!="modify"){
	  $orderinfo=$orderMgr->getVaccineAppointmentForCheck($member["id"],$doctor_id,$vaccine_id);
	  if($orderinfo["order_no"]!=""){
		echo "DUPLIC";
		exit();
	  }
  }


  $info=$vaccineMgr->getVaccineDoctorPrice($doctor_id,$vaccine_id);
  if($info["web_price"]!=$price){
	echo "HACK";
	exit();
  }
  
  if($action!="modify"){
  
  $arr=$orderMgr->createVaccineOrder($member_id,$name,$mobile,$email,$idport_type,$idport,
	$order_date,$order_time,$vaccine_id,$doctor_id,$office_id,$info["web_price"],
	$snapshot,$info["id"]);

  }else{
  
  $arr=$orderMgr->updateVaccineOrder($member_id,$name,$mobile,$email,$idport_type,$idport,
	$order_date,$order_time,$office_id,$info["web_price"],
	$snapshot,$info["id"],$modify_id);

  }
	
  $orderInfo=$orderMgr->getVaccineAppointment($member_id,$arr["id"]);
  $smsMgr->SendVaccineOrderInfoMessage($orderInfo);

  $url=$CONFIG["doctorurl"]."/Appointment/qrcodereader.php?key=vcorder&guid=".$arr["guid"];
  $qrfile=GenQRCode($url);

  echo "SUCCESS".$arr["id"].",".$arr["guid"].",".$qrfile;
  
?>