<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';
  
  $doctor_id=$_REQUEST["id"];
  $office_id=$_REQUEST["oid"];
  $vaccine_id=$_REQUEST["vid"];
  $action=$_REQUEST["action"];

  $info=$doctorMgr->getDoctor($doctor_id);
  $standard=$doctorMgr->getStandardDoctorValue();
  
  $smarty->assign("info",$info);
  $smarty->assign("standard",$standard);

  if($action=="vaccine"){
	
	$smarty->assign("office_id",$office_id);
	$smarty->assign("vaccine_id",$vaccine_id);
	$smarty->assign("doctor_id",$doctor_id);

	$smarty->display(ROOT.'/templates/doctor/vaccinedoctordetail.html');
		
  }
?>