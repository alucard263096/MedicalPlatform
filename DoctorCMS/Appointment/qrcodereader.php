<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  

  $smarty->assign("MyModule","appointment");
  $smarty->assign("MyMenuId","vaccineapponitment");

  //print_r($_REQUEST);
  $action=$_REQUEST["action"];
  if($action=="approve"){
	$id=$_REQUEST["id"];
	$orderMgr->approveVaccineAppointment($id);
  }

  $key=$_REQUEST["key"];
  $guid=$_REQUEST["guid"];
  
  $info=$orderMgr->getVaccineAppointmentByGuid($key,$guid);
  $smarty->assign("info","'".$info."'");
  $smarty->display(ROOT.'/templates/appointment/qrcodereader.html');


?>