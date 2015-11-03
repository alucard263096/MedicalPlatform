<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/include/front.inc.php';
 require ROOT.'/classes/datamgr/news.cls.php';
 
 $result=$newsMgr->getNewsList(0);
  
$hot=$newsMgr->getHotNewsList(5);
  

 

$smarty->assign('module',"news");


	$smarty->assign('newslist',$result);
	$smarty->assign('hotlist',$hot);
  
  $smarty->display(ROOT.'/templates/news/index.tpl');
  
?>
