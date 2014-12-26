<?php

//login redirect
if(!isset($_SESSION[SESSIONNAME]["Welcome"]))
{
	$_SESSION[SESSIONNAME]["Welcome"]=1;
	$smarty->assign("request_url","http://".$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"]);
	$smarty->display(ROOT.'/templates/mobile/welcome.html');
	exit();
}


?>