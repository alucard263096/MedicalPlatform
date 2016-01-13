<?php

//login redirect
if(!isset($_SESSION[SESSIONNAME]["Welcome"])&&$isdisplaylogin!=false)
{
	$_SESSION[SESSIONNAME]["Welcome"]=1;
	$smarty->assign("request_url","http://".$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"]);
	$smarty->display(ROOT.'/templates/mobile/welcome.html');
	exit();
}

if(isset($_SESSION[SESSIONNAME]["Member"])){
	$MemberInfo=$_SESSION[SESSIONNAME]["Member"];
	$smarty->assign("HasLogin","1");
	$smarty->assign("MemberInfo",$MemberInfo);
}

$user_agent = $_SERVER['HTTP_USER_AGENT'];
if (strpos($user_agent, 'MicroMessenger') === false) {
    
	$smarty->assign("payment_type","alipay_wap");
} else {
   
	$smarty->assign("payment_type","wx_pub");
}

?>