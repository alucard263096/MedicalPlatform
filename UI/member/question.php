<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'common.inc.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  require ROOT.'/include/login.inc.php';
  
  $memberInfo=$memberMgr->getMemberInfo($_SESSION[SESSIONNAME]["Member"]["id"]);
  $smarty->assign("memberinfo",$memberInfo);

  $id=$_REQUEST["id"];
  $info=$doctorMgr->getMemberQuestion($_SESSION[SESSIONNAME]["Member"]["id"],$id);
  if($info["status"]=='F'){
	$memberMgr->readQuestion($id,$_SESSION[SESSIONNAME]["Member"]["id"]);
  }
  $smarty->assign("info",$info);
	$smarty->assign("Title","问题详情");
  $smarty->display(ROOT.'/templates/member/question.html');

?>