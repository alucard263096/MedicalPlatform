<?php

	require ROOT.'/libs/smarty/Smarty.class.php';

$smarty = new Smarty;

$smarty->compile_check = $CONFIG['smarty']['compile_check'];
$smarty->debugging = $CONFIG['smarty']['debugging'];
$smarty->caching=$CONFIG['smarty']['caching'];
$smarty->cache_lifetime=$CONFIG['smarty']['cache_lifetime'];
$smarty->compile_dir=ROOT."/templates_c";
$smarty->cache_dir=ROOT."/cache";
$smarty->left_delimiter="<{";
$smarty->right_delimiter="}>";



 $smarty->assign('rootpath',$CONFIG['smarty']['rootpath']);
 $smarty->assign('smarty_root',ROOT."/templates");
 $smarty->assign('file_url',$_SERVER["PHP_SELF"]);
 $rep= array('&lang=en-us'=>'','&lang=zh-sc'=>'','&lang=zh-tc'=>'');
 $smarty->assign('file_url_parameter',strtr($_SERVER["QUERY_STRING"],$rep));
 $rep=array($CONFIG['smarty']['rootpath']=>'');
 $smarty->assign('script_path',strtr($_SERVER["PHP_SELF"],$rep));
 $smarty->assign('LANG',$LANG);
 $smarty->assign('lang',$lang);
 $smarty->assign('charset',$CONFIG['charset']);
 $smarty->assign('Title',$CONFIG['Title']);
 $smarty->assign('Url',$CONFIG['URL']);
?>