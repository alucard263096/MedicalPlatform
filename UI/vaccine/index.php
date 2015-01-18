<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require 'inc.php';
  require ROOT.'/classes/datamgr/vaccine.cls.php';

  $smarty->assign("Title",$SysLang["vaccine"]["vaccinelist"]);

  $vaccineList=$vaccineMgr->getVaccineList();
  $smarty->assign("VaccineList",$vaccineList);

  
  $vaccineCategory=$vaccineMgr->getVaccineCategory();
  $smarty->assign("VaccineCategory",$vaccineCategory);

  $smarty->assign("RightButton","VaccineList");

  $smarty->display(ROOT.'/templates/mobile/vaccine/index.html');

?>