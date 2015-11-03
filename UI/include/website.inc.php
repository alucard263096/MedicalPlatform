<?php
$WebsiteConfig["applestore_id"]="123456";
$WebsiteConfig["googleplay_id"]="123456";

$agent = strtolower($_SERVER['HTTP_USER_AGENT']);
//echo $agent;
//·ÖÎöÊý¾Ý
//$is_pc = (strpos($agent, 'windows nt'))||(strpos($agent, 'mac')) ? 1 : 0;   
$is_iphone = (strpos($agent, 'iphone')) ? 1 : 0;   
$is_ipad = (strpos($agent, 'ipad')) ? 1 : 0;   
$is_android = (strpos($agent, 'android')) ? 1 : 0;   
if($is_iphone||$is_ipad||$is_android){
	$is_pc=0;
}else{
	$is_pc=1;
}

if($smarty!=null){

	if($CONFIG['solution_configuration']!="debug" && $is_pc==1){
		ParentRedirect($CONFIG["websiteurl"]);
		exit;
	}

	$smarty->assign("is_pc",$is_pc);
	$smarty->assign("is_iphone",$is_iphone);
	$smarty->assign("is_ipad",$is_ipad);
	$smarty->assign("is_android",$is_android);

	$smarty->assign("Webconfig",$WebsiteConfig);

}



?>