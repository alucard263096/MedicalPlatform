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
insert into tb_general (id,`key`,name,position,type,content,updated_user,updated_date) values
(2,'contact_us_company','联系我们公司信息','联系我们顶部','string','',1,now())
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