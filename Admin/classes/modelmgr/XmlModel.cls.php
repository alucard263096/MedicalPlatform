<?php


class XmlModel
{
  private $XmlData;
  private $PageName;

  public function __construct($name,$pagename){
      $xmlstr=$this->loadXmlFile($name);
      $this->XmlData=$this->xmlToArray($xmlstr);
	  $this->PageName=$pagename;
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
    $smartyMgr->assign("PageName",$this->PageName);
    $smartyMgr->display(ROOT.'/templates/model/list.html');
  }

  public function ShowSearchResult($dbMgr,$smartyMgr,$request){
	$sql="select r_main.id";
	$fields=$this->XmlData["fields"]["field"];
	foreach ($fields as $value){
		if($value["displayinlist"]=="1"){
			if($value["type"]=="select"){

				$sql=$sql." ,case   r_main.".$value["key"]." ";
				foreach ($value["options"]["option"] as $option){
					$sql=$sql." when '".$option["value"]."' then '".$option["name"]."'";
				}
				$sql=$sql." else 'unknow' ".$value["key"];
				$sql=$sql." end as ".$value["key"];

			}else{

				$sql=$sql." ,r_main.".$value["key"];

			}
		}
	}
	
	$sql=$sql." from ".$this->XmlData["tablename"]." as r_main where 1==1 ";

	foreach ($fields as $value){
		
		if($value["displayinlist"]=="1"){

			if($value["type"]=="datetime"){

				if($request[$value["key"]."_from"]!=""){

					$sql=$sql." and '".$value["key"]."'>='".$request[$value["key"]."_from"]."'";

				}

				if($request[$value["key"]."_to"]!=""){

					$sql=$sql." and '".$value["key"]."'<='".$request[$value["key"]."_to"]."'";

				}

			}else{
				if($request[$value["key"]]!=""){

					$sql=$sql." and '".$value["key"]."'='".$request[$value["key"]]."'";
					
				}
			}

		}

	}

	$sql=$sql." order by updated_date desc ";


	
	$query = $dbMgr->query($sql);
	$result = $dbMgr->fetch_array_all($query); 
	
    $smartyMgr->assign("ModelData",$this->XmlData);
    $smartyMgr->assign("PageName",$this->PageName);
    $smartyMgr->assign("result",$result);
    $smartyMgr->display(ROOT.'/templates/model/result.html');

  }
}


?>