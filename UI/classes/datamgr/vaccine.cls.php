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

	public function getVaccineCategory(){

		if(isset($_SESSION[SESSIONNAME]["vaccine"][$SysLangCode]["category"])){
			return $_SESSION[SESSIONNAME]["vaccine"][$SysLangCode]["category"];
		}else{

		$sql="select vc.id,vc.seq,vcl.name from 
		dr_tb_vaccine_category vc
		left join dr_tb_vaccine_category_lang vcl on vc.id=vcl.oid
		where vc.status='A' 
		order by vc.seq";
		$query = $this->dbmgr->query($sql);
		$categoryresult = $this->dbmgr->fetch_array_all($query); 

		$sql="select vcs.id,vcs.seq,vcs.name,vcs.vaccine_list from 
		dr_tb_vaccine_category_sub vcs
		left join dr_tb_vaccine_category_sub_lang vcsl on vcs.id=vcsl.oid
		dr_tb_vaccine_category vc on vcs.category_id=vc.id and vc.status='A'
		where vcs.status='A' 
		order by vcs.seq";
		$query = $this->dbmgr->query($sql);
		$subresult = $this->dbmgr->fetch_array_all($query); 

		$vccount=count($categoryresult);

		for($i=0;$i<$vccount;$i++){
			$sublist=Array();
			$count=0;
			$vcscount=count($subresult);
			for($j=0;$j<$vcscount;$j++){
				$subcount=count(explode(",",$subresult[$j]["vaccine_list"]));
				$subresult[$j]["count"]=$subcount;
				$count+=$subcount;
				$sublist[]=$subresult[$j];
			}
			$categoryresult[$i]["count"]=$count;
			$categoryresult[$i]["sub"]=$sublist;
		}
		
			$_SESSION[SESSIONNAME]["vaccine"][$SysLangCode]["category"]=$categoryresult;
			return $categoryresult;
		}

	}

	public function getPromotedVaccineList(){
		Global $SysLangCode;

		if(isset($_SESSION[SESSIONNAME]["vaccine"][$SysLangCode]["promotedlist"])){
			return $_SESSION[SESSIONNAME]["vaccine"][$SysLangCode]["promotedlist"];
		}else{
		$sql="select vaccine_list from dr_tb_vaccine_promoted where id=1";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		$vaccine_list=$result["vaccine_list"];

		if($doctor_list!=""){
			$sql="select o.*,ol.*,ifnull(ov.booking_count,0) from dr_tb_vaccine o
left join dr_tb_vaccine_lang ol on o.id=ol.oid and ol.lang='$SysLangCode'
	left join dr_tb_vaccine_value ov on d.id=dv.vaccine
	where o.id in ($vaccine_list) and o.status='A'
	order by booking_count
	limit 0,2 ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query); 
		}else{
			$result=Array();
		}

			$_SESSION[SESSIONNAME]["vaccine"][$SysLangCode]["promotedlist"]=$result;
			return $result;
		}
	}

	public function getVaccineList(){
		Global $SysLangCode;
		$sql="select o.id vaccine_id, 
		ol.name vaccine_name,ol.effect vaccine_effect,ol.used_group vaccine_used_group ,ifnull(ov.booking_count,0)
		from dr_tb_vaccine o
left join dr_tb_vaccine_lang ol on o.id=ol.oid and ol.lang='$SysLangCode'
inner join dr_tb_docto_vaccine dv on dv.vaccine_id=o.id and dv.status='A'
inner join dr_tb_doctor d on dv.doctor_id=d.id and d.status='A'
left join dr_tb_vaccine_value ov on d.id=dv.vaccine
where o.status='A' 
order by booking_count ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;

	}
	
	public function getVaccine($id){
		Global $SysLangCode,$SysLang;

		$id=mysql_real_escape_string($id);

		$sql="select o.*,ol.*
		from dr_tb_vaccine o
left join dr_tb_vaccine_lang ol on o.id=ol.oid and ol.lang='$SysLangCode'
where o.status='A' and o.id=$id
order by o.seq ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
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