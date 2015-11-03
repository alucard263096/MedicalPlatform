<?php
/*
 * Created on 2011-1-22
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
 require_once ROOT."/libs/phpmailer.cls.php";
 
 class Email
{
	public $host	= null;
	public $port	= null;
	public $charset	=  null;
	public $encoding	=  null;
	public $username	= null;
	public $password	= null;
	public $from	=  null;
	public $from_name	=  null;
	public $is_smtp	=  null;
	public $smtp_auth	= null;
	public $smtp_secure	= null;

	private static $instance = null;
	public static function getInstance() 
	{
		return self::$instance!=null ? self::$instance : new Email();
	}
	
	public function Send($address,$subject,$content,$isHtml)
	{
			
	 	$mail = new PHPMailer();
	 	if($this->is_smtp)
	 	{
			$mail->IsSMTP();
	 	}
		$mail->SMTPAuth = $this->smtp_auth;   //启用SMTP验证功能
		$mail->SMTPSecure = $this->smtp_secure;
		$mail->IsHTML($isHtml);
		$mail->Host = $this->host;   //企业邮局域名
		$mail->Port = $this->port;
		
		$mail->SMTPDebug  = 1;
		$mail->CharSet = $this->charset;
		$mail->Encoding = $this->encoding;
		$mail->WordWrap = 50;
		$mail->Username = $this->username;
		$mail->Password = $this->password;
		$mail->From =  $this->from;
		$mail->FromName =  $this->from_name;
		$mail->AddAddress($address);
		//$mail->AddReplayTo('','');
		//$mail->AddAttachment('');
		//$mail->IsHTML(true);
		$mail->Subject = $subject;
		$mail->Body = $content;
		//$body = $mail->getFile('contents.html');
		//$body = eregi_replace("[\]",'',$body);
		
		if(!$mail->Send()){
			logger_mgr::logError($mail->ErrorInfo) ;
			return 1;
		}else{
			return 0;
		}
	}
	
}


$emailMgr = Email::getInstance();
$emailMgr->host	= $CONFIG['email']['host'];
$emailMgr->port	= $CONFIG['email']['port'];
$emailMgr->charset	= $CONFIG['email']['charset'];
$emailMgr->encoding	= $CONFIG['email']['encoding'];
$emailMgr->username	= $CONFIG['email']['username'];
$emailMgr->password	= $CONFIG['email']['password'];
$emailMgr->from	= $CONFIG['email']['from'];
$emailMgr->from_name	= $CONFIG['email']['from_name'];
$emailMgr->is_smtp	= $CONFIG['email']['is_smtp'];
$emailMgr->smtp_auth	= $CONFIG['email']['smtp_auth'];
$emailMgr->smtp_secure	= $CONFIG['email']['smtp_secure'];





?>
