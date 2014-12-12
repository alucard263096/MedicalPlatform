<?php

class VaccineXmlModel extends XmlModel{
	
	public function __construct($pagename){
		parent::__construct("vaccine",$pagename);
	}

	public function Save($dbMgr,$request,$sysuser){
	Global $SysLang; 
		if($request["primary_id"]==""){
			$code=$request["code"];
			$code=mysql_real_escape_string($code);
			$sql="select * from dr_tb_vaccine where code='$code' ";
			$query = $dbMgr->query($sql);
			$userRows = $dbMgr->fetch_array_all($query); 
			if(count($userRows)>0){
				return $SysLang["vaccine"]["codehasbeenused"];
			}
		}

		return parent::Save($dbMgr,$request,$sysuser);

	}

}

?>