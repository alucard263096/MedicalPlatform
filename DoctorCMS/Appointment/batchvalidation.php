<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  include ROOT.'/classes/mgr/excel_reader.cls.php';
  include ROOT.'/classes/datamgr/order.cls.php';
  $action=$_REQUEST["action"];
  $smarty->assign("MyModule","appointment");
  $smarty->assign("MyMenuId","batchvalidation");
  $smarty->assign("filemodule","validation_excel");

  if($action=="upload"){
	$filename=$_REQUEST["filename"];
	$filename=ROOT."/".$CONFIG['fileupload']['upload_path']."/validation_excel/".$filename;
	$arr=getArrayFromExcel($filename);
	$ret=array();
	$str="'__'";
	for($i<2;$i<=count($arr);$i++){
		$str.=",'".mysql_real_escape_string($arr[$i][1])."'";
		$array=array();
		$array["guid"]=$arr[$i][1];
		$ret[]=$array;
	}
	$result=$orderMgr->getVaccineAppointmentByGuidList("",$str);
	
	for($i=0;$i<count($ret);$i++){
		for($j=0;$j<count($result);$j++){
			if($ret[$i]["guid"]==$result[$j]["guid"]){
				$ret[$i]=$result[$j];
			}
		}
	}
  $smarty->assign("result",$ret);

	$smarty->display(ROOT.'/templates/appointment/batchvalidation_result.html');

  }elseif($action=="approve"){
	$val=$_REQUEST["val"];
	$result=$orderMgr->approveVaccineAppointmentBatch($val);
	echo $result;
  }else{
	$smarty->display(ROOT.'/templates/appointment/batchvalidation.html');
  }
  

?>