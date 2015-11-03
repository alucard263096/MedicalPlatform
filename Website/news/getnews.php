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
 
  is_numeric( $_REQUEST["page"] ) or die('提供的参数不是数字');
  
  
  
 $result=$newsMgr->getNewsList($_REQUEST["page"]);
	$smarty->assign('newslist',$result);
  
  $smarty->display(ROOT.'/templates/news/newslist.tpl');
  
?>
