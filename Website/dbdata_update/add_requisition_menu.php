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
 
 
 $sql="
insert into tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,`status`)
values (13,'加盟申请','requisition.php',5,9,1,16,'A');
insert into tb_function_right(function_id,right_id,id) values (13,2,18);
";

 
 $sa=explode(";",$sql);
 $dbmgr->begin_trans();
 foreach ($sa as $value){
 	if(trim($value)!=""){
 		$query=$dbmgr->query($value);
 	}
 }
 $dbmgr->commit_trans();
 
// for($i=0;$i<count($array);$i++)
// {
// 	$id=$array[$i]["id"];
// 	$name=$array[$i]["name"];
// 	$position=$array[$i]["position"];
// 
// 	$sql="update tb_general set name='$name',position='$position'" .
// 			" where id=$id";
// 
//    
// 
// }
// 
 
 
?>