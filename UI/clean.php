<?php

  require 'include/common.inc.php';

  
  $sql="
 select id,photo from dr_tb_doctor
";
	$query = $dbmgr->query($sql);
	$result = $dbmgr->fetch_array_all($query); 
	
	for($i=0;$i<count($result);$i++){
		
		$path=ROOT."/../upload/doctor_photo/".$result[$i]["photo"];
		if (!file_exists($path)) { 
			$sql="update dr_tb_doctor set photo='' where id=".$result[$i]["id"];
				$query = $dbmgr->query($sql);
		}else{
		
			//echo $path;
		}
	}
	echo "done";


?>