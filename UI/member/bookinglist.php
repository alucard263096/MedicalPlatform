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
 require ROOT.'/classes/datamgr/order.cls.php';

  $list=$orderMgr->getAppointmentList($_SESSION[SESSIONNAME]["Member"]["id"]);
  

  $smarty->assign("list",$list);
  $smarty->assign("list_count",count($list));


  $smarty->display(ROOT.'/templates/member/bookinglist.html');
  
?>