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

  logger_mgr::logInfo("notify alipay start :".$_SERVER["REQUEST_URI"]);
   logger_mgr::logInfo("notify alipay parameter".ArrayToString($_REQUEST));
  $alipay=new AlipayMgr();
  $ret=$alipay->notify();
  
   logger_mgr::logInfo("notify alipay verify return ".ArrayToString($ret));

	  if($ret["result"]=="SUCCESS"){
	  $info=$orderMgr->getGeneAppointment(0,$ret["out_trade_no"]);
		$orderMgr->updateGeneAppointmentPayment($info["id"],$ret["trade_no"]);
	  }
?>