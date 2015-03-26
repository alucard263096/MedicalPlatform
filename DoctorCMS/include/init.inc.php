<?php

//login redirect
if(!isset($_SESSION[SESSIONNAME]["SysUser"]))
{
	$_SESSION[SESSIONNAME]["url_request"]="http://".$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
	WindowRedirect($CONFIG['smarty']['rootpath']."/index.php");
	exit();
}

if(isset($_SESSION[SESSIONNAME]["url_request"]))
{
	$url_request=$_SESSION[SESSIONNAME]["url_request"];
	unset($_SESSION[SESSIONNAME]["url_request"]);
	WindowRedirect($url_request);
	exit();
}

$SysUser=$_SESSION[SESSIONNAME]["SysUser"];

//Menu init
if(1==2&&isset($_SESSION[SESSIONNAME]["SystemMenu"])){
	$MenuArray=$_SESSION[SESSIONNAME]["SystemMenu"];
}else{

$path=ROOT."/model/menu.xml";
$fp = fopen($path,"r");
$str = fread($fp,filesize($path));
$MenuArray=json_decode(json_encode((array) simplexml_load_string($str)), true);
 if($CONFIG["SupportMultiLanguage"]==true){
		$MenuArray=ResetNameWithLang($MenuArray,$SysLangCode);
	  }
	
	
  require ROOT.'/classes/datamgr/office.cls.php';
  $result=$officeMgr->getOfficeOpenHourList($SysUser["doctor_id"]);
	$sum=count($result);
	for($i=0;$i<$sum;$i++){
		//mainmenus.mainmenu
		for($j=0;$j<count($MenuArray["mainmenus"]["mainmenu"]);$j++){

			if($MenuArray["mainmenus"]["mainmenu"][$j]["module"]=="info"){

					$arr=Array();
					$arr["id"]="officeopenhour_".$result[$i]["office_id"]."_add";
					$arr["name"]=$result[$i]["office_name"].$SysLang["info"]["openhour"];
					$arr["url"]="/Info/officeopenhour.php?id=".base64_encode($result[$i]["office_id"]);

					$MenuArray["mainmenus"]["mainmenu"][$j]["submenus"]["submenu"][]=$arr;
			}

			
			if($MenuArray["mainmenus"]["mainmenu"][$j]["module"]=="appointment"){

					$arr=Array();
					$arr["id"]="agenda_".$result[$i]["office_id"];
					$arr["name"]=$result[$i]["office_name"].$SysLang["appointment"]["agenda"];
					$arr["url"]="/Appointment/agenda.php?id=".base64_encode($result[$i]["office_id"]);

					$MenuArray["mainmenus"]["mainmenu"][$j]["submenus"]["submenu"][]=$arr;
			}

		}
	}



$_SESSION[SESSIONNAME]["SystemMenu"]=$MenuArray;
}

if($smarty!=null){
	$smarty->assign("SystemMenu",$MenuArray);
	$smarty->assign("SysUser",$SysUser);
}

?>