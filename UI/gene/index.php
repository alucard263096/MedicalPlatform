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

  $geneList=$geneMgr->getGeneList();
  //print_r($vaccineList);
  $smarty->assign("GeneList",$geneList);
  $smarty->assign("Title","基因");

  $smarty->display(ROOT.'/templates/gene/index.html');

?>