<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'common.inc.php';
  //require 'inc.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  require ROOT.'/classes/datamgr/sms.cls.php';
  $loginname=$_REQUEST["mobile"];
  $memberlist=$memberMgr->getMemberByEmailMobile($loginname,$loginname);

  $action=$_REQUEST["action"];

  if(count($memberlist)==0){
	echo "NOMEMBER";
  }else{
	if($action=="psw"){
	$password=$_REQUEST["password"];
		$member=$memberlist[0];
		if(md5($password)!=$member["password"]){
			echo "PSWINCORRECT";
		}else{
			echo "SUCCESS";
			$_SESSION[SESSIONNAME]["Member"]=$member;
			setcookie("loginedmobile", $loginname);
		}
	}else if($action=="verifycode"){
		$verifycode=$_REQUEST["verifycode"];
		$member=$memberlist[0];

		$result=$smsMgr->getLastSent($mobile,"L");
		
		if($verify_code==$result["code"]){
			echo "SUCCESS";
			$_SESSION[SESSIONNAME]["Member"]=$member;
			setcookie("loginedmobile", $loginname);
		}else{
			echo "VCINCORRECT";
		}
	}
  }


?>