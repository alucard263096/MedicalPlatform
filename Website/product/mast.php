<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
require '../include/common.inc.php';
  require ROOT.'/include/front.inc.php';

$smarty->assign('module',"product");

$smarty->display(ROOT.'/templates/product/mast.tpl');



?>