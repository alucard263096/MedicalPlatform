<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'common.inc.php';
  require ROOT.'/classes/datamgr/gene.cls.php';

  $info=$geneMgr->getGene($_REQUEST["id"]);
  //echo  $vaccine["summary"];
  $smarty->assign("info",$info);
	$smarty->assign("Title","基因详情");

  $smarty->display(ROOT.'/templates/gene/detail.html');

?>