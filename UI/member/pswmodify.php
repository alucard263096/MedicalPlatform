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
  
  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	$_SESSION[SESSIONNAME]["login_require_url"]=$_SERVER["REQUEST_URI"];
	 $smarty->display(ROOT.'/templates/member/login.html');
	exit();
  }

  $action=$_REQUEST["action"];
  if($action=="submit"){
	
	$verify_code=$_REQUEST["verify_code"];
	$password=$_REQUEST["password"];
	$mobile=$_SESSION[SESSIONNAME]["Member"]["mobile"];

	$result=$smsMgr->getLastSent($mobile,"M");
	if($verify_code!=$result["code"]){
		echo "VERCODEERROR";
		exit;
	}

	$memberMgr->changePassword($_SESSION[SESSIONNAME]["Member"]["id"],$password);
	echo "SUCCESS";

  }else{

	$smarty->display(ROOT.'/templates/member/pswmodify.html');

  }
 


?>