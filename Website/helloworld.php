<?php
/*
 * Created on 2011-1-22
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require 'include/common.inc.php';
  require ROOT.'/classes/datamgr/db_example.php';
  require ROOT.'/classes/obj/upload.php';
 $file=$_FILES["file"];
 print_r($_FILES);
 
 $file=new Upload($file,$file["name"],"",false);
 echo $file->getSize();
 echo $file->safetyUpload();
 
?>