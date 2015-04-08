<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'common.inc.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  require ROOT.'/classes/datamgr/sms.cls.php';
  
  $action=$_REQUEST["action"];
  if(isset($_REQUEST["mobile"])){
	$mobile=$_REQUEST["mobile"];
  }else{
	$mobile=$_SESSION[SESSIONNAME]["Member"]["mobile"];
  }
  
	if(!preg_match("/^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$/",$mobile)){    
		echo "INVALIDMOBILE";
		exit;    
	}

  $memberlist=$memberMgr->getMemberByEmailMobile("noemail",$mobile);

  if($action=="reg"){
  	require ROOT.'/classes/mgr/securimage.cls.php';
	
	$securimage = new Securimage();
	if ($securimage->check($_REQUEST['security_code']) == false) 
	{
		echo "INVALIDSECURITYCODE";
		exit;
	}

	  if(count($memberlist)>0){
		echo "HASREG";
	  }else{
		$smsMgr->SendRegisterVerifyCodeMessage($mobile);
		echo "SUCCESS";
	  }

  }
  else if($action=="login"){	
  require ROOT.'/classes/mgr/securimage.cls.php';
	
	$securimage = new Securimage();
	if ($securimage->check($_REQUEST['security_code']) == false) 
	{
		echo "INVALIDSECURITYCODE";
		exit;
	}
	  if(count($memberlist)==0){
		echo "NOMEMBER";
	  }else{
		$smsMgr->SendLoginVerifyCodeMessage($mobile);
		echo "SUCCESS";
	  }

  }else if($action=="pswmodify"){
		require ROOT.'/classes/mgr/securimage.cls.php';
	
	$securimage = new Securimage();
	if ($securimage->check($_REQUEST['security_code']) == false) 
	{
		echo "INVALIDSECURITYCODE";
		exit;
	}

	$smsMgr->SendPSWModifyVerifyCodeMessage($mobile);
	echo "SUCCESS";

  }else if($action=="valid"){

	

	
	$verify_code=$_REQUEST["verify_code"];
	if($verify_code==""){
		echo "HACK";
		exit;
	}
	$type=$_REQUEST["type"];
	$result=$smsMgr->getLastSent($mobile,$type);
	//echo $verify_code."==".$result["code"];
	if($verify_code==$result["code"]){
		echo "SUCCESS";
	}else{
		echo "INVALID";
	}

  }

?>