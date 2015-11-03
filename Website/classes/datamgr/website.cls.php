<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class WebsiteMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new WebsiteMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function  getWebsiteBase(){
		$sql="select * from tb_website_base";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		//print_r($result);
		return $result;
	}
	
	public function  getProductMenu(){
		$sql="select distinct a.* from tb_product_category a 
		inner join tb_product b on a.id=b.category_id 
		where a.status='A' and b.status='A' order by a.seq,b.seq ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query);
		
		$sum=count($result);
		for($i=0;$i<$sum;$i++)
		{
			$pr=$this->getProduct($result[$i]["id"]);
			$result[$i]["productlist"]=$pr;
			$result[$i]["count"]=count($pr);
		}
		//print_r($result);
		return $result;
	}
 
	public function  getProduct($category_id){
		$sql="select * from tb_product where category_id=$category_id and status='A' order by seq ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query);
		//print_r($result);
		return $result;
	}
	
	
	public function getIndexPageBannerList(){
		$sql="select * from tb_website_banner where status='A' order by seq limit 0,7";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		//print_r($result);
		
		
		$sum=count($result);
		for($i=0;$i<$sum;$i++)
		{
			$style="hd";
      if(strpos($result["slogan"],"PALACOS")){
				$style="hm";
      }else if(strpos($result["slogan"],"OSTEOPAL")){
				$style="hen";
      }else if(strpos($result["slogan"],"SurgiWrap")){
				$style="hq";
      }else if($i==0){
				$style="hd";
			}else if($i==1){
				$style="hen";
			}else if($i==2){
				$style="hq";
			}else if($i==3){
				$style="hmt";
			}else if($i==4){
				$style="hn";
			}else if($i==5){
				$style="hq";
			}else if($i==6){
				$style="hpm";
			}
			$result[$i]["style"]=$style;
			$result[$i]["cl"]=explode("\n", $result[$i]["cont"]);
		}
		
		
		return $result;
	}
 
	public function  updateWebsiteBase($website_name, 
	$favfile, 
	$contacter, 
	$qq, 
	$email, 
	$mobile, 
	$phone, 
	$address, 
	$seo_title, 
	$seo_keywords, 
	$seo_description){
		
	$website_name=parameter_filter($website_name);
	$favfile=parameter_filter($favfile);
	$contacter=parameter_filter($contacter);
	$qq=parameter_filter($qq);
	$email=parameter_filter($email);
	$mobile=parameter_filter($mobile);
	$phone=parameter_filter($phone);
	$address=parameter_filter($address);
	$seo_title=parameter_filter($seo_title);
	$seo_keywords=parameter_filter($seo_keywords);
	$seo_description=parameter_filter($seo_description);
		
		
		
		$sql="update tb_website_base set
		 website_name='$website_name', 
		favfile='$favfile', 
		contacter='$contacter', 
		qq='$qq', 
		email='$email', 
		mobile='$mobile', 
		phone='$phone', 
		address='$address', 
		seo_title='$seo_title', 
		seo_keywords='$seo_keywords', 
		seo_description='$seo_description' ";
		$query = $this->dbmgr->query($sql);
	return  "right";
	}
	
	public function getIndexBannerList(){
		$sql="select * from tb_website_banner where status<>'D' order by status,seq";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		//print_r($result);
		return $result;
	}
	public function  getBanner($id){
		$sql="select * from tb_website_banner where id=$id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		//print_r($result);
		return $result;
	}
	
	public  function  updateBanner($id, $slogan, $label, $title, $cont, $seq, $pic,$link, $status){
		$id=parameter_filter($id);
		$cont=str_replace("'", "''", $cont);
		$label=parameter_filter($label);
		$cont=str_replace("'", "''", $cont);
		$cont=str_replace("'", "''", $cont);//parameter_filter($cont);
		$seq=parameter_filter($seq);
		$pic=parameter_filter($pic);
		$link=parameter_filter($link);
		$status=parameter_filter($status);
		
		$this->dbmgr->begin_trans();
		
		if($id=="")
		{
			
			$sql="select ifnull(max(id),0)+1 from tb_website_banner ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$id=$result[0];
			$sql="insert into `tb_website_banner` 
	(id, slogan, label, title, cont, seq, pic,link, status)
	values
	($id, '$slogan', '$label', '$title', '$cont', '$seq', '$pic','$link', '$status')";
			
		}
		else
		{
			$sql="update tb_website_banner set 
					slogan='$slogan',
					label='$label',
					title='$title',
					cont='$cont',
					seq='$seq',
					pic='$pic',
					link='$link',
					status='$status'
					where id=$id ";
		}
		$query = $this->dbmgr->query($sql);
		
		$this->dbmgr->commit_trans();
		
		return "right".$id;
	}
 
	
 	public function deleteBanner($list)
	{
		$this->dbmgr->begin_trans();
		$split = explode(",", $list);
		for($i=0;$i<count($split);$i++)
		{
			if(strlen($split[$i])>0)
			{
				$id=$split[$i];
				$sql="update tb_website_banner set status='D' where id=$id";
				$query = $this->dbmgr->query($sql);
			}
		}
		$this->dbmgr->commit_trans();
	}
	
 }
 
 $websiteMgr=WebsiteMgr::getInstance();
 $websiteMgr->dbmgr=$dbmgr;
 
 
 
 
?>