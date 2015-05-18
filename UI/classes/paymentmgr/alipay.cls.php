<?php

class AlipayMgr implements IPayment  {
	private	$alipay_config;
	private $notify_url;
	private $call_back_url;



	public function __construct()
	{
		Global $CONFIG;

		$this->alipay_config['partner']		= $CONFIG["alipay"]["partner"];

		$this->alipay_config['seller_email']	= $CONFIG["alipay"]["seller_email"];

		$this->alipay_config['key']			= $CONFIG["alipay"]["key"];


		$this->alipay_config['private_key_path']	= ROOT.'/libs/alipay_wap_lib/key/rsa_private_key.pem';

		$this->alipay_config['ali_public_key_path']= ROOT.'/libs/alipay_wap_lib/key/alipay_public_key.pem';

		$this->alipay_config['sign_type']    = 'MD5';

		$this->alipay_config['input_charset']= 'utf-8';

		$this->alipay_config['cacert']    = ROOT.'/libs/alipay_wap_lib/key/cacert.pem';

		$this->alipay_config['transport']    = 'http';

		$this->notify_url=$CONFIG["alipay"]["notify_url"];
		$this->call_back_url=$CONFIG["alipay"]["call_back_url"];

	}

	public function submit($merchant_url,$trade_no,$subject,$total_fee,$pin_code){
		require_once(ROOT.'/libs/alipay_wap_lib/alipay_submit.class.php');
$format = "xml";

$v = "2.0";

$req_id = $pin_code;

$notify_url = $this->notify_url;

$call_back_url = $this->call_back_url;

$merchant_url =$merchant_url;

$out_trade_no = $trade_no;

$subject = $subject;

$total_fee = $total_fee;

$req_data = '<direct_trade_create_req><notify_url>' . $notify_url . '</notify_url><call_back_url>' . $call_back_url . '</call_back_url><seller_account_name>' . trim($this->alipay_config['seller_email']) . '</seller_account_name><out_trade_no>' . $out_trade_no . '</out_trade_no><subject>' . $subject . '</subject><total_fee>' . $total_fee . '</total_fee><merchant_url>' . $merchant_url . '</merchant_url></direct_trade_create_req>';

/************************************************************/
//echo $req_id;
$para_token = array(
		"service" => "alipay.wap.trade.create.direct",
		"partner" => trim($this->alipay_config['partner']),
		"sec_id" => trim($this->alipay_config['sign_type']),
		"format"	=> $format,
		"v"	=> $v,
		"req_id"	=> $req_id,
		"req_data"	=> $req_data,
		"_input_charset"	=> trim(strtolower($this->alipay_config['input_charset']))
);

$alipaySubmit = new AlipaySubmit($this->alipay_config);
$html_text = $alipaySubmit->buildRequestHttp($para_token);


$html_text = urldecode($html_text);
$para_html_text = $alipaySubmit->parseResponse($html_text);

$request_token = $para_html_text['request_token'];



$req_data = '<auth_and_execute_req><request_token>' . $request_token . '</request_token></auth_and_execute_req>';

$parameter = array(
		"service" => "alipay.wap.auth.authAndExecute",
		"partner" => trim($this->alipay_config['partner']),
		"sec_id" => trim($this->alipay_config['sign_type']),
		"format"	=> $format,
		"v"	=> $v,
		"req_id"	=> $req_id,
		"req_data"	=> $req_data,
		"_input_charset"	=> trim(strtolower($this->alipay_config['input_charset']))
);

$alipaySubmit = new AlipaySubmit($this->alipay_config);
$html_text = $alipaySubmit->buildRequestForm($parameter, 'get', 'ȷ��');
echo $html_text;
exit;


	}

	public function callback(){
		require_once(ROOT.'/libs/alipay_wap_lib/alipay_notify.class.php');
		
		$alipayNotify = new AlipayNotify($this->alipay_config);
		$verify_result = $alipayNotify->verifyReturn();
		$ret=Array();

		$ret["out_trade_no"]= $_GET['out_trade_no'];
		$ret["trade_no"]= $_GET['trade_no'];

		if($verify_result){
			$ret["result"]= $_GET['result'];
		}else{
			$ret["result"]="FAIL";
		}
		return $ret;

	}

	public function notify(){
		require_once(ROOT."/libs/alipay_wap_lib/alipay_notify.class.php");
		$alipayNotify = new AlipayNotify($this->alipay_config);
		$verify_result = $alipayNotify->verifyNotify();
		
		$ret=Array();
		if($verify_result) {
			$doc = new DOMDocument();	
			if ($this->alipay_config['sign_type'] == 'MD5') {
				$doc->loadXML($_POST['notify_data']);
			}
	
			if ($this->alipay_config['sign_type'] == '0001') {
				$doc->loadXML($alipayNotify->decrypt($_POST['notify_data']));
			}
	
			if( ! empty($doc->getElementsByTagName( "notify" )->item(0)->nodeValue) ) {
				$out_trade_no = $doc->getElementsByTagName( "out_trade_no" )->item(0)->nodeValue;
				$trade_no = $doc->getElementsByTagName( "trade_no" )->item(0)->nodeValue;
				$trade_status = $doc->getElementsByTagName( "trade_status" )->item(0)->nodeValue;

				
				$ret["out_trade_no"]= $out_trade_no;
				$ret["trade_no"]= $trade_no;


				if($trade_status == 'TRADE_FINISHED'
				||$trade_status == 'TRADE_FINISHED'){
					$ret["result"]="SUCCESS";
				}else{
					$ret["result"]="FAIL";
				}
			}else{
				$ret["result"]="FAIL";
			}
			
			
		}else{
			$ret["result"]="FAIL";
		}
		return $ret;
	}
}
 
 
 
 
?>