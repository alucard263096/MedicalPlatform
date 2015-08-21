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
when 'P' then '�ȴ�ϵͳȷ��'
when 'M' then 'ϵͳ��ȷ�ϣ��ȴ��ĳ��ɼ�����'
when 'K' then '�ɼ������Ѿ��ĳ����ȴ����ձ걾'
when 'R' then '�걾���յ��������ĵȴ�������'
when 'G' then '�����Ѽĳ��������ĵȴ����'
when 'F' then '�����'
 end as message
		  from (select * from dr_tb_order o
		 inner join dr_tb_order_gene os on o.id=os.order_id and o.act='gn')  main
inner join (select * from dr_tb_gene a left join dr_tb_gene_lang b on a.id=b.oid and b.lang='zh-cn') gene on main.gene_id=gene.id
inner join dr_tb_member m on main.member_id=m.id
where 1=1 and main.id=$id ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		
		return $result;
	}

	public function CheckGuidOnly($id,$guid){
		
		$id=parameter_filter($id);
		$guid=parameter_filter($guid);

		$sql="select 1 from dr_tb_order where id=$id and guid='$guid' ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return count($result)>0;
	}
	
	public function UpdateGuid($id,$guid,$user_id){
		
		$id=parameter_filter($id);
		$guid=parameter_filter($guid);

		$sql="update dr_tb_order set guid='$guid', status='M',updated_user=$user_id,updated_date=now()
		where id=$id ";
		$query = $this->dbmgr->query($sql);

			$sql="update dr_tb_order_payment set real_payment='Y',real_payment_confirmer=$user_id,real_payment_confirm_date=now()
		where order_id=$id ";
		$query = $this->dbmgr->query($sql);
	}

	public function UpdateExpressNo($id,$express_com,$express_no){
	
		$id=parameter_filter($id);
		$express_no=parameter_filter($express_no);
		$express_com=parameter_filter($express_com);

		$sql="update dr_tb_order set status='K'
		where id=$id ";
		$query = $this->dbmgr->query($sql);

		
		$sql="update dr_tb_order_express set express_no='$express_no',express_com='$express_com'
		where order_id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateReceive($id){
	
		$id=parameter_filter($id);

		$sql="update dr_tb_order set status='R'
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateReportExpressNo($id,$report_express_com,$report_express_no){
	
		$id=parameter_filter($id);
		$report_express_no=parameter_filter($report_express_no);
		$report_express_com=parameter_filter($report_express_com);

		$sql="update dr_tb_order set  status='G'
		where id=$id ";
		$query = $this->dbmgr->query($sql);

		$sql="update dr_tb_order_express set report_express_no='$report_express_no', report_express_com='$report_express_com'
		where order_id=$id ";
		$query = $this->dbmgr->query($sql);
	}
	public function UpdateFinished($id){
	
		$id=parameter_filter($id);

		$sql="update dr_tb_order set status='F'
		where id=$id ";
		$query = $this->dbmgr->query($sql);
	}
 }
 
 $geneAppointmentMgr=GeneAppointmentMgr::getInstance();
 $geneAppointmentMgr->dbmgr=$dbmgr;
 
 
 
 
?>