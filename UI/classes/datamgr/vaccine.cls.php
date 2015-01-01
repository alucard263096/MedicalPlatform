<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class VaccineMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new VaccineMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}

	public function getVaccineList(){
		Global $SysLangCode;
		$sql="select * from dr_tb_vaccine o
left join dr_tb_vaccine_lang ol on o.id=ol.oid and ol.lang='$SysLangCode'
where o.status='A' 
order by o.seq ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;

	}
	
	public function getVaccine($id){
		Global $SysLangCode,$SysLang;

		$id=mysql_real_escape_string($id);

		$sql="select o.*,ol.*,el.name effectname,el.description effectdescription from dr_tb_vaccine o
left join dr_tb_vaccine_lang ol on o.id=ol.oid and ol.lang='$SysLangCode'
left join dr_tb_effect_lang el on o.effect_id=el.oid and el.lang='$SysLangCode'
where o.status='A' and o.id=$id
order by o.seq ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 

		$result["is_hk_project"]=$result["is_hk_project"]=="Y"?$SysLang["common"]["yes"]:$SysLang["common"]["no"];
		$result["is_china_project"]=$result["is_china_project"]=="Y"?$SysLang["common"]["yes"]:$SysLang["common"]["no"];

		$uglist=$this->getUserGroup($result["used_group_id"]);

		$usergroup="";
		$sum=count($uglist);
		for($i=0;$i<$sum;$i++)
		{
			if($i>0){
				$usergroup=$usergroup.", ";
			}
			$usergroup=$usergroup.$uglist[$i]["name"];
		}
		$result["usergroup"]=$usergroup;

		return $result;

	}

	public function getUserGroup($ids){
		
		Global $SysLangCode;
		$sql="select * from dr_tb_used_group o
left join dr_tb_used_group_lang ol on o.id=ol.oid and ol.lang='$SysLangCode'
where o.status='A' and o.id in ( $ids )";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;

	}

	public function getVaccineDoctor($id){
		
		$id=mysql_real_escape_string($id);
		$sql="select * from dr_tb_doctor_vaccine where id=$id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;

	}

 }
 
 $vaccineMgr=VaccineMgr::getInstance();
 $vaccineMgr->dbmgr=$dbmgr;
 
 
 
 
?>