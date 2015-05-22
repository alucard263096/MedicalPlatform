<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class BusinessMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new BusinessMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function getReminderCount($user_id)
	{
		$sum=0;
		
		$sql="
		select count(1) count,'dr_tb_order' name 
from dr_tb_order where status='C' and h_status='P' and act='vc'
union
select count(1) count,'dr_tb_requirement' name from dr_tb_requirement where handling_user=$user_id and handling_type='P'
union
select count(1) count,'dr_tb_requirement' name from dr_tb_requirement where submit_user=$user_id and handling_type<>'P'  and review_type='P' 
union
select count(1) count,'dr_tb_member_question' name from dr_tb_member_question where status='P' and doctor_id=0 
union
select count(1) count,'dr_tb_order' name 
from dr_tb_order o
inner join dr_tb_order_payment p on o.id=p.order_id
where o.status='P' and p.payment='Y' and o.guid='' and o.act='gn'";

		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		//print_r($result);
		for($i=0;$i<count($result);$i++){
			$sum=$sum+$result[$i]["count"];
		}

		return $sum;
	}

	public function getReminderAll($user_id){
		Global $CONFIG;
		$Array=Array();

		$arr=Array();
		$arr["name"]="疫苗预约取消";
		$user_id=mysql_real_escape_string($user_id);
		$sql="select id,name as first,
 mobile  as second,order_date  as third 
from dr_tb_order 
where status='C' and h_status='P' and act='vc'
order by updated_date desc
		limit 0,3 ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		$arr["result"]=$result;
		$arr["first"]="客户姓名";
		$arr["second"]="手机号码";
		$arr["third"]="预约日期";
		$arr["count"]=count($result);
		$arr["link"]=$CONFIG['rootpath']."/Appointment/appointment.php";
		$Array[]=$arr;

		
		$arr=Array();
		$arr["name"]="需求等待修改";
		$user_id=mysql_real_escape_string($user_id);
		$sql="select  m.id,m.title as first,
case m.type when 'R' then '新需求' else  'Bug' end as second,user.user_name as third 
from dr_tb_requirement m
inner join dr_tb_user user on m.submit_user=user.id
		where handling_user=$user_id and handling_type='P' 
        order by m.updated_date desc
		limit 0,3 ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		$arr["result"]=$result;
		$arr["first"]="需求标题";
		$arr["second"]="需求类型";
		$arr["third"]="提交人";
		$arr["count"]=count($result);
		$arr["link"]=$CONFIG['rootpath']."/Other/requirement.php";
		$Array[]=$arr;

		
		$arr=Array();
		$arr["name"]="需求等待审阅";
		$user_id=mysql_real_escape_string($user_id);
		$sql="select  m.id,m.title as first,
case m.handling_type when 'F' then '已处理' else  '不处理' end as second,user.user_name as third 
from dr_tb_requirement m
inner join dr_tb_user user on m.handling_user=user.id
		where submit_user=$user_id and handling_type<>'P'  and review_type='P'
        order by m.updated_date desc
		limit 0,3 ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		$arr["result"]=$result;
		$arr["first"]="需求标题";
		$arr["second"]="处理结果";
		$arr["third"]="处理人";
		$arr["count"]=count($result);
		$arr["link"]=$CONFIG['rootpath']."/Other/requirement.php";
		$Array[]=$arr;

		
		$arr=Array();
		$arr["name"]="等待处理客户问题";
		$user_id=mysql_real_escape_string($user_id);
		$sql="select  m.id,m.member_name as first,
 m.member_mobile as second,m.submit_date as third 
from dr_tb_member_question m
		where status='P' and doctor_id=0
        order by m.submit_date desc
		limit 0,3 ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		$arr["result"]=$result;
		$arr["first"]="客户名称";
		$arr["second"]="客户名称";
		$arr["third"]="提交日期";
		$arr["count"]=count($result);
		$arr["link"]=$CONFIG['rootpath']."/Appointment/doctorquery.php";
		$Array[]=$arr;

		
		$arr=Array();
		$arr["name"]="等待添加唯一码的基因检测";
		$user_id=mysql_real_escape_string($user_id);
		$sql="select o.id,o.name as first,
 gl.name as second,created_time as third 
from dr_tb_order o
inner join dr_tb_order_payment p on o.id=p.order_id
inner join dr_tb_order_gene og on o.id=og.order_id
inner join dr_tb_gene_lang gl on og.gene_id=gl.oid and gl.lang='zh-cn'
where o.status='P' and p.payment='Y' and o.guid='' and o.act='gn'
		order by created_time
		limit 0,3 ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		$arr["result"]=$result;
		$arr["first"]="客户名称";
		$arr["second"]="基因检测项目";
		$arr["third"]="医生名称";
		$arr["count"]=count($result);
		$arr["link"]=$CONFIG['rootpath']."/Appointment/geneappointment.php";
		$Array[]=$arr;

		return $Array;

	}
	
 }
 
 $businessMgr=BusinessMgr::getInstance();
 $businessMgr->dbmgr=$dbmgr;
 
 
 
 
?>