<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require 'include/common.inc.php';
  //echo strtotime("2014-12-12");
  //$date=getdate(strtotime("2014-1-14"));  
  //print_r($date); 
  $smarty->assign("Title",$SysLang["website"]["title"]);
  $smarty->display(ROOT.'/templates/mobile/index.html');
  
?>