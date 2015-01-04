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

  $id=$_REQUEST["id"];
  
  $info=$orderMgr->getVaccineAppointment($_SESSION[SESSIONNAME]["Member"]["id"],$id);
  
  
  $smarty->assign("Title",$info["order_no"]);
  $url=$CONFIG["doctorurl"]."/Appointment/qrcodereader.php?key=vcorder&guid=".$info["guid"];
  $qrfile=GenQRCode($url);
  //print_r($info);
  $smarty->assign("qrcode",$qrfile);
  $smarty->assign("info",$info);
  $smarty->assign("backurl","vaccineapls.php");
  $smarty->display(ROOT.'/templates/mobile/member/vaccineorder.html');

?>