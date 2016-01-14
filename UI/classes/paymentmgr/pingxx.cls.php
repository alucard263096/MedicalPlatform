<?php


class PingxxMgr implements IPayment  {
	private	$key;
	private $app_id;



	public function __construct()
	{
		Global $CONFIG;
		$this->key=$CONFIG["pingxx"]["key"];
		$this->app_id=$CONFIG["pingxx"]["app_id"];
		

	}

	public function submit($merchant_url,$trade_no,$subject,$total_fee,$pin_code){
		
		Global $CONFIG;
		
// api_key、app_id 请从 [Dashboard](https://dashboard.pingxx.com) 获取
$api_key = $this->key;
$app_id = $this->app_id;

// 此处为 Content-Type 是 application/json 时获取 POST 参数的示例

$channel = strtolower($_REQUEST['channel']);
$amount = $total_fee;
$orderNo = $trade_no;

/**
 * $extra 在使用某些渠道的时候，需要填入相应的参数，其它渠道则是 array()。
 * 以下 channel 仅为部分示例，未列出的 channel 请查看文档 https://pingxx.com/document/api#api-c-new
 */
$extra = array();
switch ($channel) {
    case 'alipay_wap':
        $extra = array(
            'success_url' => $CONFIG["alipay"]["call_back_url"],
            'cancel_url' => $CONFIG["alipay"]["call_back_url"]
        );
        break;
    case 'bfb_wap':
        $extra = array(
            'result_url' => 'http://example.com/result',
            'bfb_login' => true
        );
        break;
    case 'upacp_wap':
        $extra = array(
            'result_url' => 'http://example.com/result'
        );
        break;
    case 'wx_pub':
        $extra = array(
            'open_id' => '1293752201'
        );
        break;
    case 'wx_pub_qr':
        $extra = array(
            'product_id' => 'Productid'
        );
        break;
    case 'yeepay_wap':
        $extra = array(
            'product_category' => '1',
            'identity_id'=> 'your identity_id',
            'identity_type' => 1,
            'terminal_type' => 1,
            'terminal_id'=>'your terminal_id',
            'user_ua'=>'your user_ua',
            'result_url'=>'http://example.com/result'
        );
        break;
    case 'jdpay_wap':
        $extra = array(
            'success_url' => 'http://example.com/success',
            'fail_url'=> 'http://example.com/fail',
            'token' => 'dsafadsfasdfadsjuyhfnhujkijunhaf'
        );
        break;
}

// 设置 API Key
try {
require_once(ROOT.'/libs/pingxx/init.php');
\Pingpp\Pingpp::setApiKey($api_key);
    $ch = \Pingpp\Charge::create(
        array(
            'subject'   => $subject,
            'body'      => 'test body',
            'amount'    => $amount,
            'order_no'  => $orderNo,
            'currency'  => 'cny',
            'extra'     => $extra,
            'channel'   => $channel,
            'client_ip' => $_SERVER['REMOTE_ADDR'],
            'app'       => array('id' => $app_id)
        )
    );
    echo $ch;
	logger_mgr::logInfo("pingxx :$ch");
} catch (\Pingpp\Error\Base $e) {
    header('Status: ' . $e->getHttpStatus());
    // 捕获报错信息
    echo $e->getHttpBody();
	logger_mgr::logError("pingxx :".$e->getHttpBody());
}


	}

	public function callback(){
		

	}

	public function notify(){
		
	}
}
 
 
 
 
?>