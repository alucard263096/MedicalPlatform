<?php
  require 'include/common.inc.php';
  require ROOT.'/classes/modelmgr/TestXmlModel.cls.php';
  
  $model=new TestXmlModel();

  $action=$_REQUEST["action"];
  if($action==""){
	$model->ShowList($smarty);
  }
?>