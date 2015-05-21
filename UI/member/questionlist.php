<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'common.inc.php';
  
  require ROOT.'/include/login.inc.php';
 require ROOT.'/classes/datamgr/doctor.cls.php';

  $list=$doctorMgr->getMemberQuestionList($_SESSION[SESSIONNAME]["Member"]["id"]);
  

  $smarty->assign("list",$list);
  $smarty->assign("list_count",count($list));
  
	$smarty->assign("Title","我的咨询");

  $smarty->display(ROOT.'/templates/member/questionlist.html');
  
?>