<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';


  $doctor_list=$doctorMgr->getVaccineDoctorList($_REQUEST["vacccine_id"]);

  $smarty->assign("doctor_list",$doctor_list);

  $smarty->display(ROOT.'/templates/mobile/vaccine/detail.html');

?>