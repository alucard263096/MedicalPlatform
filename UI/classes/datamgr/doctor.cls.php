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

	public function getPromotedDoctorList(){
		Global $SysLangCode,$CONFIG;

		if($CONFIG['solution_configuration']!="debug"&&isset($_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["promotedlist"])){
			return $_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["promotedlist"];
		}else{
		$sql="select doctor_list from dr_tb_doctor_promoted where id=1";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		$doctor_list=$result["doctor_list"];

		if($doctor_list!=""){
			$sql="select d.*,dl.*,dv.totle_score,sl.name specialist_id_str from dr_tb_doctor d
	left join dr_tb_doctor_lang dl on d.id=dl.oid and dl.lang='$SysLangCode'
	left join dr_tb_doctor_value dv on d.id=dv.doctor_id
    left join dr_tb_specialist_lang sl on d.specialist_id=sl.oid and sl.lang='$SysLangCode'
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
		Global $SysLangCode,$CONFIG;
		if($CONFIG['solution_configuration']!="debug"&&isset($_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["vaccinedoctorlist"])){
			return $_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["vaccinedoctorlist"];
		}else{

			$vaccineid=mysql_real_escape_string($vaccineid);

			$sql="select dv.doctor_id,dl.name doctor_name,d.is_general,d.specialist_id,sl.name specialist
		,dv.price,dv.web_price
		 from dr_tb_doctor_vaccine dv 
inner join dr_tb_doctor d on dv.doctor_id=d.id and d.status='A'
left join dr_tb_doctor_lang dl on d.id=dl.oid and dl.lang='$SysLangCode'
inner join dr_tb_doctor_value dvv on d.id=dvv.doctor_id
left join dr_tb_specialist_lang sl on d.specialist_id=sl.oid and sl.lang='$SysLangCode'
where dv.status='A' and dv.vaccine_id=$vaccineid ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query);


			$doctor_list=getListIdStr($result,"doctor_id");

			$office_list=$this->getOfficeListByDoctor($doctor_list);
			$count=count($result);
			for($i=0;$i<$count;$i++){
				$arr=Array();
				foreach ($office_list as $key=>$value){
					if($value["doctor_id"]==$result[$i]["doctor_id"]){
						$arr[]=$value;
					}
					$result[$i]["office_list"]=$arr;
					$result[$i]["office_count"]=count($arr);
					unset($arr);
				}
				$_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["vaccinedoctorlist"]=$result;
				return $result;
			}
		}
	}

	public function getDistrictListByDoctor($doctor_list){
		Global $SysLangCode;

		$sql="";

	}

	public function getOfficeListByDoctor($doctor_list){
		Global $SysLangCode;
	
		$doctor_list=mysql_real_escape_string($doctor_list);

		$sql="select oo.*,o.coordinate,ol.name,ol.address,ol.description,ol.open_hour 
		from dr_tb_office_openhour oo
inner join dr_tb_office o on oo.office_id=o.id and o.status='A'
left join dr_tb_office_lang ol on o.id=ol.oid and ol.lang='$SysLangCode' 
where oo.status='A' and oo.doctor_id in ($doctor_list) ";
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