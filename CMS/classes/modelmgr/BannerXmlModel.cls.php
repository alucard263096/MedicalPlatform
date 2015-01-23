<?php

class BannerXmlModel extends XmlModel{
	
	public function __construct($pagename){
		parent::__construct("banner",$pagename);
	}

	
	public function Save($dbMgr,$request,$sysuser){
	Global $SysLang; 
		if($request["primary_id"]==""){
			$code=$request["code"];
			$code=mysql_real_escape_string($code);
			$sql="select * from dr_tb_banner where code='$code' ";
			$query = $dbMgr->query($sql);
			$userRows = $dbMgr->fetch_array_all($query); 
			if(count($userRows)>0){
				return "此广告代码已经被使用";
			}
		}

		return parent::Save($dbMgr,$request,$sysuser);

	}

}

?>