<?php

class ExpressMgr   {
	private	$company_code;
	private $sceret_key;
	private $api_id;
	private $type;



	public function __construct()
	{
		Global $CONFIG;
		$this->company_code	= $CONFIG["express"]["company_code"];
		$this->sceret_key	= $CONFIG["express"]["sceret_key"];
		$this->api_id	= $CONFIG["express"]["api_id"];
		$this->type	= $CONFIG["express"]["type"];
	}

	public function getExpressInfo($nu){
		$sceret=$this->sceret_key;;//API KEY
		$id=$this->api_id;;//API KEY
		$com=$this->company_code;//快递公司
		$nu=$nu;//快递单号
		$type=$this->type;
		$encode='utf8';
		$gateway=sprintf('http://api.ickd.cn/?secret=%s&id=%s&com=%s&nu=%s&encode=%s&type=%s',$sceret,$id,$com,$nu,$encode,$type);
		
		$data=file_get_contents($gateway);   
		$arr = array("<![CDATA[" => "", "]]>" => "");
		$data= strtr($data,$arr);
		return json_decode(json_encode((array) simplexml_load_string($data)), true);

	}


}
 
 
 
 
?>