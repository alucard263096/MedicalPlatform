<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/banner.cls.php';
  
  $aboutus=$bannerMgr->getGeneralText("aboutus");
  $faith=$bannerMgr->getGeneralText("aboutus-faith");
  $dream=$bannerMgr->getGeneralText("aboutus-dream");

  $smarty->assign("aboutus",$aboutus);
  $smarty->assign("faith",$faith);
  $smarty->assign("dream",$dream);

  $smarty->display(ROOT.'/templates/member/aboutus.html');
  
?>