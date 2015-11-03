<?php

#[Root]
$CONFIG['rootpath']		= '/Website';  
$CONFIG['charset']		= 'utf-8'; 
$CONFIG['Title']             = 'ИлвНЛу';
$CONFIG['URL']="http://www.myhkdoc.com/Website";

$CONFIG['smarty']['rootpath']		= '/Website'; 
$CONFIG['smarty']['rootpaths']		= '/Website'; 
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


#[lang]
$CONFIG['language']['default']='zh-sc';


#[Database]
$CONFIG['database']['provider']	= 'mysql';  //mssql,sqlsrv
$CONFIG['database']['host']		= 'myhkdoc.com';  
$CONFIG['database']['database']	= 'website';  
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

#[File upload]
$CONFIG['email']['host']	= "smtp.gmail.com";
$CONFIG['email']['port']	= "465";
$CONFIG['email']['charset']	= "utf-8";
$CONFIG['email']['encoding']	= "base64";
$CONFIG['email']['username']	= "sooncai@tedgeco.com";
$CONFIG['email']['password']	= "aerith123";
$CONFIG['email']['from']	= "sooncai@tedgeco.com";
$CONFIG['email']['from_name']	= "Tedgeco";
$CONFIG['email']['is_smtp']	= true;
$CONFIG['email']['smtp_auth']	= true;
$CONFIG['email']['smtp_secure']	= "ssl";


$CONFIG["function"]["general"]="2";
$CONFIG["function"]["download"]="3";
$CONFIG["function"]["news"]="4";
$CONFIG["function"]["manager"]="6";
$CONFIG["function"]["partner"]="10";
$CONFIG["function"]["user"]="8";
$CONFIG["function"]["website"]="9";
$CONFIG["function"]["product_category"]="11";
$CONFIG["function"]["product"]="12";
$CONFIG["function"]["requisition"]="13";


$CONFIG["access_right"]["sysA"]="2";
$CONFIG["access_right"]["sysU"]="2";
$CONFIG["access_right"]["sysD"]="3";
$CONFIG["access_right"]["sysV"]="4";



#[Excel]
$CONFIG['excel']['version']	= "Excel2007";//2003:Excel5,2007:Excel2007


?>