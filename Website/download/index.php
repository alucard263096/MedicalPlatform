<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/include/front.inc.php';
 require ROOT.'/classes/datamgr/download.cls.php';
  
 $list=$downloadMgr->getDownladCateList();
  
$smarty->assign('module',"download");
$smarty->assign('list',$list);
  
$smarty->display(ROOT.'/templates/download/index.tpl');

?>
