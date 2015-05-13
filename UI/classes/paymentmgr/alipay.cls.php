<?php

interface AlipayMgr implements IPayment  {
	private	$alipay_config;
	private $notify_url;
	private $call_back_url;



	private function __construct()
	{
		Global $CONFIG;

		//���������id����2088��ͷ��16λ������
		$this->alipay_config['partner']		= $CONFIG["alipay"]["partner"];

		//�տ�֧�����ʻ�
		$this->alipay_config['seller_email']	= $CONFIG["alipay"]["seller_email"];

		//��ȫ�����룬�����ֺ���ĸ��ɵ�32λ�ַ�
		//���ǩ����ʽ����Ϊ��MD5��ʱ�������øò���
		$this->alipay_config['key']			= $CONFIG["alipay"]["key"];


		//�̻���˽Կ����׺��.pem���ļ����·��
		//���ǩ����ʽ����Ϊ��0001��ʱ�������øò���
		$this->alipay_config['private_key_path']	= ROOT.'/libs/alipay_wap_lib/key/rsa_private_key.pem';

		//֧������Կ����׺��.pem���ļ����·��
		//���ǩ����ʽ����Ϊ��0001��ʱ�������øò���
		$this->alipay_config['ali_public_key_path']= ROOT.'/libs/alipay_wap_lib/key/alipay_public_key.pem';


		//�����������������������������������Ļ�����Ϣ������������������������������


		//ǩ����ʽ �����޸�
		$this->alipay_config['sign_type']    = '0001';

		//�ַ������ʽ Ŀǰ֧�� gbk �� utf-8
		$this->alipay_config['input_charset']= 'utf-8';

		//ca֤��·����ַ������curl��sslУ��
		//�뱣֤cacert.pem�ļ��ڵ�ǰ�ļ���Ŀ¼��
		$this->alipay_config['cacert']    = ROOT.'/libs/alipay_wap_lib/key/cacert.pem';

		//����ģʽ,�����Լ��ķ������Ƿ�֧��ssl���ʣ���֧����ѡ��https������֧����ѡ��http
		$this->alipay_config['transport']    = 'http';

		$this->notify_url=$CONFIG["alipay"]["notify_url"];
		$this->call_back_url=$CONFIG["alipay"]["call_back_url"];

	}

	public function submit($merchant_url,$trade_no,$subject,$total_fee){
		require_once(ROOT.'/libs/alipay_wap_lib/alipay_submit.class.php');
		//���ظ�ʽ
$format = "xml";
//�������Ҫ�޸�

//���ظ�ʽ
$v = "2.0";
//�������Ҫ�޸�

//�����
$req_id = date('Ymdhis');
//����뱣֤ÿ��������Ψһ

//**req_data��ϸ��Ϣ**

//�������첽֪ͨҳ��·��
$notify_url = $this->notify_url;
//��http://��ʽ������·�����������?id=123�����Զ������

//ҳ����תͬ��֪ͨҳ��·��
$call_back_url = $this->call_back_url;
//��http://��ʽ������·�����������?id=123�����Զ������

//�����жϷ��ص�ַ
$merchant_url =$booking_url;
//�û�������;�˳������̻��ĵ�ַ����http://��ʽ������·�����������?id=123�����Զ������

//�̻�������
$out_trade_no = $trade_no;
//�̻���վ����ϵͳ��Ψһ�����ţ�����

//��������
$subject = $subject;
//����

//������
$total_fee = $total_fee;
//����

//����ҵ�������ϸ
$req_data = '<direct_trade_create_req><notify_url>' . $notify_url . '</notify_url><call_back_url>' . $call_back_url . '</call_back_url><seller_account_name>' . trim($alipay_config['seller_email']) . '</seller_account_name><out_trade_no>' . $out_trade_no . '</out_trade_no><subject>' . $subject . '</subject><total_fee>' . $total_fee . '</total_fee><merchant_url>' . $merchant_url . '</merchant_url></direct_trade_create_req>';
//����

/************************************************************/

//����Ҫ����Ĳ������飬����Ķ�
$para_token = array(
		"service" => "alipay.wap.trade.create.direct",
		"partner" => trim($alipay_config['partner']),
		"sec_id" => trim($alipay_config['sign_type']),
		"format"	=> $format,
		"v"	=> $v,
		"req_id"	=> $req_id,
		"req_data"	=> $req_data,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);

//��������
$alipaySubmit = new AlipaySubmit($alipay_config);
$html_text = $alipaySubmit->buildRequestHttp($para_token);

//URLDECODE���ص���Ϣ
$html_text = urldecode($html_text);

//����Զ��ģ���ύ�󷵻ص���Ϣ
$para_html_text = $alipaySubmit->parseResponse($html_text);

//��ȡrequest_token
$request_token = $para_html_text['request_token'];


/**************************������Ȩ��token���ý��׽ӿ�alipay.wap.auth.authAndExecute**************************/

//ҵ����ϸ
$req_data = '<auth_and_execute_req><request_token>' . $request_token . '</request_token></auth_and_execute_req>';
//����

//����Ҫ����Ĳ������飬����Ķ�
$parameter = array(
		"service" => "alipay.wap.auth.authAndExecute",
		"partner" => trim($alipay_config['partner']),
		"sec_id" => trim($alipay_config['sign_type']),
		"format"	=> $format,
		"v"	=> $v,
		"req_id"	=> $req_id,
		"req_data"	=> $req_data,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);

//��������
$alipaySubmit = new AlipaySubmit($alipay_config);
$html_text = $alipaySubmit->buildRequestForm($parameter, 'get', 'ȷ��');
echo $html_text;
exit;


	}

	public function callback(){

	}

	public function server_nofify(){

	}
}
 
 
 
 
?>