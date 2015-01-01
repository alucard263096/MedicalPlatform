<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  $smarty->assign("Module","member");

  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	WindowRedirect($CONFIG['smarty']['rootpath']."/index.php");
	exit;
  }

  
?>