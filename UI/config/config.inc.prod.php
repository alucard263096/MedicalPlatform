<?php

#[Root]
$CONFIG['rootpath']		= 'http://www.myhkdoc.com';  
//$CONFIG['charset']		= 'utf-8'; 
$CONFIG['Title']             = 'MedicalPlatform';
$CONFIG['URL']="http://www.myhkdoc.com";
$CONFIG['Domain']="www.myhkdoc.com";
$CONFIG["doctorurl"]="http://www.myhkdoc.com/DoctorCMS";
$CONFIG['lang']="zh-cn";//en-us
$CONFIG["SessionName"]="FooterCMSUI";
$CONFIG["SupportMultiLanguage"]=true;

$CONFIG['smarty']['rootpath']		= ''; 
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
$CONFIG['database']['host']		= 'localhost';  
$CONFIG['database']['database']	= 'medicalplatform';  
$CONFIG['database']['user']		= 'root';  
$CONFIG['database']['psw']		= 'root'; 


#[File upload]
$CONFIG['fileupload']['upload_path']	= "upload";
$CONFIG['fileupload']['nt_check']		= false; 
$CONFIG['fileupload']['ftp_url']		= "127.0.0.1";
$CONFIG['fileupload']['ftp_user']		= "anonymous";
$CONFIG['fileupload']['ftp_password']		= "";
$CONFIG['fileupload']['ftp_dir']		= "/";
$CONFIG['fileupload']['try_time']		= "3";
$CONFIG['fileupload']['try_interval']		= "1";//second


#[Excel]
$CONFIG['excel']['version']	= "Excel2007";//2003:Excel5,2007:Excel2007

#[QRCODE]
$CONFIG['qr_code']['level']="M";
$CONFIG['qr_code']['size']="5";
$CONFIG['qr_code']['folder']="qrcode";

?>