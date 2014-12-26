<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class OfficeOpenHourMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new OfficeOpenHourMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function getOfficeOpenHour($id)
	{Global $SysLangCode;
		$id=mysql_real_escape_string($id);
		$sql="select a.id,a.doctor_id,a.office_id,bl.name office_name from dr_tb_office_openhour a
	inner join dr_tb_office b on a.office_id=b.id
	left join dr_tb_office_lang bl on b.id=bl.oid and bl.lang='$SysLangCode' 
	where a.status='A' and b.status='A' and a.id=$id ";
	
	$query = $this->dbmgr->query($sql);
	$result = $this->dbmgr->fetch_array($query);
		return $result;
	}

	public function getOfficeOpenHourList($doctor_id){
	Global $SysLangCode;
		$doctor_id=mysql_real_escape_string($doctor_id);

	$sql="select a.id,a.doctor_id,a.office_id,bl.name office_name from dr_tb_office_openhour a
	inner join dr_tb_office b on a.office_id=b.id
	left join dr_tb_office_lang bl on b.id=bl.oid and bl.lang='$SysLangCode' 
	where a.status='A' and b.status='A' and a.doctor_id=$doctor_id ";

	$query = $this->dbmgr->query($sql);
	$result = $this->dbmgr->fetch_array_all($query);

	return $result;
	}
	
	
 }
 
 $officeOpenHourMgr=OfficeOpenHourMgr::getInstance();
 $officeOpenHourMgr->dbmgr=$dbmgr;
 
 
 
 
?>