<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/datamgr/doctor.cls.php';

  $action=$_REQUEST["action"];
  $smarty->assign("MyModule","doctor");
  $smarty->assign("MyMenuId",$menuId."doctor_service");
  
  if($action==""){

	$doctor_list=$doctorMgr->getSpecialistDoctorList();
	$smarty->assign("doctor_list",$doctor_list);
    $smarty->display(ROOT.'/templates/doctor/service.html');

  }else if($action=="geteffectlist"){

	$doctor_id=$_REQUEST["doctor_id"];
	$result_list=$doctorMgr->getSpecialistDoctorService($doctor_id);
	$smarty->assign("result_list",$result_list);
    $smarty->display(ROOT.'/templates/doctor/service_result.html');

  }

?>