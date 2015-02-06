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
		if($CONFIG['solution_configuration']!="debug"&&isset($_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["vaccinedoctorlist_$vaccineid"])){
			return $_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["vaccinedoctorlist_$vaccineid"];
		}else{

			$vaccineid=mysql_real_escape_string($vaccineid);

			$sql="select distinct dv.doctor_id,dl.name doctor_name,d.photo,d.is_general,sl.name specialist
		,dv.price,dv.web_price,
		ifnull(dvv.service_level,4) service_level, ifnull(dvv.pro_level,4) pro_level, ifnull(dvv.facility_level,4) facility_level
		, ifnull(dvv.totle_score,4) totle_score
		 from dr_tb_doctor_vaccine dv 
inner join dr_tb_doctor d on dv.doctor_id=d.id and d.status='A'
left join dr_tb_doctor_lang dl on d.id=dl.oid and dl.lang='$SysLangCode'
left join dr_tb_doctor_value dvv on d.id=dvv.doctor_id
left join dr_tb_specialist_lang sl on d.specialist_id=sl.oid and sl.lang='$SysLangCode'
where dv.status='A' and dv.vaccine_id=$vaccineid 
order by totle_score";
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
				}
				$result[$i]["office_list"]=$arr;
				$result[$i]["office_count"]=count($arr);
				unset($arr);
			}
				$_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["vaccinedoctorlist_$vaccineid"]=$result;
				return $result;
		}
	}

	public function getDistrictCondition($doctor_list){
		Global $SysLangCode,$CONFIG;

		if($CONFIG['solution_configuration']!="debug"&&isset($_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["doctorlistcondition_$doctor_list"])){
			return $_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["doctorlistcondition_$doctor_list"];
		}else{
			
			$result=Array();
			
			$districtlist=$this->getDistrictList($doctor_list);
			$hotdistrictlist=$this->getHotDistrictList($doctor_list);
			$subwaylist=$this->getSubwayList($doctor_list);

			$result["district"]=$districtlist;
			$result["hotdistrict"]=$hotdistrictlist;
			$result["subway"]=$subwaylist;
		
			$_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["doctorlistcondition_$doctor_list"]=$result;
			return $result;
		}

	}

	public function getDistrictList($doctor_list){
		Global $SysLangCode;

		$sql="select distinct dc.id district_id,dcl.name from dr_tb_district dc
inner join dr_tb_block b on dc.id=b.district_id
inner join dr_tb_office o on b.id=o.block_id
inner join dr_tb_office_openhour oo on o.id=oo.office_id
left join dr_tb_district_lang dcl on dc.id=dcl.oid and dcl.lang='$SysLangCode'
where oo.doctor_id in ($doctor_list)";

			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query);

			$block_list=$this->getBlockListByDistrict($doctor_list);
			$count=count($result);

			for($i=0;$i<$count;$i++){
				$arr=Array();
				foreach ($block_list as $key=>$value){
					if($value["district_id"]==$result[$i]["district_id"]){
						$arr[]=$value;
					}
				}
				$result[$i]["block_list"]=$arr;
				unset($arr);
			}
			return $result;
	}


	public function getBlockListByDistrict($doctor_list){
		Global $SysLangCode;

			$sql="select distinct b.district_id,b.id block_id,bl.name from  dr_tb_block b 
inner join dr_tb_office o on b.id=o.block_id
inner join dr_tb_office_openhour oo on o.id=oo.office_id
left join dr_tb_block_lang bl on b.id=bl.oid  and bl.lang='$SysLangCode'
		where oo.doctor_id in ($doctor_list)";

			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query);

			return $result;
	}

	
	public function getHotDistrictList($doctor_list){
		Global $SysLangCode;

		$sql="select * from dr_tb_hot_district hd 
left join dr_tb_hot_district_lang hdl on hd.id=hdl.oid and hdl.lang='$SysLangCode' 
inner join dr_tb_office o on hd.id=o.hot_district_id
inner join dr_tb_office_openhour oo on o.id=oo.office_id
where oo.status='A' and oo.doctor_id in ($doctor_list) ";

			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query);

			return $result;
	}
	
	public function getSubwayList($doctor_list){
		Global $SysLangCode;

		$sql="select distinct dc.id subway_id,dcl.name from dr_tb_subway dc
inner join dr_tb_subway_station b on dc.id=b.subway_id
inner join dr_tb_office o on b.id=o.station1_id or b.id=o.station2_id
inner join dr_tb_office_openhour oo on o.id=oo.office_id
left join dr_tb_subway_lang dcl on dc.id=dcl.oid and dcl.lang='$SysLangCode'
where oo.doctor_id in ($doctor_list)";

			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query);

			$station_list=$this->getStationListBySubway($doctor_list);
			$count=count($result);

			for($i=0;$i<$count;$i++){
				$arr=Array();
				foreach ($station_list as $key=>$value){
					if($value["subway_id"]==$result[$i]["subway_id"]){
						$arr[]=$value;
					}
				}
				$result[$i]["station_list"]=$arr;
				unset($arr);
			}
			return $result;
	}


	public function getStationListBySubway($doctor_list){
		Global $SysLangCode;

			$sql="select distinct b.subway_id,b.id station_id,bl.name from  dr_tb_subway_station b 
inner join dr_tb_office o on b.id=o.station1_id or b.id=o.station2_id
inner join dr_tb_office_openhour oo on o.id=oo.office_id
left join dr_tb_subway_station_lang bl on b.id=bl.oid  and bl.lang='$SysLangCode'
		where oo.doctor_id in ($doctor_list)";
		//echo $sql;
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query);

			return $result;
	}

	public function getOfficeListByDoctor($doctor_list){
		Global $SysLangCode;
	
		$doctor_list=mysql_real_escape_string($doctor_list);

		$sql="select oo.*,o.coordinate,ol.name,ol.address,ol.description,ol.open_hour ,o.coordinate,
		substring(coordinate,1,length(SUBSTRING_INDEX(coordinate,\",\",1))) x,substring(coordinate,length(SUBSTRING_INDEX(coordinate,\",\",1))+2,length(coordinate))  y
		from dr_tb_office_openhour oo
inner join dr_tb_office o on oo.office_id=o.id and o.status='A'
left join dr_tb_office_lang ol on o.id=ol.oid and ol.lang='$SysLangCode' 
where oo.status='A' and oo.doctor_id in ($doctor_list) ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return $result;
	}

	public function getStandardDoctorValue(){
	Global $SysLangCode,$CONFIG;

		if($CONFIG['solution_configuration']!="debug"&&isset($_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["standard_doctor_value"])){
			return $_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["standard_doctor_value"];
		}else{
			
			
				$sql="select ifnull(avg(service_level),4) service_level,
		ifnull(avg(pro_level),4) pro_level,
		ifnull(avg(facility_level),4) facility_level,
		ifnull(avg(totle_score),4) totle_score from dr_tb_doctor_value";

		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 

			$_SESSION[SESSIONNAME]["doctor"][$SysLangCode]["standard_doctor_valuet"]=$result;
			return $result;
		}

	}
	
	public function getDoctor($doctor_id){
		Global $SysLangCode;
	
		$doctor_id=mysql_real_escape_string($doctor_id);

		$sql="select d.*,dl.*,sl.name specialist,
		ifnull(dvv.service_level,4) service_level, ifnull(dvv.pro_level,4) pro_level, ifnull(dvv.facility_level,4) facility_level
		, ifnull(dvv.totle_score,4) totle_score from dr_tb_doctor d
left join dr_tb_doctor_lang dl on d.id=dl.oid and dl.lang='$SysLangCode'
left join dr_tb_doctor_value dvv on d.id=dvv.doctor_id
left join dr_tb_specialist_lang sl on d.specialist_id=sl.oid and sl.lang='$SysLangCode'
where d.id=$doctor_id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 

		return $result;
	}
	
	

	

 }
 
 $doctorMgr=DoctorMgr::getInstance();
 $doctorMgr->dbmgr=$dbmgr;
 
 
 
 
?>