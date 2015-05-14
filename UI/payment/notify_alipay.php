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
  require ROOT.'/classes/paymentmgr/alipay.cls.php';

  require ROOT.'/include/login.inc.php';
  $member=$_SESSION[SESSIONNAME]["Member"];

  $alipay=new AlipayMgr();
  $ret=$alipay->notify();

  $info=$orderMgr->getGeneAppointment($member["id"],0,$ret["out_trade_no"]);
  if($ret["return"]=="SUCCESS"){
	$orderMgr->updateGeneAppointmentPayment($member["id"],$info["id"],$ret["trade_no"]);
  }

?>