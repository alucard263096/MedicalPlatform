<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'inc.php';
  require ROOT.'/classes/datamgr/vaccine.cls.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';

  $vaccine=$vaccineMgr->getVaccine($_REQUEST["id"]);
  $doctorlist=$doctorMgr->getVaccineDoctorList($_REQUEST["id"]);


  $smarty->assign("info",$vaccine);
  $smarty->assign("doctor_list",$doctorlist);

  $smarty->assign("Title",$vaccine["name"]);
  $smarty->assign("backurl","index.php");
  $smarty->assign("RightButton","VaccineDoctorShow");
  $smarty->display(ROOT.'/templates/mobile/vaccine/detail.html');

?>