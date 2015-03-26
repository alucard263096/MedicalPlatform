<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/member.cls.php';

  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	$_SESSION[SESSIONNAME]["login_require_url"]=$_SERVER["REQUEST_URI"];
	 $smarty->display(ROOT.'/templates/member/login.html');
	exit();
  }

  $action=$_REQUEST["action"];
  if($action=="submit"){
	
	$member=$_SESSION[SESSIONNAME]["Member"];
	$memberMgr->submitFeedback($member["name"],$member["mobile"],$_REQUEST["description"]);
	echo "SUCCESS";
  }else{
	$smarty->display(ROOT.'/templates/member/feedback.html');
  }
  
?>