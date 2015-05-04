<?php

class DoctorGeneXmlModel extends XmlModel{
	
	public function __construct($pagename){
		parent::__construct("doctorgene",$pagename);
	}

	public function Save($dbMgr,$request,$sysuser){
	Global $SysLang; 
		if($request["primary_id"]==""){
			$gene_id=$request["gene_id"];
			$code=mysql_real_escape_string($code);
			$sql="select * from dr_tb_doctor_gene where gene_id='$gene_id' ";
			$query = $dbMgr->query($sql);
			$userRows = $dbMgr->fetch_array_all($query); 
			if(count($userRows)>0){
				return $SysLang["gene"]["genedefineindoctorgene"];
			}
		}

		return parent::Save($dbMgr,$request,$sysuser);
	}

}

?>