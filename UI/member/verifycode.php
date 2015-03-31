<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  require ROOT.'/classes/datamgr/sms.cls.php';
  
  $action=$_REQUEST["action"];
  $mobile=$_REQUEST["mobile"];
  
	if(!preg_match("/^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|189[0-9]{8}$/",$mobile)){    
		echo "INVALIDMOBILE";
		exit;    
	}

  $memberlist=$memberMgr->getMemberByEmailMobile("noemail",$mobile);

  if($action=="reg"){

	  if(count($memberlist)>0){
		echo "HASREG";
	  }else{
		$smsMgr->SendRegisterVerifyCodeMessage($mobile);
		echo "SUCCESS";
	  }

  }else if($action=="valid"){
  
	$verify_code=$_REQUEST["verify_code"];
	$type=$_REQUEST["type"];
	$result=$smsMgr->getLastSent($mobile,$type);
	if($verify_code==$result["code"]){
		echo "SUCCESS";
	}else{
		echo "INVALID";
	}

  }

?>