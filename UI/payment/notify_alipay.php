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
  print_r($_GET);
  print_r($ret);

  $info=$orderMgr->getGeneAppointment(0,$ret["out_trade_no"]);
  if($ret["result"]=="SUCCESS"){
	$orderMgr->updateGeneAppointmentPayment($info["id"],$ret["trade_no"]);
  }

?>