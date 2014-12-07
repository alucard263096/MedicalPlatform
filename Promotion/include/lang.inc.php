<?php

//lang init
if($CONFIG['solution_configuration']!="debug"&&isset($_SESSION[SESSIONNAME]["Lang"])){
	$SysLang=$_SESSION[SESSIONNAME]["Lang"];
}else{
$path=ROOT."/lang/".$CONFIG["lang"].".xml";
$fp = fopen($path,"r");
$str = fread($fp,filesize($path));
$SysLang=json_decode(json_encode((array) simplexml_load_string($str)), true);
$_SESSION[SESSIONNAME]["Lang"]=$SysLang;
}

if($smarty!=null){

	$smarty->assign("SysLang",$SysLang);
	$smarty->assign("SysLangConfig",$SysLangConfig);

}

?>