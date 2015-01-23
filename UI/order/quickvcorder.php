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

  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	
	echo "WITHOUTLOGIN";
	exit();
  }
  $member_id=$_REQUEST["member_id"];
  $name=$_REQUEST["name"];
  $mobile=$_REQUEST["mobile"];
  $email=$_REQUEST["email"];
  $order_date=$_REQUEST["order_date"];
  $order_time=$_REQUEST["order_time"];
  $vaccine_id=$_REQUEST["vaccine_id"];
  $doctor_id=$_REQUEST["doctor_id"];
  $office_id=$_REQUEST["office_id"];
  $snapshot=$_REQUEST["snapshot"];
 $doctor_vaccine_id=$_REQUEST["doctor_vaccine_id"];


  if($orderMgr->checkBookingUsed($office_id,$doctor_id,$order_date,$order_time)){
	echo "USED";
	exit();
  }


  $info=$vaccineMgr->getVaccineDoctor($doctor_vaccine_id);
  if($info["doctor_id"]!=$doctor_id||$info["vaccine_id"]!=$vaccine_id){

	echo "HACK";
	exit();
  }
  $id=$orderMgr->createVaccineOrder($member_id,$name,$mobile,$email,
	$order_date,$order_time,$vaccine_id,$doctor_id,$office_id,$info["web_price"],
	$snapshot,$doctor_vaccine_id);

	echo "SUCCESS".$id;
  
?>