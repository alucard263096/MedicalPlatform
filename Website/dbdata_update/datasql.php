!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>骨水泥专家</title>
	<meta name="description" content="Heraeus is a globally active precious metals and technology Group with firm roots in Germany, headquartered in Hanau near Frankfurt.  The company has been family-owned for more than 160 years.  Precious metals, sensors, medical products, quartz glass and specialty lighting sources are the focus of our activities." />
	<meta name="keywords" content="innovation, innovations, responsibility, corporate responsibility, social engagement, initiative, initiatives,  diversity, future, technology report, technology magazine, product world, innovative, key competence, key competencies, Heraeus, business segments, Heraeus Quarzglas, Heraeus Noblelight, Heraeus Electro-Nite, precious metal, special metal, medical components, quartz glass, specialty lighting sources, careers, press, material technology" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="cleartype" content="on" />
	
	<script>(function(h){h.className=h.className.replace(/\bno-js\b/,'js')}(document.documentElement))</script>
	<script src="/PortalSite/themes/lm/index/internalnotforuse/scripts/modernizrcustom.js"></script>
	<link rel="stylesheet" href="/PortalSite/themes/lm/index/internalnotforuse/style.css" />
</head> 
<body>
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
 $array[]="tb_access_right";
 $array[]="tb_city";
 $array[]="tb_download_category";
 $array[]="tb_download_file";
 $array[]="tb_function";
 $array[]="tb_function_right";
 $array[]="tb_manager";
 $array[]="tb_partner";
 $array[]="tb_partner_type";
 $array[]="tb_province";
 $array[]="tb_seq";
 $array[]="tb_user";
 $array[]="tb_user_access_right";
 $array[]="tb_user_function";
 $array[]="tb_website_base";
 
 foreach ($array as $sql){
 	if(trim($sql)!=""){
 		$query=$dbmgr->query("select * from $sql");
  		$result = $dbmgr->fetch_array_all($query);
  		foreach ($result as $res){
  			$isql="insert into `$sql` (";
  			$isfirst=true;
  			foreach ($res as $colname=>$col){
  				if(!is_numeric($colname)){
  					if($isfirst==false){
  						$isql=$isql.",";
  					}
  					$isql=$isql."`$colname`";
  					$isfirst=false;
  				}
  			}
  			$isql=$isql." ) values (";
  			$isfirst=true;
  			foreach ($res as $colname=>$col){
  				if(!is_numeric($colname)){
  					if($isfirst==false){
  						$isql=$isql.",";
  					}
  					$vc=parameter_filter($col);
  					$isql=$isql."'$vc'";
  					$isfirst=false;
  				}
  			}
  			$isql=$isql." );\r\n";
  			echo $isql;
  			
  		}
 	}
 }
 
 
 
 
 
?>
</body>
</html>