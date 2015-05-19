<?php

class ExpressMgr   {
	private $sceret_key;
	private $api_id;
	private $type;



	public function __construct()
	{
		Global $CONFIG;
		$this->sceret_key	= $CONFIG["express"]["sceret_key"];
		$this->api_id	= $CONFIG["express"]["api_id"];
		$this->type	= $CONFIG["express"]["type"];
	}

	public function getExpressInfo($com,$nu){
		$sceret=$this->sceret_key;;//API KEY
		$id=$this->api_id;;//API KEY
		$com=$com;//快递公司
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