<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'common.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  require ROOT."/classes/mgr/qrcode.cls.php";
  require 'inc.php';

  
  require ROOT.'/include/login.inc.php';

  $id=$_REQUEST["id"];
  $act=$_REQUEST["act"];

  if($act=="vc"){
  
	  $info=$orderMgr->getVaccineAppointment($_SESSION[SESSIONNAME]["Member"]["id"],$id);
  
	  $url=$CONFIG["doctorurl"]."/Appointment/qrcodereader.php?key=vcorder&guid=".$info["guid"];
	  $qrfile=GenQRCode($url);
	  //print_r($info);
	  //$smarty->assign("qrcode",$qrfile);
	  $info["qrcode"]=$qrfile;
	  $smarty->assign("info",$info);
	  $smarty->display(ROOT.'/templates/member/booking_vaccine.html');
  }else{
	  $info=$orderMgr->getGeneAppointment($id);
  
	  $smarty->assign("info",$info);
	  $smarty->display(ROOT.'/templates/member/booking_gene.html');
  }

?>