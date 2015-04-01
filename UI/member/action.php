<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'common.inc.php';
  require ROOT.'/classes/datamgr/member.cls.php';
  $action=$_REQUEST["action"];
  if($action=="hasreply"){
	echo $memberMgr->hasReply($_SESSION[SESSIONNAME]["Member"]["id"]);
  }

?>