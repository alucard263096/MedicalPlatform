<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class GeneAppointmentMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new GeneAppointmentMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	public function CheckGuidOnly($id,$guid){
		
		$id=mysql_real_escape_string($id);
		$guid=mysql_real_escape_string($guid);

		$sql="select 1 from  where id=$id and guid='$guid' ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return count($result)>0;
	}
	
	public function UpdateGuid($id,$guid,$user_id){
		
		$id=mysql_real_escape_string($id);
		$guid=mysql_real_escape_string($guid);

		$sql="update dr_tb_member_gene_order set guid='$guid', status='M',updated_user=$user_id,updated_date=now()
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}

	public function UpdateExpressNo($id,$express_no){
	
		$id=mysql_real_escape_string($id);
		$express_no=mysql_real_escape_string($express_no);

		$sql="update dr_tb_member_gene_order set express_no='$express_no', status='K'
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateReceive($id){
	
		$id=mysql_real_escape_string($id);

		$sql="update dr_tb_member_gene_order set status='R'
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateReportExpressNo($id,$report_express_no){
	
		$id=mysql_real_escape_string($id);
		$express_no=mysql_real_escape_string($express_no);

		$sql="update dr_tb_member_gene_order set express_no='$express_no', status='K'
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateFinished($id){
	
		$id=mysql_real_escape_string($id);

		$sql="update dr_tb_member_gene_order set status='F'
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}
 }
 
 $geneAppointmentMgr=GeneAppointmentMgr::getInstance();
 $geneAppointmentMgr->dbmgr=$dbmgr;
 
 
 
 
?>