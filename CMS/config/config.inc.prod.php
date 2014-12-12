<?php

#[Root]
$CONFIG['rootpath']		= '/CMS';  
//$CONFIG['charset']		= 'utf-8'; 
$CONFIG['Title']             = '医汇通';
$CONFIG['URL']="http://www.helpfooter.com/CMS";
$CONFIG['lang']="zh-cn";//en-us
$CONFIG["frontendurl"]="http://www.helpfooter.com/Promotion";
$CONFIG["SessionName"]="FooterCMS";

$CONFIG['smarty']['rootpath']		= '/CMS'; 
$CONFIG['solution_configuration']='debug';
$CONFIG['server']		= 'windows';   //windows or linux

#[Smarty config]
$CONFIG['smarty']['compile_check']=true; 
$CONFIG['smarty']['debugging']=false; 
$CONFIG['smarty']['caching']=false; 
$CONFIG['smarty']['cache_lifetime']=3600; //second,-1 is always on 


#[log]
$CONFIG['logsavedir'] 		= 'logs/';	
$CONFIG['error_handler'] ="E_ALL";




#[Database]
$CONFIG['database']['provider']	= 'mysql';  //mssql,sqlsrv
$CONFIG['database']['host']		= 'hdm-122.hichina.com';  
$CONFIG['database']['database']	= 'hdm1220145_db';  
$CONFIG['database']['user']		= 'hdm1220145';  
$CONFIG['database']['psw']		= 'abcd1234'; 


#[File upload]
$CONFIG['fileupload']['upload_path']	= "../upload";
$CONFIG['fileupload']['nt_check']		= false; 
$CONFIG['fileupload']['ftp_url']		= "127.0.0.1";
$CONFIG['fileupload']['ftp_user']		= "anonymous";
$CONFIG['fileupload']['ftp_password']		= "";
$CONFIG['fileupload']['ftp_dir']		= "/";
$CONFIG['fileupload']['try_time']		= "3";
$CONFIG['fileupload']['try_interval']		= "1";//second


#[Excel]
$CONFIG['excel']['version']	= "Excel2007";//2003:Excel5,2007:Excel2007


?>