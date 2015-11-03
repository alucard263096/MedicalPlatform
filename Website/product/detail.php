<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
require '../include/common.inc.php';
  require ROOT.'/include/front.inc.php';
 require ROOT.'/classes/datamgr/product.cls.php';
 
$smarty->assign('module',"product");
$result=$productMgr->getProduct($_REQUEST["id"]);

$smarty->assign('pcid',$result["category_id"]);
$smarty->assign('info',$result);



$smarty->display(ROOT.'/templates/product/detail.tpl');



?>