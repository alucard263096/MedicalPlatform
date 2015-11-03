<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/requisition.cls.php';
 
 if($rt=$requisitionMgr->checkHasRequisition($_REQUEST["qq"],$_REQUEST["phone"],$_REQUEST["company_name"])){
 	echo "exists";
 	exit;
 }
  echo $requisitionMgr->submitRequisition($_REQUEST["name"],$_REQUEST["position"],$_REQUEST["email"],$_REQUEST["phone"],$_REQUEST["qq"],
  $_REQUEST["company_name"],$_REQUEST["company_city"],$_REQUEST["company_address"],$_REQUEST["company_phone"],$_REQUEST["company_website"],
  $_REQUEST["knew"],$_REQUEST["message"],$_REQUEST["question"]);
?>
