<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class CityMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new CityMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	public  function getAllProvince(){
		$sql="select * from tb_province";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	public  function getCityList($province_id){
		$sql="select * from tb_city where cityUpIdNum=$province_id";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
	
 }
 
 $cityMgr=CityMgr::getInstance();
 $cityMgr->dbmgr=$dbmgr;
 
 
 
 
?>