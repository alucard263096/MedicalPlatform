<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
require '../include/common.inc.php';
  require ROOT.'/include/front.inc.php';
require ROOT.'/classes/datamgr/partner.cls.php';
require ROOT.'/classes/datamgr/city.cls.php';


 $partnertype=$partnerMgr->getPartnerType();	
 $smarty->assign("ptlist",$partnertype);
 
 
 $result=$partnerMgr->getPartnerList();
$smarty->assign('partnerlist',$result);

 $citylist=$partnerMgr->getPartnerCityList();
$smarty->assign('citylist',$citylist);

//print_r($result);

$smarty->assign('ptselected',$_REQUEST["type"]);
  $smarty->assign('module',"partner");
//$smarty->assign('partnerlist',$result);
$smarty->display(ROOT.'/templates/partner/index.tpl');



?>