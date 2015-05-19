<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/mgr/express.cls.php';
  $expressMgr=new ExpressMgr();
  $nu=$_REQUEST["id"];
  $com=$_REQUEST["com"];

  $arr=$expressMgr->getExpressInfo($com,$nu);

  if($arr["errCode"]=="0"){
		echo $arr["expTextName"]."<br />";
	foreach ($arr["data"]["item"] as $val) {
		echo $val["time"]."&nbsp;&nbsp;&nbsp;&nbsp;".$val["context"]."<br />";
	}
  }else{
	echo "暂无返回";
  }

?>