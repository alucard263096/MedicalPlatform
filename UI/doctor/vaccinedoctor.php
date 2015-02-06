<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';

  $vaccine_id=$_REQUEST["id"];

  $drlist=$doctorMgr->getVaccineDoctorList($vaccine_id);
  $doctor_list=getListIdStr($result,"doctor_id");

  $districtCondition=$doctorMgr->getDistrictCondition($doctor_list);


  $smarty->display(ROOT.'/templates/doctor/vaccinedoctor.html');

?>