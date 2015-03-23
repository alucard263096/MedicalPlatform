<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  $action=$_REQUEST["action"];
  
	$smarty->assign("MyModule","appointment");
		$smarty->assign("MyMenuId","batchvalidation");

  if($action=="edit"){

  }else{
	$smarty->display(ROOT.'/templates/appointment/batchvalidation.html');
  }
  

?>