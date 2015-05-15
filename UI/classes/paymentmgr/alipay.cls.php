<?php

class AlipayMgr implements IPayment  {
	private	$alipay_config;
	private $notify_url;
	private $call_back_url;



	public function __construct()
	{
		Global $CONFIG;

		//合作身份者id，以2088开头的16位纯数字
		$this->alipay_config['partner']		= $CONFIG["alipay"]["partner"];

		//收款支付宝帐户
		$this->alipay_config['seller_email']	= $CONFIG["alipay"]["seller_email"];

		//安全检验码，以数字和字母组成的32位字符
		//如果签名方式设置为“MD5”时，请设置该参数
		$this->alipay_config['key']			= $CONFIG["alipay"]["key"];


		//商户的私钥（后缀是.pem）文件相对路径
		//如果签名方式设置为“0001”时，请设置该参数
		$this->alipay_config['private_key_path']	= ROOT.'/libs/alipay_wap_lib/key/rsa_private_key.pem';

		//支付宝公钥（后缀是.pem）文件相对路径
		//如果签名方式设置为“0001”时，请设置该参数
		$this->alipay_config['ali_public_key_path']= ROOT.'/libs/alipay_wap_lib/key/alipay_public_key.pem';


		//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


		//签名方式 不需修改
		$this->alipay_config['sign_type']    = 'MD5';

		//字符编码格式 目前支持 gbk 或 utf-8
		$this->alipay_config['input_charset']= 'utf-8';

		//ca证书路径地址，用于curl中ssl校验
		//请保证cacert.pem文件在当前文件夹目录中
		$this->alipay_config['cacert']    = ROOT.'/libs/alipay_wap_lib/key/cacert.pem';

		//访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
		$this->alipay_config['transport']    = 'http';

		$this->notify_url=$CONFIG["alipay"]["notify_url"];
		$this->call_back_url=$CONFIG["alipay"]["call_back_url"];

	}

	public function submit($merchant_url,$trade_no,$subject,$total_fee,$pin_code){
		require_once(ROOT.'/libs/alipay_wap_lib/alipay_submit.class.php');
		//返回格式
$format = "xml";
//必填，不需要修改

//返回格式
$v = "2.0";
//必填，不需要修改

//请求号
$req_id = $pin_code;
//必填，须保证每次请求都是唯一

//**req_data详细信息**

//服务器异步通知页面路径
$notify_url = $this->notify_url;
//需http://格式的完整路径，不允许加?id=123这类自定义参数

//页面跳转同步通知页面路径
$call_back_url = $this->call_back_url;
//需http://格式的完整路径，不允许加?id=123这类自定义参数

//操作中断返回地址
$merchant_url =$booking_url;
//用户付款中途退出返回商户的地址。需http://格式的完整路径，不允许加?id=123这类自定义参数

//商户订单号
$out_trade_no = $trade_no;
//商户网站订单系统中唯一订单号，必填

//订单名称
$subject = $subject;
//必填

//付款金额
$total_fee = $total_fee;
//必填

//请求业务参数详细
$req_data = '<direct_trade_create_req><notify_url>' . $notify_url . '</notify_url><call_back_url>' . $call_back_url . '</call_back_url><seller_account_name>' . trim($this->alipay_config['seller_email']) . '</seller_account_name><out_trade_no>' . $out_trade_no . '</out_trade_no><subject>' . $subject . '</subject><total_fee>' . $total_fee . '</total_fee><merchant_url>' . $merchant_url . '</merchant_url></direct_trade_create_req>';
//必填

/************************************************************/
echo $req_id;
//构造要请求的参数数组，无需改动
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

//建立请求
$alipaySubmit = new AlipaySubmit($this->alipay_config);
$html_text = $alipaySubmit->buildRequestHttp($para_token);


//URLDECODE返回的信息
$html_text = urldecode($html_text);
//echo $html_text;
//解析远程模拟提交后返回的信息
$para_html_text = $alipaySubmit->parseResponse($html_text);

//获取request_token
$request_token = $para_html_text['request_token'];


/**************************根据授权码token调用交易接口alipay.wap.auth.authAndExecute**************************/

//业务详细
$req_data = '<auth_and_execute_req><request_token>' . $request_token . '</request_token></auth_and_execute_req>';
//必填

//构造要请求的参数数组，无需改动
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

//建立请求
$alipaySubmit = new AlipaySubmit($this->alipay_config);
$html_text = $alipaySubmit->buildRequestForm($parameter, 'get', '确认');
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
				//商户订单号
				$out_trade_no = $doc->getElementsByTagName( "out_trade_no" )->item(0)->nodeValue;
				//支付宝交易号
				$trade_no = $doc->getElementsByTagName( "trade_no" )->item(0)->nodeValue;
				//交易状态
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