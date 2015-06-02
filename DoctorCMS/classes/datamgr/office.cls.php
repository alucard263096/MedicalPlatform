<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class OfficeMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new OfficeMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function getOfficeOpenHour($id)
	{Global $SysLangCode;
		$id=mysql_real_escape_string($id);
		$sql="select a.id,a.doctor_id,a.office_id,bl.name office_name from dr_tb_office_openhour a
	inner join dr_tb_office b on a.office_id=b.id
	left join dr_tb_office_lang bl on b.id=bl.oid and bl.lang='$SysLangCode' 
	where a.status='A' and b.status='A' and a.id=$id ";
	
	$query = $this->dbmgr->query($sql);
	$result = $this->dbmgr->fetch_array($query);
		return $result;
	}

	public function getOfficeOpenHourList($doctor_id){
	Global $SysLangCode;
		$doctor_id=mysql_real_escape_string($doctor_id);

	$sql="select a.id,a.doctor_id,a.office_id,bl.name office_name from dr_tb_office_openhour a
	inner join dr_tb_office b on a.office_id=b.id
	left join dr_tb_office_lang bl on b.id=bl.oid and bl.lang='$SysLangCode' 
	where a.status='A' and b.status='A' and a.doctor_id=$doctor_id ";

	$query = $this->dbmgr->query($sql);
	$result = $this->dbmgr->fetch_array_all($query);

	return $result;
	}
	
	public function getAppointmentList($office_id,$doctor_id,$start_date,$end_date){
		Global $SysLangCode;

		$office_id=mysql_real_escape_string($office_id);
		$doctor_id=mysql_real_escape_string($doctor_id);
		$start_date=mysql_real_escape_string($start_date);
		$end_date=mysql_real_escape_string($end_date);
		$sql="select main.*,ovc.*,doctor.name doctor_name,vaccine.name vaccine_name,office.name office_name,office.address office_address ,
		t.name order_rtime,t.start_time,t.end_time
from dr_tb_order main
inner join dr_tb_order_vaccine ovc on main.id=ovc.order_id
inner join (select * from dr_tb_doctor a left join dr_tb_doctor_lang b on a.id=b.oid and b.lang='$SysLangCode') doctor on ovc.doctor_id=doctor.id
inner join (select * from dr_tb_office a left join dr_tb_office_lang b on a.id=b.oid and b.lang='$SysLangCode') office on ovc.office_id=office.id
inner join (select * from dr_tb_vaccine a left join dr_tb_vaccine_lang b on a.id=b.oid and b.lang='$SysLangCode') vaccine on ovc.vaccine_id=vaccine.id
inner join dr_tb_member m on main.member_id=m.id
inner join dr_tb_time t on main.order_time=t.id
where ovc.office_id=$office_id and ovc.doctor_id=$doctor_id ";
if($start_date!="" && $end_date!=""){
 $sql=$sql." and main.order_date>='$start_date' and main.order_date<='$end_date' ";
 }else{
	$sql=$sql."  and (TO_DAYS(NOW()) - TO_DAYS(main.order_date))<=0 ";
 }
 $sql=$sql." order by main.order_date,main.order_time";

//
//inner join (select * from dr_tb_doctor a left join dr_tb_doctor_lang b on a.id=b.oid and b.lang='$SysLangCode') doctor on main.doctor_id=doctor.id
//inner join (select * from dr_tb_office a left join dr_tb_office_lang b on a.id=b.oid and b.lang='$SysLangCode') office on main.office_id=office.id
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		

		return $result;
	}

	public function getWorkDayTimeList($office_id,$doctor_id){
		Global $SysLangCode;
		$id=mysql_real_escape_string($id);
		$sql="select * from dr_tb_office_openhour 
	where office_id=$office_id and doctor_id=$doctor_id ";
	
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query);

		
		$sql="select * from dr_tb_time ";
		$query = $this->dbmgr->query($sql);
		$timetable = $this->dbmgr->fetch_array_all($query);

		$today=date("Y-m-d");
		//echo $today;
		$today_time = strtotime($today);
		$lastday_time=strtotime('+1 Month',$today_time);
		$lastday=date('Y-m-d',$lastday_time);
		//echo $lastday;

		$workArr=array();
		$workTimeArr=array();
		$curdate=$today;
		$curdate_time=$today_time;
		while($curdate_time<=$lastday_time){
			$dayweek=date("w",$curdate_time);
			$meet_day=$result["meet_day".$dayweek];

			if($meet_day!=""){
				if(count($workArr)==0||$workArr[count($workArr)-1]!=$curdate){
					$workArr[]=$curdate;
				}
				$meettime=explode(",",$meet_day);
				foreach($meettime as $val){
					$startdate=$timetable[$val-1]["start_time"];
					$startval=$val;
					$enddate=$timetable[$val-1]["end_time"];
					$endval=$val;

					$lastcount=count($workTimeArr)-1;
					if($lastcount>=0
					&&$workTimeArr[$lastcount]["date"]==$curdate
					&&$workTimeArr[$lastcount]["end_time_val"]==$val-1){

						$workTimeArr[$lastcount]["end_time"]=$enddate;
						$workTimeArr[$lastcount]["end_time_val"]=$endval;
						
					}else{
						$tarr=array();
						$tarr["date"]=$curdate;
						$tarr["start_time"]=$startdate;
						$tarr["end_time"]=$enddate;
						$tarr["start_time_val"]=$startval;
						$tarr["end_time_val"]=$endval;

						$workTimeArr[]=$tarr;
					}
				}
			}
			$curdate_time+=24*60*60;
			$curdate=date("Y-m-d",$curdate_time);
		}
		$ret["workday"]=$workArr;
		$ret["worktime"]=$workTimeArr;
		return $ret;
	}
 }
 
 $officeMgr=OfficeMgr::getInstance();
 $officeMgr->dbmgr=$dbmgr;
 
 
 
 
?>