<?php
 require 'include/common.inc.php';
 require ROOT.'/classes/obj/upload.php';
 $field=$_REQUEST["field"];
 $module=$_REQUEST["module"];
 $file=$_FILES[$field];
 $filename=date('ymdHIs').$file["name"];
 $folder=ROOT."/upload/$module/";
 if(!file_exists($folder)){
	mkdir($folder,0777);
 }
 $file=new Upload($file,$filename,$folder,true);
 echo $file->safetyUpload();
 echo "|~~|".$filename;





?>