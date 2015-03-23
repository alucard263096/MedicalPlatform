<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';

  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	$_SESSION[SESSIONNAME]["login_require_url"]=$_SERVER["REQUEST_URI"];
	 $smarty->display(ROOT.'/templates/member/login.html');
	exit();
  }
 require ROOT.'/classes/datamgr/doctor.cls.php';

  $list=$doctorMgr->getMemberQuestionList($_SESSION[SESSIONNAME]["Member"]["id"]);
  

  $smarty->assign("list",$list);
  $smarty->assign("list_count",count($list));


  $smarty->display(ROOT.'/templates/member/questionlist.html');
  
?>