<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  
  require ROOT.'/include/login.inc.php';
  
  $member=$_SESSION[SESSIONNAME]["Member"];
  $member_id=$member["id"];
  $doctor_id=$_REQUEST["doctor_id"];
  
  if($member_id==""){
	echo "NONLOGIN";
  }else{
	$memberMgr->lookDoctor($member_id,$doctor_id);
	echo "SUCCESS";
  }

?>