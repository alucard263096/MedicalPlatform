<?php

  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/db_example.php';

  /*
  $rs=$dBExampleMgr->getString();
  print_r($rs);
  
  $rs=$dBExampleMgr->getString_one();
  print_r($rs);
  */
  $action=$_REQUEST["action"];
  if($action=="test")
  {
	  $rs=$dBExampleMgr->getString();
	  print_r($rs);
  }
  

  

?>