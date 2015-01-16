<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class DoctorMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new DoctorMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}

	public getPromotedDoctorList(){
		Global $SysLangCode;

		if(isset($_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["promotedlist"])){
			return $_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["promotedlist"];
		}else{
		$sql="select doctor_list from dr_tb_doctor_promoted where id=1";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		$doctor_list=$result["doctor_list"];

		if($doctor_list!=""){
			$sql="select d.*,dl.*,dv.totle_score from dr_tb_doctor d
	left join dr_tb_doctor_lang dl on d.id=dl.oid and dl.lang='$SysLangCode'
	left join dr_tb_doctor_value dv on d.id=dv.doctor_id
	where d.id in ($doctor_list) and d.status='A'
	order by totle_score
	limit 0,4 ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query); 
		}else{
			$result=Array();
		}

			$_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["promotedlist"]=$result;
			return $result;
		}
	}

	public function getVaccineDoctorList($vaccineid){
		Global $SysLangCode;

		$vaccineid=mysql_real_escape_string($vaccineid);

		$sql="select dv.*,dl.name doctorname,d.photo,dl.summary doctorsummary from dr_tb_doctor_vaccine dv 
inner join dr_tb_doctor d on dv.doctor_id=d.id and d.status='A'
left join dr_tb_doctor_lang dl on d.id=dl.oid and dl.lang='$SysLangCode'
where dv.status='A' and dv.vaccine_id=$vaccineid ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;

	}

	public function getOfficeListByDoctor($doctor_id){
		Global $SysLangCode;
	
		$doctor_id=mysql_real_escape_string($doctor_id);

		$sql="select  oo.*,o.coordinate,ol.name,ol.address,ol.description,ol.open_hour from dr_tb_office_openhour oo
inner join dr_tb_office o on oo.office_id=o.id and o.status='A'
left join dr_tb_office_lang ol on o.id=ol.oid and ol.lang='$SysLangCode' 
where oo.status='A' and oo.doctor_id=$doctor_id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return $result;
	}
	
	public function getDoctor($doctor_id){
		Global $SysLangCode;
	
		$doctor_id=mysql_real_escape_string($doctor_id);

		$sql="select * from dr_tb_doctor d
left join dr_tb_doctor_lang dl on d.id=dl.oid and dl.lang='$SysLangCode'
where d.id=$doctor_id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 

		return $result;
	}
	
	

	

 }
 
 $doctorMgr=DoctorMgr::getInstance();
 $doctorMgr->dbmgr=$dbmgr;
 
 
 
 
?>