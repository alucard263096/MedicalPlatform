<?php
/*
 * Created on 2012-6-30
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require '../include/common.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  require ROOT.'/classes/datamgr/gene.cls.php';
  require ROOT."/classes/mgr/qrcode.cls.php";
  require ROOT.'/classes/datamgr/sms.cls.php';

  if(!isset($_SESSION[SESSIONNAME]["Member"])){
	
	echo "WITHOUTLOGIN";
	exit();
  }
  $member=$_SESSION[SESSIONNAME]["Member"];
  $member_id=$member["id"];
  $name=$_REQUEST["name"];
  $mobile=$_REQUEST["mobile"];
  $mobile=$_REQUEST["address"];
  $remark=$_REQUEST["remark"];
  $price=$_REQUEST["price"];
  $gene_id=$_REQUEST["gene_id"];
  $doctor_id=$_REQUEST["doctor_id"];
  $snapshot=$_REQUEST["snapshot"];

  $action=$_REQUEST["action"];
  $modify_id=$_REQUEST["tag"];

  $info=$geneMgr->getGene($gene_id);

  $arr=$orderMgr->createGeneOrder($member_id,$name,$mobile,$address,$remark
  ,$gene_id,$doctor_id,$info["price"],
	$snapshot);

  echo "SUCCESS".$arr["id"].",".$arr["id"];
  
?>