<?php

class DoctorQueryXmlModel extends XmlModel{
	
	public function __construct($pagename){
		parent::__construct("doctorquery",$pagename);
	}

	public function Save($dbMgr,$request,$sysuser){
	Global $SysLang,$smsMgr; 
		$ret=parent::Save($dbMgr,$request,$sysuser);
		if(substr($ret,0,5)=="right"){
			if($request["status"]=="F"){
				$smsMgr->SendQueryConfirm($request["member_mobile"],$request["submit_date"]);
			}
		}

		return $ret;

	}

}

?>