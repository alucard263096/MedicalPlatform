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

  $mobile=$_REQUEST["mobile"];
  $email=$_REQUEST["email"];
  $name=$_REQUEST["name"];
  $password=$_REQUEST["password"];

  $memberlist=$memberMgr->getMemberByEmailMobile($email,$mobile);
  
  if(count($memberlist)>0){
	echo "DUPLIC";
  }else{
	
	$retreg=$memberMgr->addMember($email,$mobile,$password,$name);
	if($retreg==true){
		$memberlist=$memberMgr->getMemberByEmailMobile($email,$mobile);
		if(count($memberlist)==1){
		$member=$memberlist[0];
		$_SESSION[SESSIONNAME]["Member"]=$member;
		echo "SUCCESS";
	  }
	}
  }


?>