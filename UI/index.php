<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require 'include/common.inc.php';

  $smarty->assign("Title",$SysLang["website"]["title"]);
  $smarty->display(ROOT.'/templates/mobile/index.html');
  
?>