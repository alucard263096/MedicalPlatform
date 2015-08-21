<?php

class GeneXmlModel extends XmlModel{
	
	public function __construct($pagename){
		parent::__construct("gene",$pagename);
	}

	public function Save($dbMgr,$request,$sysuser){
	Global $SysLang; 
		if($request["primary_id"]==""){
			$code=$request["code"];
			$code=parameter_filter($code);
			$sql="select * from dr_tb_gene where code='$code' ";
			$query = $dbMgr->query($sql);
			$userRows = $dbMgr->fetch_array_all($query); 
			if(count($userRows)>0){
				return $SysLang["gene"]["codehasbeenused"];
			}
		}

		return parent::Save($dbMgr,$request,$sysuser);
	}

}

?>