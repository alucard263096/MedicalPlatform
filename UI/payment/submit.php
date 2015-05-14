<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/paymentmgr/payment.interface.php';
  require ROOT.'/classes/datamgr/order.cls.php';

  $member=$_SESSION[SESSIONNAME]["Member"];

  $act=$_GET["act"];
  $id=$_GET["id"];
  $type=$_GET["type"];

  if($act=="pt"&&$type=="ALIPAY"){
	
  require ROOT.'/classes/paymentmgr/alipay.cls.php';

	$orderMgr->updateGeneOrderPaymentInfo($member["id"],$id,$type);
	
	$info=getGeneAppointment($member["id"],$id);
	$url=$CONFIG['URL']."/member/booking.php?act=gn&id=".$id;
	//if($info["is_submit"]=="Y"){
	//	ParentRedirect($url);
	//}
	$alipay=new AlipayMgr();
	$alipay->submit($url,$info["order_no"],"基因检测项目".$info["order_no"],$info["price"],$info["trade_pin_code"]);
  }

?>