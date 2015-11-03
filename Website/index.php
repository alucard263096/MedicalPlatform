<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require 'include/common.inc.php';
  require ROOT.'/include/front.inc.php';
 require ROOT.'/classes/datamgr/news.cls.php';
$hot=$newsMgr->getHotNewsList(3);
	$smarty->assign('hotlist',$hot);
	
 $bannerlist=$websiteMgr->getIndexPageBannerList();
 $smarty->assign("bannerlist",$bannerlist);
  
  $smarty->display(ROOT.'/templates/index.tpl');
  
?>
