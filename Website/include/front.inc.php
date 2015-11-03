<?php
 require ROOT.'/classes/datamgr/website.cls.php';
if(!isset($_SESSION["sitesetting"]))
{
 $sitesetting=$websiteMgr->getWebsiteBase();
 $_SESSION["sitesetting"]=$sitesetting;
}else{
	$sitesetting=$_SESSION["sitesetting"];
}
 $smarty->assign("sitesetting",$sitesetting);
 
 
if(!isset($_SESSION["productmenu"]))
{
 $productmenu=$websiteMgr->getProductMenu();
 $_SESSION["productmenu"]=$productmenu;
}else{
	$productmenu=$_SESSION["productmenu"];
}
 $smarty->assign("productmenu",$productmenu);
 
 
 
 
?>