<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  require 'inc.php';

  $listn=$orderMgr->getActiveVaccineAppointmentList($_SESSION[SESSIONNAME]["Member"]["id"]);
  $listp=$orderMgr->getExpiredVaccineAppointmentList($_SESSION[SESSIONNAME]["Member"]["id"]);
  
  $smarty->assign("Title",$SysLang["member"]["vaccineappointment"]);

  $smarty->assign("listn",$listn);
  $smarty->assign("listn_count",count($listn));

  $smarty->assign("listp",$listp);
  $smarty->assign("listp_count",count($listp));

  $smarty->assign("backurl","index.php");
  $smarty->display(ROOT.'/templates/mobile/member/vaccineorderlist.html');

?>