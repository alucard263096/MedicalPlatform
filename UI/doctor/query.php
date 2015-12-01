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
  
  require ROOT.'/include/login.inc.php';
  require ROOT.'/classes/datamgr/sms.cls.php';
  
  $member=$_SESSION[SESSIONNAME]["Member"];
  $member_id=$member["id"];
  
  $action=$_REQUEST["action"];
  if($action=="submit"){
  
	$doctor_id=$_REQUEST["doctor_id"];
	//echo $doctor_id;
	if($doctor_id==""||$doctor_id==0){
		$info=$doctorMgr->GetQuestionList($doctor_id,$member_id);
		//print_r($info);
		if(count($info)>3){
			echo "DUPLIC_3";
			exit;
		}
	}else{
		$info=$doctorMgr->GetQuestionList($doctor_id,$member_id);
		if(count($info)>1){
			echo "DUPLIC_1";
			exit;
		}
	}

	$description=$_REQUEST["description"];
	$is_male=$_REQUEST["is_male"];
	$age=$_REQUEST["age"];
	$img_1=$_REQUEST["img_1"];
	$img_2=$_REQUEST["img_2"];
	$img_3=$_REQUEST["img_3"];

	$id=$doctorMgr->SubmitAQuestion($doctor_id,$member_id,$member["name"],$member["mobile"],
	$description,$is_male,$age,$img_1,$img_2,$img_3);

	
	$smsMgr->SendQuestionForTest($member["mobile"],$description);

	echo "SUCCESS_".$id;
	exit;
  }else{
		
	  $doctor_id=$_REQUEST["id"];
	  $doctor_id=$doctor_id==""?0:$doctor_id;

	  $smarty->assign("doctor_id",$doctor_id==""?0:$doctor_id);
	  if($doctor_id!=""&&$doctor_id==0){
		$info=$doctorMgr->GetQuestion($doctor_id,$member_id);
	  }
	  $smarty->assign("info",$info);

	  $smarty->display(ROOT.'/templates/doctor/query.html');

  }

?>