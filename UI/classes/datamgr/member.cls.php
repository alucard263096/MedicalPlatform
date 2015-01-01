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
where status='A' and ( email='$email' or mobile='$mobile' )";
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

 }
 
 $memberMgr=MemberMgr::getInstance();
 $memberMgr->dbmgr=$dbmgr;
 
 
 
 
?>