<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  require ROOT."/classes/mgr/qrcode.cls.php";
  require 'inc.php';

  
  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	$_SESSION[SESSIONNAME]["login_require_url"]=$_SERVER["REQUEST_URI"];
	 $smarty->display(ROOT.'/templates/member/login.html');
	exit();
  }

  $id=$_REQUEST["id"];
  
  $info=$orderMgr->getVaccineAppointment($_SESSION[SESSIONNAME]["Member"]["id"],$id);
  
  
  $url=$CONFIG["doctorurl"]."/Appointment/qrcodereader.php?key=vcorder&guid=".$info["guid"];
  $qrfile=GenQRCode($url);
  //print_r($info);
  //$smarty->assign("qrcode",$qrfile);
  $info["qrcode"]=$qrfile;
  $smarty->assign("info",$info);
  $smarty->display(ROOT.'/templates/member/booking.html');

?>