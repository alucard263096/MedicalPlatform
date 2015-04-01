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
  
  require ROOT.'/include/login.inc.php';

  $action=$_REQUEST["action"];
  if($action=="submit"){
	
	$member=$_SESSION[SESSIONNAME]["Member"];
	$memberMgr->submitFeedback($member["name"],$member["mobile"],$_REQUEST["description"]);
	echo "SUCCESS";
  }else{
	$smarty->display(ROOT.'/templates/member/feedback.html');
  }
  
?>