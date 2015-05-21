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
 require ROOT.'/classes/datamgr/member.cls.php';

  $list=$memberMgr->getMemberDoctorList($_SESSION[SESSIONNAME]["Member"]["id"]);
  for($i=0;$i<count($list);$i++){
	$list[$i]["pro_title"]=encodeRowText($list[$i]["pro_title"]);
  }

  $smarty->assign("list",$list);
  $smarty->assign("list_count",count($list));
	$smarty->assign("Title","我的关注");


  $smarty->display(ROOT.'/templates/member/doctorlist.html');
  
?>