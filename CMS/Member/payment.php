<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  $model=new XmlModel("memberpayment","payment.php");
  
	$smarty->assign("MyModule","member");
  
  
  $model->DefaultShow($smarty,$dbmgr,$action,"payment",$_REQUEST);

?>