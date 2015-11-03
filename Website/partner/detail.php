<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
require '../include/common.inc.php';
  require ROOT.'/include/front.inc.php';

//
//$info = array(
//    "seq" => "1",
//    "id" => "1",
//    "name" => "雷德睦华总代理（北京）",
//    "address" => "北京市丰台区马家堡东路106号自然新天地写字楼606室",
//    "summary" => "雷德睦华医药科技（北京）有限公司是德国PALACOS产品在中国的总代理。销售团队庞大，对所属供应商有着良好的管理。",
//    "tel" => "010-58032661",
//    "type"=> "1",
//    "cityid"=>"1",
//	"image"=>"building.jpg",
//    "x"=>"116.393358",
//    "y"=>"39.847141"
//);


require ROOT.'/classes/datamgr/partner.cls.php';

is_numeric( $_REQUEST["id"] ) or die('提供的参数不是数字');
$info=$partnerMgr->getPartner($_REQUEST["id"]);
$coo=explode(",", $info["coordinate"]);
$info["x"]=$coo[0];
$info["y"]=$coo[1];


  $smarty->assign('module',"partner");

$smarty->assign('info',$info);
$smarty->display(ROOT.'/templates/partner/detail.tpl');



?>