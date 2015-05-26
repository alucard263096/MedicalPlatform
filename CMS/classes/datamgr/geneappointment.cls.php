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

	public function GetAppointmentInfo($id){
		
		$sql="select main.*,gene.name gene_name,
		case main.status
when 'P' then '等待系统确认'
when 'M' then '系统已确认，等待寄出采集工具'
when 'K' then '采集工具已经寄出，等待回收标本'
when 'R' then '标本已收到，请耐心等待报告结果'
when 'G' then '报告已寄出，请耐心等待结果'
when 'F' then '已完成'
 end as message
		  from (select * from dr_tb_order o
		 inner join dr_tb_order_gene os on o.id=os.order_id and o.act='ge')  main
inner join (select * from dr_tb_gene a left join dr_tb_gene_lang b on a.id=b.oid and b.lang='zh-cn') gene on main.gene_id=gene.id
inner join dr_tb_member m on main.member_id=m.id
where 1=1 and main.id=$id ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		
		return $result;
	}

	public function CheckGuidOnly($id,$guid){
		
		$id=mysql_real_escape_string($id);
		$guid=mysql_real_escape_string($guid);

		$sql="select 1 from dr_tb_order where id=$id and guid='$guid' ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return count($result)>0;
	}
	
	public function UpdateGuid($id,$guid,$user_id){
		
		$id=mysql_real_escape_string($id);
		$guid=mysql_real_escape_string($guid);

		$sql="update dr_tb_order set guid='$guid', status='M',updated_user=$user_id,updated_date=now()
		where id=$id ";
		$query = $this->dbmgr->query($sql);

			$sql="update dr_tb_order_payment set real_payment='Y',real_payment_confirmer=$user_id,real_payment_confirm_date=now()
		where order_id=$id ";
		$query = $this->dbmgr->query($sql);
	}

	public function UpdateExpressNo($id,$express_com,$express_no){
	
		$id=mysql_real_escape_string($id);
		$express_no=mysql_real_escape_string($express_no);
		$express_com=mysql_real_escape_string($express_com);

		$sql="update dr_tb_order set status='K'
		where id=$id ";
		$query = $this->dbmgr->query($sql);

		
		$sql="update dr_tb_order_express set express_no='$express_no',express_com='$express_com'
		where order_id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateReceive($id){
	
		$id=mysql_real_escape_string($id);

		$sql="update dr_tb_order set status='R'
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateReportExpressNo($id,$report_express_com,$report_express_no){
	
		$id=mysql_real_escape_string($id);
		$report_express_no=mysql_real_escape_string($report_express_no);
		$report_express_com=mysql_real_escape_string($report_express_com);

		$sql="update dr_tb_order set  status='G'
		where id=$id ";
		$query = $this->dbmgr->query($sql);

		$sql="update dr_tb_order_express set report_express_no='$report_express_no', report_express_com='$report_express_com'
		where order_id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateFinished($id){
	
		$id=mysql_real_escape_string($id);

		$sql="update dr_tb_order set status='F'
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}
 }
 
 $geneAppointmentMgr=GeneAppointmentMgr::getInstance();
 $geneAppointmentMgr->dbmgr=$dbmgr;
 
 
 
 
?>