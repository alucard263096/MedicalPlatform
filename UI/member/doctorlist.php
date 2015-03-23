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
 require ROOT.'/classes/datamgr/member.cls.php';

  $list=$memberMgr->getMemberDoctorList($_SESSION[SESSIONNAME]["Member"]["id"]);
  for($i=0;$i<count($list);$i++){
	$list[$i]["pro_title"]=encodeRowText($list[$i]["pro_title"]);
  }

  $smarty->assign("list",$list);
  $smarty->assign("list_count",count($list));


  $smarty->display(ROOT.'/templates/member/doctorlist.html');
  
?>