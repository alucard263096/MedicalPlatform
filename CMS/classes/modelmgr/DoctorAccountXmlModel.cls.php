<?php

class DoctorAccountXmlModel extends XmlModel{
	
	public function __construct($pagename){
		parent::__construct("doctoraccount",$pagename);
	}

	public function Save($dbMgr,$request,$sysuser){
	Global $SysLang; 
		if($request["primary_id"]==""){
			$login_id=$request["login_id"];
			$loginname=mysql_real_escape_string($login_id);
			$sql="select * from dr_tb_doctor_account where login_id='$login_id' ";
			$query = $dbMgr->query($sql);
			$userRows = $dbMgr->fetch_array_all($query); 
			if(count($userRows)>0){
				return $SysLang["user"]["loginnameduplicate"];
			}
		}

		return parent::Save($dbMgr,$request,$sysuser);

	}

}

?>