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
	public function changePassword($member_id,$password){
		$password=md5($password);
		$sql="update dr_tb_member set password='$password' where id=$member_id ";
		$query = $this->dbmgr->query($sql);
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
		ifnull(dvv.service_level,5) service_level, ifnull(dvv.pro_level,5) pro_level, ifnull(dvv.facility_level,5) facility_level
		, ifnull(dvv.totle_score,5) totle_score
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

	public function hasReply($member_id){
		
		$sql="select 1 from dr_tb_member_question
where member_id=$member_id
and reply<>'' 
and `read`='0'
limit 0,1";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return count($result)>0?"TRUE":"FALSE";
	}
	
	public function readQuestion($questionid,$member_id){
		
		$questionid=mysql_real_escape_string($questionid);
		$member_id=mysql_real_escape_string($member_id);

		$sql="update dr_tb_member_question set `read`='1' where member_id=$member_id and id=$questionid ";
		$query = $this->dbmgr->query($sql);
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
	public function submitFeedback($name,$mobile,$description){

	$sql="select ifnull(max(id),0)+1 from dr_tb_requirement";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		$id=$result[0];

		$description.=">>>>>>>$mobile,$name";

		$description=mysql_real_escape_string($description);

		$sql="
		INSERT INTO `medicalplatform`.`dr_tb_requirement`
(`id`,
`submit_user`,
`title`,
`type`,
`description`,
`attachment_1`,
`attachment_2`,
`attachment_3`,
`handling_comment`,
`handling_type`,
`handling_user`,
`review_type`,
`review_comment`,
`created_user`,
`created_date`,
`updated_user`,
`updated_date`)
VALUES
($id,
3,
'客户反馈',
'C',
'$description',
'',
'',
'',
'',
'P',
3,
'P',
'',
2,
now(),
2,
now())
";

			$query = $this->dbmgr->query($sql);
	}

 }
 
 $memberMgr=MemberMgr::getInstance();
 $memberMgr->dbmgr=$dbmgr;
 
 
 
 
?>