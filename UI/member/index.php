<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'inc.php';

  //unset($_SESSION[SESSIONNAME]["Member"]);
  
  $smarty->assign("Title",$SysLang["website"]["member"]);

  $smarty->display(ROOT.'/templates/mobile/member/index.html');

?>