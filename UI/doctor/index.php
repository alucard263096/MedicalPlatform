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
  require 'common.inc.php';

  $vaccine_id=$_REQUEST["id"];
  $action=$_REQUEST["action"];
  
  require ROOT.'/include/login.inc.php';

  if($action=="vaccine"){
	$drlist=$doctorMgr->getVaccineDoctorList($vaccine_id);
	for($i=0;$i<count($drlist);$i++){
		$drlist[$i]["advanced"]=encodeRowText($drlist[$i]["advanced"],2);
		$drlist[$i]["pro_title"]=encodeRowText($drlist[$i]["pro_title"],2);
	}
	$doctor_list=getListIdStr($drlist,"doctor_id");
	$districtCondition=$doctorMgr->getDistrictCondition($doctor_list);
	//print_r($districtCondition);
	$smarty->assign("vaccine_id",$vaccine_id);
	$smarty->assign("doctorlist",$drlist);
	$smarty->assign("district_condition",$districtCondition);
	$smarty->display(ROOT.'/templates/doctor/vaccinedoctor.html');
  }else{
	$drlist=$doctorMgr->getDoctorList();
	for($i=0;$i<count($drlist);$i++){
		$drlist[$i]["advanced"]=encodeRowText($drlist[$i]["advanced"],2);
		$drlist[$i]["pro_title"]=encodeRowText($drlist[$i]["pro_title"],2);
	}

	$smarty->assign("doctor_list",$drlist);

	$doctor_list=getListIdStr($drlist,"doctor_id");
	$districtCondition=$doctorMgr->getDistrictCondition($doctor_list);
	$smarty->assign("district_condition",$districtCondition);


	$smarty->display(ROOT.'/templates/doctor/index.html');
  }
?>