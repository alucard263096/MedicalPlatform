<?php
/*
 * Created on 2011-1-25
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  require 'include/common.inc.php';
  require ROOT.'/classes/mgr/download.cls.php';
  
  $filename=base64_decode($_REQUEST["filename"]);
  
  //file name,filepath
  $downloadMgr->downFileFromServer($filename,ROOT."/upload/".$filename);
  
  
  
  
  
  
?>
