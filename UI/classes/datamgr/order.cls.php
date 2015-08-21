<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class OrderMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new OrderMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}

	public function createGeneOrder($member_id,$name,$mobile,$address,$remark
	,$gene_id,$price,
	$snapshot){
		
		

		$member_id=parameter_filter($member_id);
		$name=parameter_filter($name);
		$mobile=parameter_filter($mobile);
		$address=parameter_filter($address);
		$remark=parameter_filter($remark);
		$gene_id=parameter_filter($gene_id);
		$price=parameter_filter($price);
		$snapshot=parameter_filter($snapshot);
		
		

		$this->dbmgr->begin_trans();


		$sql="select ifnull(max(id),0)+1 from dr_tb_order";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		$id=$result[0];

		$order_no=$this->genOrderNo("GN");

		$sql="INSERT INTO `medicalplatform`.`dr_tb_order`
(`id`,`order_no`,`guid`,act,
`member_id`,`name`,`mobile`,`address`,`remark`,
`price`,`status`,
`created_time`,`snapshot`)
values 
($id,'$order_no','','gn',
$member_id,'$name','$mobile','$address','$remark',
$price,'P',now(),'') ";
		$query = $this->dbmgr->query($sql);

		$sql="INSERT INTO `medicalplatform`.`dr_tb_order_gene`
(`order_id`,`gene_id`)
values 
($id,$gene_id) ";
		$query = $this->dbmgr->query($sql);

		
		$sql="INSERT INTO `medicalplatform`.`dr_tb_order_payment`
(`order_id`,`payment`,`payment_type`,`real_payment`,`is_submit`)
values 
($id,'N','N','N','N') ";
		$query = $this->dbmgr->query($sql);

		
		$sql="INSERT INTO `medicalplatform`.`dr_tb_order_express`
(`order_id`)
values 
($id) ";
		$query = $this->dbmgr->query($sql);

		$this->updateGeneBookingCount($gene_id);

		$this->dbmgr->commit_trans();
		$arr["id"]=$id;
		return $arr;

	}

	public function updateGeneOrderPaymentInfo($id,$payment_type){

		$pin_code=md5("pt".$id);
		$payment_type=parameter_filter($payment_type);

		$sql="update dr_tb_order_payment set trade_pin_code='$pin_code',payment_type='$payment_type',is_submit='Y'
		where order_id=$id and is_submit='N'";
		//echo $sql;
		$query = $this->dbmgr->query($sql);
	}

	public function updateGeneAppointmentPayment($id,$trade_no){
		$trade_no=parameter_filter($trade_no);

		$sql="update dr_tb_order_payment set payment_time=now(),trade_no='$trade_no',payment='Y'
		where order_id=$id ";
		$query = $this->dbmgr->query($sql);
	}

	public function getBookingDateSelectedTime($office_id,$doctor_id,$order_date){

		$office_id=parameter_filter($office_id);
		$doctor_id=parameter_filter($doctor_id);
		$order_date=parameter_filter($order_date);

		$meetdays=$this->getOpenHour($office_id,$doctor_id,$order_date);

		$sql="select * from dr_tb_time 
where id not in ( 
select order_time from dr_tb_order o
inner join dr_tb_order_vaccine ovc on o.id=ovc.order_id
where ovc.office_id=$office_id and ovc.doctor_id=$doctor_id and o.order_date='$order_date' and o.status='P'
 ) and 
 ( id in ($meetdays) or id in (
select o_time from dr_tb_office_specialhour osp
where osp.office_id=$office_id and osp.doctor_id=$doctor_id and osp.o_date='$order_date' and osp.type='O'
 ))
and id not in (
select o_time from dr_tb_office_specialhour osp
where osp.office_id=$office_id and osp.doctor_id=$doctor_id and osp.o_date='$order_date' and osp.type='L'
)";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;

	}

	public function getOpenHour($office_id,$doctor_id,$order_date){
		$date=getdate(strtotime($order_date));  
		$wday=$date["wday"];
		
		$sql="select meet_day$wday from dr_tb_office_openhour
		where office_id=$office_id and doctor_id=$doctor_id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result[0];

	}

	public function genOrderNo($prefix){
		
		$d=date('Ym',time());
		$sql="select seq from dr_tb_order_no_gen
		where prefix='$prefix' and dateremark='$d' ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		$seq= $result[0];
		if($seq==""){
			$sql="insert into dr_tb_order_no_gen (prefix,dateremark,seq) values ('$prefix','$d',2)";
			$query = $this->dbmgr->query($sql);
			$seq= 1;
		}else{
			$sql="update dr_tb_order_no_gen set seq=seq+1 where prefix='$prefix' and dateremark='$d' ";
			$query = $this->dbmgr->query($sql);
		}
		return $prefix.$d.sprintf("%06d", $seq);

	}

	public function checkBookingUsed($office_id,$doctor_id,$order_date,$order_time){
		
		$sql="select 1 from dr_tb_order o
		inner join dr_tb_order_vaccine ovc on o.id=ovc.order_id
		where office_id=$office_id and doctor_id=$doctor_id and order_date='$order_date' and order_time=$order_time and status='P'";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return count($result)>0;
	}

	
	public function createVaccineOrder($member_id,$name,$mobile,$email,$idport_type,$idport,
	$order_date,$order_time,$vaccine_id,$doctor_id,$office_id,$price,
	$snapshot,$doctor_vaccine_id){
		

		$member_id=parameter_filter($member_id);
		$name=parameter_filter($name);
		$mobile=parameter_filter($mobile);
		$email=parameter_filter($email);
		$idport_type=parameter_filter($idport_type);
		$idport=parameter_filter($idport);
		$order_date=parameter_filter($order_date);
		$order_time=parameter_filter($order_time);
		$vaccine_id=parameter_filter($vaccine_id);
		$doctor_id=parameter_filter($doctor_id);
		$office_id=parameter_filter($office_id);
		$price=parameter_filter($price);
		$snapshot=parameter_filter($snapshot);
		
		

		$this->dbmgr->begin_trans();

		while(true){
			$guid=getSimpleGuid();
			$sql="select 1 from dr_tb_order o
		inner join dr_tb_order_vaccine ovc on o.id=ovc.order_id
		 where guid='$guid' and h_status='P' ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query);
			if(count($result)==0){
				break;
			}
		}

		//$guid=guid();

		$sql="select ifnull(max(id),0)+1 from dr_tb_order 
		";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		$id=$result[0];

		$order_no=$this->genOrderNo("VC");


		$sql="INSERT INTO `dr_tb_order`
(`id`,`order_no`,`guid`,act,
`member_id`,`name`,`mobile`,`idport_type`,`idport`,
`order_date`,`order_time`,`price`,
`status`,`created_time`,`snapshot`,h_status )
VALUES
($id,'$order_no','$guid','vc',$member_id,'$name','$mobile','$idport_type','$idport','$order_date',$order_time,$price,'P',now(),'$snapshot','P');
 ";
		$query = $this->dbmgr->query($sql);

		
		$sql="INSERT INTO `dr_tb_order_vaccine`
(`order_id`,vaccine_id,doctor_id,office_id )
VALUES
($id,$vaccine_id,$doctor_id,$office_id);
 ";
		$query = $this->dbmgr->query($sql);

		$this->updateDoctorBookingCount($doctor_id);
		$this->updateVaccineBookingCount($vaccine_id);

		$this->dbmgr->commit_trans();
		$arr["id"]=$id;
		$arr["guid"]=$guid;
		return $arr;

	}
	public function updateVaccineOrder($member_id,$name,$mobile,$email,$idport_type,$idport,
	$order_date,$order_time,$office_id,$price,
	$snapshot,$doctor_vaccine_id,$id){
		

		$member_id=parameter_filter($member_id);
		$name=parameter_filter($name);
		$mobile=parameter_filter($mobile);
		$email=parameter_filter($email);
		$idport_type=parameter_filter($idport_type);
		$idport=parameter_filter($idport);
		$order_date=parameter_filter($order_date);
		$order_time=parameter_filter($order_time);
		$office_id=parameter_filter($office_id);
		$price=parameter_filter($price);
		$snapshot=parameter_filter($snapshot);
		$id=parameter_filter($id);
		
		

		$this->dbmgr->begin_trans();

		$sql="select guid from dr_tb_order where id=$id ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query);
		$guid=$result["guid"];

		//$guid=guid();

		$sql="update `dr_tb_order` set
		`name`='$name',
		`mobile`='$mobile',
		`idport_type`='$idport_type',
		`idport`='$idport',
		`order_date`='$order_date',
		`order_time`='$order_time',
		`price`='$price',
		`status`='P'
		where id=$id and member_id=$member_id
		 ";

		$query = $this->dbmgr->query($sql);

		$sql="update `dr_tb_order_vaccine` set
		`office_id`='$office_id'
		where order_id=$id 
		 ";

		$query = $this->dbmgr->query($sql);

		$this->dbmgr->commit_trans();
		$arr["id"]=$id;
		$arr["guid"]=$guid;
		return $arr;

	}

	public function updateDoctorBookingCount($doctor_id){
		
		
		$sql="select 1 from dr_tb_doctor_value
where doctor_id=$doctor_id;
";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		if(count($result)>0){
			$sql="update dr_tb_doctor_value set booking_count=ifnull(booking_count,233)+1 where doctor_id=$doctor_id";

		}else{
			$sql="select ifnull(max(id),0)+1 from dr_tb_doctor_value";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			$id=$result[0];
			
			$sql="insert into dr_tb_doctor_value (id,doctor_id,booking_count) values ($id,$doctor_id,234)";
			
		}
		
		$query = $this->dbmgr->query($sql);
	}

	
	public function updateVaccineBookingCount($vaccine_id){
		
		
		$sql="select 1 from dr_tb_vaccine_value
where vaccine_id=$vaccine_id;
";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		if(count($result)>0){
			$sql="update dr_tb_vaccine_value set booking_count=ifnull(booking_count,233)+1 where vaccine_id=$vaccine_id";

		}else{
			$sql="select ifnull(max(id),0)+1 from dr_tb_vaccine_value";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			$id=$result[0];
			
			$sql="insert into dr_tb_vaccine_value (id,vaccine_id,booking_count) values ($id,$vaccine_id,234)";
		}
		
		$query = $this->dbmgr->query($sql);
	}
	
	public function updateGeneBookingCount($gene_id){
		
		
		$sql="select 1 from dr_tb_gene_value
where gene_id=$gene_id;
";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		if(count($result)>0){
			$sql="update dr_tb_gene_value set booking_count=ifnull(booking_count,233)+1 where gene_id=$gene_id";

		}else{
			$sql="select ifnull(max(id),0)+1 from dr_tb_gene_value";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			$id=$result[0];
			
			$sql="insert into dr_tb_gene_value (id,gene_id,booking_count) values ($id,$gene_id,234)";
		}
		
		$query = $this->dbmgr->query($sql);
	}

	public function getAppointmentList($member_id){
		Global $SysLangCode;

		$member_id=parameter_filter($member_id);
		$sql="select * from (";

		$sql.="select main.act,main.id,'vaccine' image_group,vaccine.name,vaccine.image image,doctor.name doctor,office.address message,
		main.order_date,main.status,main.created_time,'' payment,
		(TO_DAYS(NOW()) - TO_DAYS(main.order_date)) passdate 
		 from (select * from dr_tb_order o
		 inner join dr_tb_order_vaccine os on o.id=os.order_id and o.act='vc') main
inner join (select * from dr_tb_vaccine a left join dr_tb_vaccine_lang b on a.id=b.oid and b.lang='$SysLangCode') vaccine on main.vaccine_id=vaccine.id
inner join (select * from dr_tb_doctor a left join dr_tb_doctor_lang b on a.id=b.oid and b.lang='$SysLangCode') doctor on main.doctor_id=doctor.id
inner join (select * from dr_tb_office a left join dr_tb_office_lang b on a.id=b.oid and b.lang='$SysLangCode') office on main.office_id=office.id
inner join dr_tb_member m on main.member_id=m.id
inner join dr_tb_time t on main.order_time=t.id
where main.member_id=$member_id ";

		$sql.=" union ";

		$sql.="select main.act,main.id,'gene' image_group,gene.name,gene.image image,'' doctor,
		case main.status
when 'P' then '等待系统确认'
when 'M' then '系统已确认，等待寄出采集工具'
when 'K' then '采集工具已经寄出，等待回收标本'
when 'R' then '标本已收到，请耐心等待报告结果'
when 'G' then '报告已寄出，请耐心等待结果'
when 'F' then '已完成'
 end as message,
		'' order_date,main.status,main.created_time,main.payment,
		0 passdate 
		 from (select o.*,op.*,os.gene_id from dr_tb_order o
		 inner join dr_tb_order_payment op on o.id=op.order_id and o.act='gn'
		 inner join dr_tb_order_gene os on o.id=os.order_id and o.act='gn') main
inner join (select * from dr_tb_gene a left join dr_tb_gene_lang b on a.id=b.oid and b.lang='$SysLangCode') gene on main.gene_id=gene.id
inner join dr_tb_member m on main.member_id=m.id
where main.member_id=$member_id ";

		$sql.=" ) aa order by created_time";
		

		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		return $result;
	}
	

	public function getGeneAppointment($id,$order_no=""){
		Global $SysLangCode;

		$member_id=parameter_filter($member_id);
		$id=parameter_filter($id);
		$order_no=parameter_filter($order_no);
		$sql="select main.*,gene.name gene_name,
		case main.status
when 'P' then '等待系统确认'
when 'M' then '系统已确认，等待寄出采集工具'
when 'K' then '采集工具已经寄出，等待回收标本'
when 'R' then '标本已收到，请耐心等待报告结果'
when 'G' then '报告已寄出，请耐心等待结果'
when 'F' then '已完成'
 end as message
		  from (select o.*,op.*,os.gene_id from dr_tb_order o
		 inner join dr_tb_order_payment op on o.id=op.order_id and o.act='gn'
		 inner join dr_tb_order_gene os on o.id=os.order_id and o.act='gn') main
inner join (select * from dr_tb_gene a left join dr_tb_gene_lang b on a.id=b.oid and b.lang='$SysLangCode') gene on main.gene_id=gene.id
inner join dr_tb_member m on main.member_id=m.id
where 1=1 ";
		if($order_no==""){
			$sql.=" and main.id=$id";
		}else{
			$sql.=" and main.order_no='$order_no'";
		}

		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 

		return $result;
	}

	public function getVaccineAppointment($member_id,$id){
		Global $SysLangCode;

		$member_id=parameter_filter($member_id);
		$id=parameter_filter($id);
		$sql="select main.*,t.name order_rtime,doctor.name doctor_name,vaccine.name vaccine_name,office.name office_name,office.address office_address ,
		TO_DAYS(NOW()) - TO_DAYS(main.order_date) passdate
		  from (select * from dr_tb_order o
		 inner join dr_tb_order_vaccine os on o.id=os.order_id and o.act='vc') main
inner join (select * from dr_tb_vaccine a left join dr_tb_vaccine_lang b on a.id=b.oid and b.lang='$SysLangCode') vaccine on main.vaccine_id=vaccine.id
inner join (select * from dr_tb_doctor a left join dr_tb_doctor_lang b on a.id=b.oid and b.lang='$SysLangCode') doctor on main.doctor_id=doctor.id
inner join (select * from dr_tb_office a left join dr_tb_office_lang b on a.id=b.oid and b.lang='$SysLangCode') office on main.office_id=office.id
inner join dr_tb_member m on main.member_id=m.id
inner join dr_tb_time t on main.order_time=t.id
where main.member_id=$member_id and main.id=$id";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 

		return $result;
	}

	public function getVaccineAppointmentForCheck($member_id,$doctor_id,$vaccine_id){
	
		Global $SysLangCode;
		$sql="select a.id, a.idport_type,a.idport, a.order_no,a.price, o.name office_name,a.guid,a.order_date,t.name order_time,a.name clientname,a.mobile clientmobile 
		,TO_DAYS(NOW()) - TO_DAYS(a.order_date) passdate
		from (select * from dr_tb_order o
		 inner join dr_tb_order_vaccine os on o.id=os.order_id and o.act='vc') a
inner join dr_tb_office_lang o on a.office_id=o.oid and o.lang='$SysLangCode'
inner join dr_tb_time t on a.order_time=t.id
where a.member_id=$member_id
and a.doctor_id=$doctor_id
and a.vaccine_id=$vaccine_id
and a.status='P'
and TO_DAYS(NOW()) - TO_DAYS(a.order_date) <3
order by created_time desc";

		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 

		return $result;
	}

	public function getOrderData($id){
		$id=parameter_filter($id);
		$sql="select *
		,TO_DAYS(NOW()) - TO_DAYS(order_date) passdate
		from dr_v_order
where id=$id ";

		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;
	}

 }
 
 $orderMgr=OrderMgr::getInstance();
 $orderMgr->dbmgr=$dbmgr;
 
 
 
 
?>