<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  $action=$_REQUEST["action"];
	$office_id=base64_decode($_REQUEST["id"]);
  if($action=="getevent"){

  }else{
	$smarty->assign("MyModule","appointment");
	$smarty->assign("MyMenuId","agenda_$office_id");
	$smarty->display(ROOT.'/templates/appointment/agenda.html');
  }

?>