<?php
/*
 * Created on 2011-4-10
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
  require '../include/common.inc.php';
  /*
  $query=$dbmgr->query("select function_id,function_name from tb_function");
  $result = $dbmgr->fetch_array_all($query); 
  print_r($result);
 */
 
 
 $array=array();
 
 
 $a=array();
 $a["id"]=1;
 $a["name"]='企业介绍';
 $a["position"]='企业介绍';
 $array[]=$a;
 
 
 for($i=0;$i<count($array);$i++)
 {
 	$id=$array[$i]["id"];
 	$name=$array[$i]["name"];
 	$position=$array[$i]["position"];
 
 	$sql="update tb_general set name='$name',position='$position'" .
 			" where id=$id";
 
    $query=$dbmgr->query($sql);
 
 }
 
 
 
?>