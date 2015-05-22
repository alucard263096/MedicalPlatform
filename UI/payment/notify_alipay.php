<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 $isdisplaylogin=false;
  require '../include/common.inc.php';
  require ROOT.'/classes/paymentmgr/payment.interface.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  require ROOT.'/classes/paymentmgr/alipay.cls.php';


  $alipay=new AlipayMgr();
  $ret=$alipay->notify();

  $info=$orderMgr->getGeneAppointment(0,0,$ret["out_trade_no"]);
  if($ret["result"]=="SUCCESS"){
	$orderMgr->updateGeneAppointmentPayment($info["member_id"],$info["id"],$ret["trade_no"]);
  }

?>