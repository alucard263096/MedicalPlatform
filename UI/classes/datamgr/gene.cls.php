<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class GeneMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new GeneMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}

	public function getGeneList(){
	Global $SysLangCode;

		$sql="select g.id,g.image,gl.name,gl.summary,gl.used_group,ifnull(gv.booking_count,30) booking_count 
		from dr_tb_gene g 
		inner join dr_tb_gene_lang gl on g.id=gl.oid and gl.lang='$SysLangCode' 
		left join dr_tb_gene_value gv on g.id=gv.gene_id 
		where g.status='A'
		order by g.seq ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return $result;
	}

	public function getGene($id){
		Global $SysLangCode,$SysLang;

		$id=mysql_real_escape_string($id);

		$sql="select *
		from dr_tb_gene o
left join dr_tb_gene_lang ol on o.id=ol.oid and ol.lang='$SysLangCode'
where o.status='A' and o.id=$id
order by o.seq ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;

	}
 }
 
 $geneMgr=GeneMgr::getInstance();
 $geneMgr->dbmgr=$dbmgr;
 
 
 
 
?>