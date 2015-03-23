<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class MemberMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new MemberMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}

	public function getMemberByEmailMobile($email,$mobile){
		Global $SysLangCode;

		$email=mysql_real_escape_string($email);
		$mobile=mysql_real_escape_string($mobile);

		$sql="select * from dr_tb_member
where status='A' and (  mobile='$mobile' )";//email='$email' or
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;

	}
	

	public function addMember($email,$mobile,$password,$name){
		
		$this->dbmgr->begin_trans();

		$email=mysql_real_escape_string($email);
		$mobile=mysql_real_escape_string($mobile);
		$password=mysql_real_escape_string($password);
		$name=mysql_real_escape_string($name);
		//logger_mgr::logDebug("a $password b");
		$password=md5($password);

		$sql="select ifnull(max(id),0)+1 from dr_tb_member";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		$id=$result[0];

		$sql="insert into dr_tb_member (id,email,mobile,password,name,status) values
		($id,'$email','$mobile','$password','$name','A')   ";
		$query = $this->dbmgr->query($sql);

		
		$this->dbmgr->commit_trans();

		return true;

	}
	
	public function getMemberDoctorList($member_id){
		Global $SysLangCode;
		$member_id=mysql_real_escape_string($member_id);
		$sql="select distinct d.id doctor_id,dl.name doctor_name,d.photo,d.is_general,sl.name specialist,dl.advanced,dl.pro_title,dl.advanced,
		ifnull(dvv.service_level,4) service_level, ifnull(dvv.pro_level,4) pro_level, ifnull(dvv.facility_level,4) facility_level
		, ifnull(dvv.totle_score,4) totle_score
		 from  dr_tb_doctor d 
left join dr_tb_doctor_lang dl on d.id=dl.oid and dl.lang='$SysLangCode'
left join dr_tb_doctor_value dvv on d.id=dvv.doctor_id
left join dr_tb_specialist_lang sl on d.specialist_id=sl.oid and sl.lang='$SysLangCode'
inner join dr_tb_member_doctor md on d.id=md.doctor_id
where d.status='A' and md.member_id=$member_id
order by totle_score";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return $result;

	}
	public function getMemberDoctor($member_id,$doctor_id){
		
		$member_id=mysql_real_escape_string($member_id);
		$doctor_id=mysql_real_escape_string($doctor_id);

		$sql="select * from dr_tb_member_doctor where member_id=$member_id and doctor_id=$doctor_id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return $result;
	}
	public function lookDoctor($member_id,$doctor_id){
		if(count($this->getMemberDoctor($member_id,$doctor_id))==0){
			$member_id=mysql_real_escape_string($member_id);
			$doctor_id=mysql_real_escape_string($doctor_id);

			$sql="insert into dr_tb_member_doctor (member_id,doctor_id) values ($member_id,$doctor_id) ";
			$query = $this->dbmgr->query($sql); 
		}
	}

	public function getMemberInfo($member_id){
		
		$member_id=mysql_real_escape_string($member_id);

		$sql="select * from dr_tb_member_info where member_id=$member_id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 

		return $result;

	}

	public function updateMemberInfo($member_id,$field,$value){
	
		$member_id=mysql_real_escape_string($member_id);
		$field=mysql_real_escape_string($field);
		$value=mysql_real_escape_string($value);

		if($field=="name"){
			$sql="update dr_tb_member set name='$value' where id=$member_id ";
			$query = $this->dbmgr->query($sql);
		}else{

			$sql="select 1 from dr_tb_member_info where member_id=$member_id ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query); 
			if(count($result)>0){
				$sql="update dr_tb_member_info set `$field`='$value' where member_id=$member_id ";
			}else{
				$sql="insert into dr_tb_member_info (member_id,`$field`) values ($member_id,'$value')";
			}
			
			$query = $this->dbmgr->query($sql);
		}


	}

 }
 
 $memberMgr=MemberMgr::getInstance();
 $memberMgr->dbmgr=$dbmgr;
 
 
 
 
?>