<?php

require ROOT.'/libs/CCPRestSDK.php';

class SmsMgr
{
	//logger_mgr::logDebug("sql :$sql");
	
	private	$accountSid;
	private	$accountToken;
	private	$appId;
	private	$serverIP;
	private	$serverPort;
	private	$softVersion;
	private	$timeout;
	public static $dbmgr = null;

	private $rest;
	
	private static $instance = null;
	
	public static function getInstance() 
	{
		return self::$instance!=null ? self::$instance : new SmsMgr();
	}
	
	private function __construct()
	{
		Global $CONFIG;
		$this->accountSid=$CONFIG["sms"]["AccountSid"];
		$this->accountToken=$CONFIG["sms"]["AccountToken"];
		$this->appId=$CONFIG["sms"]["AppId"];
		$this->serverIP=$CONFIG["sms"]["ServerIP"];
		$this->serverPort=$CONFIG["sms"]["ServerPort"];
		$this->softVersion=$CONFIG["sms"]["SoftVersion"];
		$this->timeout=$CONFIG["sms"]["timeout"];
	}

	private function resetSDK(){
		$this->rest = new REST($this->serverIP,$this->serverPort,$this->softVersion);
		 $this->rest->setAccount($this->accountSid,$this->accountToken);
		 $this->rest->setAppId($this->appId);
	}

	public function getLastSent($mobile,$type){
		
		$mobile=mysql_real_escape_string($mobile);
		$type=mysql_real_escape_string($type);
		$timeout=mysql_real_escape_string($this->timeout);

		$sql="select id, code, ((UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(lastsent_time))/60) lastsent,((UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(created_time))/60) created_mins 
		from dr_tb_sms_code 
		where mobile='$mobile' and type='$type' 
		and ((UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(created_time))/60)<$timeout
		order by lastsent_time desc
		limit 0,1";
		//echo $sql;
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		//print_r($result);
		if($result["code"]==""){
			$result["code"]="uncandocodecode";
		}
		return $result;
	}

	public function SendRegisterVerifyCodeMessage($mobile){
		Global $CONFIG;
		$templeteId=$CONFIG["sms"]["templeteid"]["reg"];
		$this->PerpareSendWithVerifyCode($mobile,"G",$templeteId);
	}

	public function SendLoginVerifyCodeMessage($mobile){
		Global $CONFIG;
		$templeteId=$CONFIG["sms"]["templeteid"]["login"];
		$this->PerpareSendWithVerifyCode($mobile,"L",$templeteId);
	}

	public function SendPSWModifyVerifyCodeMessage($mobile){
		Global $CONFIG;
		$templeteId=$CONFIG["sms"]["templeteid"]["psw_modify"];
		$this->PerpareSendWithVerifyCode($mobile,"M",$templeteId);
	}

	public function SendVaccineOrderInfoMessage($orderInfo){
		Global $CONFIG;
		$mobile=$orderInfo["mobile"];
		$vaccine=$orderInfo["vaccine_name"];
		$order_datetime=$orderInfo["order_date"]." ".$orderInfo["order_rtime"];
		$office=$orderInfo["office_address"];
		$guid=$orderInfo["guid"];

		$templeteId=$CONFIG["sms"]["templeteid"]["vaccine_order_info"];
		$arr=Array($order_datetime,$vaccine,$guid,$office);
		$result=$this->Send($mobile,$arr,$templeteId);
	}

	private function PerpareSendWithVerifyCode($mobile,$type,$templeteId){
		$lstrs=$this->getLastSent($mobile,$type);
		if($lstrs["id"]==""){
			$verifycode=$this->genVerifyCode(6,"NUMBER");
		}else{
			if($lstrs["lastsent"]<1){
				return;
			}
			$verifycode=$lstrs["code"];
		}
		$arr=Array($verifycode,$this->timeout);
		$result=$this->Send($mobile,$arr,$templeteId);
		if($result){
			
			$mobile=mysql_real_escape_string($mobile);
			$verifycode=mysql_real_escape_string($verifycode);
			$verifycode=mysql_real_escape_string($verifycode);
			$templeteId=mysql_real_escape_string($templeteId);

			if($lstrs["id"]==""){
				$sql="select ifnull(max(id),0)+1 from dr_tb_sms_code";
				$query = $this->dbmgr->query($sql);
				$result = $this->dbmgr->fetch_array($query); 
				$id=$result[0];

				$sql="insert into dr_tb_sms_code (id,`mobile`,`code`,`type`,created_time,lastsent_time,templete_id)
				values ($id,'$mobile','$verifycode','$type',now(),now(),'$templeteId')";
			}else{
				$id=$lstrs["id"];
				$sql="update dr_tb_sms_code set lastsent_time=now() where id=$id ";
			}
			$query = $this->dbmgr->query($sql);
		}
	}

	private function genVerifyCode($len=6,$format='ALL') { 
		 switch($format) { 
		 case 'ALL':
		 $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-@#~'; break;
		 case 'CHAR':
		 $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-@#~'; break;
		 case 'NUMBER':
		 $chars='0123456789'; break;
		 default :
		 $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-@#~'; 
		 break;
		 }
		 mt_srand((double)microtime()*1000000*getmypid()); 
		 $password="";
		 while(strlen($password)<$len)
			$password.=substr($chars,(mt_rand()%strlen($chars)),1);
		 return $password;
	 } 

	private function Send($to,$arr,$templeteId){
	//return true;
		$this->resetSDK();

		$result = $this->rest->sendTemplateSMS($to,$arr,$templeteId);

		if($result->statusCode!=0) {
			 $str= "error code :" . $result->statusCode . " ";
			 $str.= "error msg :" . $result->statusMsg . " ";
			 logger_mgr::logError("sms :$str");
			 //echo $str;
			 //TODO ��Ӵ������߼�
			 return false;
		 }else{
			 $str= "Sendind TemplateSMS success! ";
			 // ��ȡ������Ϣ
			 $smsmessage = $result->TemplateSMS;
			 $str.= "dateCreated:".$smsmessage->dateCreated." ";
			 $str.=  "smsMessageSid:".$smsmessage->smsMessageSid."";
			 //TODO ��ӳɹ������߼�
			 logger_mgr::logDebug("sms :$str");
			 //echo $str;
			 return true;
		 }
		return false;
	}

	public function SendTest($to){

		$this->resetSDK();

		$arr=array('3','10');
		$result = $this->rest->sendTemplateSMS($to,$arr,"1");

		if($result->statusCode!=0) {
			 $str= "error code :" . $result->statusCode . " ";
			 $str.= "error msg :" . $result->statusMsg . " ";
			 logger_mgr::logError("sms :$str");
			 //TODO ��Ӵ������߼�
		 }else{
			 $str= "Sendind TemplateSMS success! ";
			 // ��ȡ������Ϣ
			 $smsmessage = $result->TemplateSMS;
			 $str.= "dateCreated:".$smsmessage->dateCreated." ";
			 $str.=  "smsMessageSid:".$smsmessage->smsMessageSid."";
			 //TODO ��ӳɹ������߼�
			 logger_mgr::logDebug("sms :$str");
		 }

	}
  
}




$smsMgr = SmsMgr::getInstance();
$smsMgr->dbmgr=$dbmgr;

?>