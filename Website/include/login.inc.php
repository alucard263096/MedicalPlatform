<?php

if(!isset($_SESSION["sysUser"]))
{
	
	$_SESSION["url_request"]="http://".$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
	WindowRedirect($CONFIG['smarty']['rootpath']."/Admin/login.php");
	exit();
}

if(isset($_SESSION["url_request"]))
{
	$url_request=$_SESSION["url_request"];
	unset($_SESSION["url_request"]);
	WindowRedirect($url_request);
	exit();
}

$str=$_SERVER["REQUEST_URI"];
$strc=explode("?", $str);
$strA=explode("/", $strc[0]);
$request_uri=$strA[count($strA)-1];
//print_r($_SESSION["sysMenu"]);

$cr_id="";
if(isset($smarty)&&isset($_SESSION["sysMenu"]))
{
	$menu=$_SESSION["sysMenu"];
	for($i=0;$i<count($menu);$i++)
	{
		for($j=0;$j<count($menu[$i]["sub_function"]);$j++)
		{
			$fc=$menu[$i]["sub_function"][$j]["function_name"];
			$cr=$menu[$i]["sub_function"][$j]["function_link"];
			//echo strstr($cr,$request_uri);
			if(strstr($cr,$request_uri)
			||$getpremmis_id==$menu[$i]["sub_function"][$j]["function_id"])
			{
				$smarty->assign("Subtitle",$fc);
				$cr_id=$menu[$i]["sub_function"][$j]["function_id"];
				
				
				foreach($menu[$i]["sub_function"][$j]["access_right"] as $ckey => $cvalue)
				{
					foreach($CONFIG["access_right"] as $key => $value)
					{
						if($cvalue["right_id"]==$value)
						{
							$smarty->assign($key,"0");
						}
					}
				}
			}
		}
	}
}
if(isset($checkpremmis_id))
{
	if($checkpremmis_id!=$cr_id)
	{
		$_SESSION["sysInfoMsg"]="没有访问该网页的权限";
		//WindowRedirect($CONFIG['smarty']['rootpath']."/Admin/home.php");
		//exit();
	}
 $smarty->assign('currentFunctionId',$checkpremmis_id);
	
}

$menuJson=getMenuJson($_SESSION["sysMenu"]);


 $smarty->assign('sysUserName',$_SESSION["sysUser"]["user_name"]);
 $smarty->assign('sysMenu',$_SESSION["sysMenu"]);
 $smarty->assign('sysMenuJson',$menuJson);
 $smarty->assign('menu_direction',"H");
 //$smarty->assign('sysA',"0");
 //$smarty->assign('sysU',"0");
 ///$smarty->assign('sysD',"0");

 
 
 
 
 
 
 
 
 
 
 
 

?>