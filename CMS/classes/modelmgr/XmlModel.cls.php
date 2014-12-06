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
  
  public function ShowList($dbMgr,$smartyMgr){
  
    //$searchField=$this->XmlData["fields"];
	//print_r($this->XmlData);
	$dataWithFKey=$this->loadFKeyValue($dbMgr,$this->XmlData);
    $smartyMgr->assign("ModelData",$dataWithFKey);
    $smartyMgr->assign("PageName",$this->PageName);
    $smartyMgr->display(ROOT.'/templates/model/list.html');
  }

  private function loadFKeyValue($dbMgr,$XmlDataEx){

	$fields=$XmlDataEx["fields"]["field"];
	$count=count($fields);
	for($i=0;$i<$count;$i++){
		if($fields[$i]["type"]=="fkey"
		&&$fields[$i]["search"]=="1"){
			
			$options=$this->GetFKeyData($dbMgr,$fields[$i]["displayfield"],$fields[$i]["tablename"],$fields[$i]["ntbname"],$fields[$i]["condition"]);
			$fields[$i]["options"]=$options;
		}
	}
	$XmlDataEx["fields"]["field"]=$fields;
	//print_r($XmlDataEx);
	return $XmlDataEx;
  }

  private function GetFKeyData($dbMgr,$displayfield,$tablename,$tablerename,$condition){

	$sql="select id,$displayfield as name from $tablename as $tablerename where $condition";
	$query = $dbMgr->query($sql);
	$result = $dbMgr->fetch_array_all($query); 

	return $result;
  }

  public function GetSearchSql($request){
	$sql="select r_main.id";
	$fields=$this->XmlData["fields"]["field"];
	foreach ($fields as $value){
		if($value["displayinlist"]=="1"){
			if($value["type"]=="select"){

				$sql=$sql." ,case   r_main.".$value["key"]." ";
				foreach ($value["options"]["option"] as $option){
					$sql=$sql." when '".$option["value"]."' then '".$option["name"]."'";
				}
				$sql=$sql." else 'unknow' ";
				$sql=$sql." end as ".$value["key"];

			}else if($value["type"]=="check"){

				$sql=$sql." ,case   r_main.".$value["key"]." when 'Y' then '".$value["yvalue"]."' else '".$value["nvalue"]."' ";
				$sql=$sql." end as ".$value["key"];

			}else if($value["type"]=="fkey"){
			
				$sql=$sql." ,".$value["ntbname"].".".$value["displayfield"]." ".$value["key"];

			}else{

				$sql=$sql." ,r_main.".$value["key"];

			}
		}
	}
	
	$sql=$sql." from ".$this->XmlData["tablename"]." as r_main ";

	foreach ($fields as $value){
		if($value["displayinlist"]=="1"){
			if($value["type"]=="fkey"){
				$sql=$sql." left join ".$value["tablename"]." ".$value["ntbname"]." on r_main.".$value["key"]."=".$value["ntbname"].".id ";
			}
		}
	}

	$sql=$sql."  where  ".$this->XmlData["searchcondition"];
	foreach ($fields as $value){
		
		if($value["search"]=="1"){

			if($value["type"]=="datetime"){

				if($request[$value["key"]."_from"]!=""){

					$sql=$sql." and r_main.".$value["key"].">='".mysql_real_escape_string($request[$value["key"]."_from"])."'";

				}

				if($request[$value["key"]."_to"]!=""){

					$sql=$sql." and r_main.".$value["key"]."<='".mysql_real_escape_string($request[$value["key"]."_to"])."'";

				}

			}else if($value["type"]=="fkey"){

				if($request[$value["key"]]!="0"){

					$sql=$sql." and r_main.".$value["key"]."=".mysql_real_escape_string($request[$value["key"]])."";

				}


			}else{
				if($request[$value["key"]]!=""
				&&$request[$value["key"]]!="no-value"){

					$sql=$sql." and r_main.".$value["key"]." like '%".mysql_real_escape_string($request[$value["key"]])."%'";
					
				}
			}

		}

	}

	$sql=$sql." order by r_main.updated_date desc ";

	return $sql;
  }


  public function ShowSearchResult($dbMgr,$smartyMgr,$request){
	
	$sql=$this->GetSearchSql($request);

	$query = $dbMgr->query($sql);
	$result = $dbMgr->fetch_array_all($query); 
	
    $smartyMgr->assign("ModelData",$this->XmlData);
    $smartyMgr->assign("PageName",$this->PageName);
    $smartyMgr->assign("result",$result);
    $smartyMgr->display(ROOT.'/templates/model/result.html');

  }
  public function ShowGridResult($dbMgr,$smartyMgr,$request,$parenturl){
	
	$sql=$this->GetSearchSql($request);

	$query = $dbMgr->query($sql);
	$result = $dbMgr->fetch_array_all($query); 
	
    $smartyMgr->assign("ModelData",$this->XmlData);
    $smartyMgr->assign("PageName",$this->PageName);
    $smartyMgr->assign("parenturl",$parenturl);
    $smartyMgr->assign("result",$result);
    $smartyMgr->display(ROOT.'/templates/model/grid.html');

  }

  
  public function Add($dbMgr,$smartyMgr){
   $dataWithFKey=$this->loadFKeyValue($dbMgr,$this->XmlData);
    $smartyMgr->assign("ModelData",$dataWithFKey);
    $smartyMgr->assign("PageName",$this->PageName);
    $smartyMgr->assign("action","add");
    $smartyMgr->display(ROOT.'/templates/model/detail.html');
  }
  
  public function Edit($dbMgr,$smartyMgr,$id){

	$sql="select * from ".$this->XmlData["tablename"]." where id=$id";
	$query = $dbMgr->query($sql);
	$result = $dbMgr->fetch_array($query); 
	$XmlDataWithInfo=$this->assignWithInfo($this->XmlData,$result);
    $dataWithFKey=$this->loadFKeyValue($dbMgr,$XmlDataWithInfo);

    $smartyMgr->assign("ModelData",$dataWithFKey);
    $smartyMgr->assign("PageName",$this->PageName);
    $smartyMgr->assign("id",$id);
    $smartyMgr->assign("action","edit");
    $smartyMgr->display(ROOT.'/templates/model/detail.html');
  }

  private function assignWithInfo($XmlDataEx,$info){
	$fields=$XmlDataEx["fields"]["field"];
	$count=count($fields);
	for($i=0;$i<$count;$i++){
		$fields[$i]["value"]=$info[$fields[$i]["key"]];
	}
	$XmlDataEx["fields"]["field"]=$fields;
	//print_r($XmlDataEx);
	return $XmlDataEx;
  }
  public function Save($dbMgr,$request,$sysuser){
    $sql="";
	$dbMgr->begin_trans();
		

	if($request["primary_id"]==""){
	
		$sql="select ifnull(max(id),0)+1 from ".$this->XmlData["tablename"];
		$query = $dbMgr->query($sql);
		$result = $dbMgr->fetch_array($query); 
		$id=$result[0];

		$sql="insert into ".$this->XmlData["tablename"]." (id";
		$fields=$this->XmlData["fields"]["field"];
		foreach ($fields as $value){
			if($value["type"]=="grid"){
				continue;
			}
			$sql=$sql.",`".$value["key"]."`";
		}
		$sql=$sql.",created_date,created_user,updated_date,updated_user ) values (";
		$sql=$sql.$id;
		foreach ($fields as $value){
		
			if($value["type"]=="grid"){
				continue;
			}

			if($value["type"]=="password"){
				$sql=$sql.",'".md5($request[$value["key"]])."'";
			}else{
				$sql=$sql.",'".mysql_real_escape_string($request[$value["key"]])."'";
			}
		}
		$sql=$sql.",now(),$sysuser,now(),$sysuser )";
		$query = $dbMgr->query($sql);

	}else{
		$id=$request["primary_id"];
		$sql="update ".$this->XmlData["tablename"]." set updated_date=now(),updated_user=$sysuser";
		$fields=$this->XmlData["fields"]["field"];
		foreach ($fields as $value){
		
			if($value["type"]=="grid"
			||$value["type"]=="password"){
				continue;
			}
			$sql=$sql.", `".$value["key"]."`='".mysql_real_escape_string($request[$value["key"]])."'";
		}
		$sql=$sql." where id=$id";
		$query = $dbMgr->query($sql);

		foreach ($fields as $value){
			if($value["type"]=="password"){
				$sql="update ".$this->XmlData["tablename"]." set ";
				$sql=$sql." `".$value["key"]."`='".md5($request[$value["key"]])."'";
				$sql=$sql." where id=$id and ".$value["key"]."<>'".mysql_real_escape_string($request[$value["key"]])."'";
				$query = $dbMgr->query($sql);
			}
		}
	}
	$dbMgr->commit_trans();
	return "right".$id;
  }
  public function Delete($dbMgr,$idlist,$sysuser){
    
	$sql="update ".$this->XmlData["tablename"]." set status='D',updated_user=$sysuser,updated_date=now() where id in ($idlist)";
	$query = $dbMgr->query($sql);
	return "success";
  }
}

?>