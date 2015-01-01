<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  //require 'inc.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  $loginname=$_REQUEST["loginname"];
  $password=$_REQUEST["password"];
  $memberlist=$memberMgr->getMemberByEmailMobile($loginname,$loginname);

  if(count($memberlist)==0){
	echo "NOMENBER";
  }else{
	$member=$memberlist[0];
	if(md5($password)!=$member["password"]){
		echo "PSWINCORRECT";
	}else{
		echo "SUCCESS";
		$_SESSION[SESSIONNAME]["Member"]=$member;
	}
  }


?>