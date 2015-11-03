<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/include/front.inc.php';
  require ROOT.'/classes/datamgr/manager.cls.php';
  require ROOT.'/classes/datamgr/city.cls.php';
  require ROOT.'/classes/datamgr/general.cls.php';
  
 $managerlist=$managerMgr->getManagerList();	
 $smarty->assign("managerlist",$managerlist);
 
 
 $provincelist=$cityMgr->getAllProvince();	
 $smarty->assign("provincelist",$provincelist);
  $smarty->assign('module',"aboutus");

  $content=$generalMgr->getKeyContent('contact_us_company');
  $smarty->assign('companyinfo', $content);
 
  $smarty->display(ROOT.'/templates/aboutus/contactus.tpl');
  
?>
