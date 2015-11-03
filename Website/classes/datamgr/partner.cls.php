<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class PartnerMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new PartnerMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	public  function getPartnerType(){
		$sql="select distinct * from tb_partner_type
		where status='A'
		limit 0, 100 ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		return $result;
		
	}
 
	public  function getPartnerList(){
		$sql="select distinct * from tb_partner
		where status='A' ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		$sum=count($result);
		for($i=0;$i<$sum;$i++)
		{
			$result[$i]["seq"]=$i+1;
			$coordinate=explode("," , $result[$i]["coordinate"]);
			$result[$i]["x"]=trim($coordinate[0]);
			$result[$i]["y"]=trim($coordinate[1]);
		}
		return $result;
	}
 
 
	public  function getPartnerCityList(){
		$sql="select distinct b.* from tb_partner a 
		inner join tb_city b on a.city_id=b.serialId
		where a.status='A' ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		
		return $result;
	}
	
	public function search($name,$type,$tel,$address,$status)
	{
		$name=parameter_filter($name);
		$type=parameter_filter($type);
		$tel=parameter_filter($tel);
		$address=parameter_filter($address);
		
		
		
		
		$sql="select distinct n.id, n.name,n.type,pt.name type_name,n.tel,n.mobile,n.contacter,n.address,n.status
		,n.created_user,c.user_name created_username,n.created_date
		,n.updated_user,u.user_name updated_username,n.updated_date 
		from tb_partner n
		inner join tb_partner_type pt on n.type=pt.code
		left join tb_user c on n.created_user=c.user_id
		left join tb_user u on n.updated_user=u.user_id
		where  n.status like '%$status%'
		and ( n.name like '%$name%' )
		and ( n.type like '%$type%' )
		and ( n.tel like '%$tel%' or n.mobile like '%$tel%' )
		and ( n.address like '%$address%' )
		and n.status <>'D' 
		limit 0, 100 ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		
		return $result;
	}
	
	
	
	public function getPartner($id){
		$sql="select a.*,cityUpIdNum province_id
		from tb_partner a 
		inner join tb_city b on a.city_id=b.serialId
		where id=$id ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;
	}
	
	
	
	
		
 public function save($id
					 	,$type
					 	,$name
					 	,$logo_file
					 	,$tel
					 	,$fax
					 	,$mobile
					 	,$contacter
					 	,$address
					 	,$city_id
					 	,$coordinate
					 	,$website
					 	,$weixin
					 	,$summary
					 	,$content
					 	,$remark
					 	,$status
					 	,$sysUser_id)
	{
		$id=parameter_filter($id);
		$type=parameter_filter($type);
		$name=parameter_filter($name);
		$logo_file=parameter_filter($logo_file);
		$tel=parameter_filter($tel);
		$fax=parameter_filter($fax);
		$mobile=parameter_filter($mobile);
		$contacter=parameter_filter($contacter);
		$address=parameter_filter($address);
		$city_id=parameter_filter($city_id);
		$coordinate=parameter_filter($coordinate);
		$website=parameter_filter($website);
		$weixin=parameter_filter($weixin);
		$summary=parameter_filter($summary);
		$content=parameter_filter($content);
		$remark=parameter_filter($remark);
		$status=parameter_filter($status);
		
		$this->dbmgr->begin_trans();
		
		if($id=="")
		{
			
			$sql="select ifnull(max(id),0)+1 from tb_partner";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$id=$result[0];
			$sql="insert into `tb_partner` 
	(id, type, name, logo_file, tel, 
	fax, mobile, contacter, address, 
	city_id, coordinate, website, 
	weixin, summary, content, remark, 
	status, created_user, created_date, 
	updated_user, updated_date
	)
	values
	($id, '$type', '$name', '$logo_file', '$tel', 
	'$fax', '$mobile', '$contacter', '$address', 
	$city_id, '$coordinate', '$website', 
	'$weixin', '$summary', '$content', '$remark', 
	'$status', $sysUser_id, now(), 
	$sysUser_id, now()
	)";
			
		}
		else
		{
			$sql="update tb_partner set 
					type='$type',
					name='$name',
					logo_file='$logo_file',
					tel='$tel',
					fax='$fax',
					mobile='$mobile',
					contacter='$contacter',
					address='$address',
					city_id=$city_id,
					coordinate='$coordinate',
					website='$website',
					weixin='$weixin',
					summary='$summary',
					content='$content',
					remark='$remark',
					status='$status',
					updated_user=$sysUser_id,
					updated_date=now()
					where id=$id ";
		}
		$query = $this->dbmgr->query($sql);
		
		$this->dbmgr->commit_trans();
		
		return "right".$id;
	}
	
 	public function delete($list,$sysUser_id)
	{
		$this->dbmgr->begin_trans();
		$split = explode(",", $list);
		for($i=0;$i<count($split);$i++)
		{
			if(strlen($split[$i])>0)
			{
				$id=$split[$i];
				$sql="update tb_partner set status='D',updated_user=$sysUser_id,updated_date=now() where id=$id";
				$query = $this->dbmgr->query($sql);
			}
		}
		$this->dbmgr->commit_trans();
	}
 }
 
 $partnerMgr=PartnerMgr::getInstance();
 $partnerMgr->dbmgr=$dbmgr;
 
 
 
 
?>