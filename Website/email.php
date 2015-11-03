<?php
/*
 * Created on 2011-1-22
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
  require 'include/common.inc.php';
  require ROOT.'/classes/mgr/email.cls.php';
 
  echo $emailMgr->send("alucard263096@126.com","2","",false);
  
  
  
  
?>