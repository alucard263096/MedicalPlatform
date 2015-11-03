<?php
/*
 * Created on 2011-1-24
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 class DownloadMgr
 {
 	
	private static $instance = null;
	public static function getInstance() 
	{
		return self::$instance!=null ? self::$instance : new DownloadMgr();
	}
 	public function downFileFromServer($showFileName, $downFilePath)
    {
        if(file_exists($downFilePath))
        {
            if(is_readable($downFilePath))
            {
                if(Trim($showFileName) == '')
                {
                	$showFileName = 'undefined';
                }
                ob_start();
                ob_clean();
                $file_size = filesize($downFilePath);
                header('Content-Encoding:none');
                header('Cache-Control:private');
                header('Content-Length:' . $file_size);
                header('Content-Disposition:attachment; filename=' . $showFileName);
                header('Content-Type:application/octet-stream');
                readfile($downFilePath);
                ob_flush();
            }
        }
    }	
 	
 }
 
$downloadMgr = DownloadMgr::getInstance();
 
 
 
 
 
 
 
?>