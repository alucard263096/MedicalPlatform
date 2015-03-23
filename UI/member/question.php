<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  
  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	$_SESSION[SESSIONNAME]["login_require_url"]=$_SERVER["REQUEST_URI"];
	 $smarty->display(ROOT.'/templates/member/login.html');
	exit();
  }
  
  $memberInfo=$memberMgr->getMemberInfo($_SESSION[SESSIONNAME]["Member"]["id"]);
  $smarty->assign("memberinfo",$memberInfo);

  $id=$_REQUEST["id"];
  $info=$doctorMgr->getMemberQuestion($_SESSION[SESSIONNAME]["Member"]["id"],$id);
  
  $smarty->assign("info",$info);
  $smarty->display(ROOT.'/templates/member/question.html');

?>