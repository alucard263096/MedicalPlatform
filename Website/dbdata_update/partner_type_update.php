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
INSERT INTO tb_partner_type VALUES ('S','供应商','A');
INSERT INTO tb_partner_type VALUES ('H','医疗机构','A');
INSERT INTO tb_partner_type VALUES ('D','医生','A'); 
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