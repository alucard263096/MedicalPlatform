<?php


class XmlModel
{
  private $XmlData;

  public function __construct($name){
      $xmlstr=$this->loadXmlFile($name);
      $this->XmlData=$this->xmlToArray($xmlstr);
  }

  private function xmlToArray( $xml )
  {
     return json_decode(json_encode((array) simplexml_load_string($xml)), true);
  }
  
  private function loadXmlFile($name){
    $path=ROOT."/model/$name.xml";
    $fp = fopen($path,"r");
    $str = fread($fp,filesize($path));
    return $str;
  }
  
  public function ShowList($smartyMgr){
  
    //$searchField=$this->XmlData["fields"];
	//print_r($this->XmlData);
    $smartyMgr->assign("ModelData",$this->XmlData);
    $smartyMgr->display(ROOT.'/templates/model/list.html');
  }
  
}


?>