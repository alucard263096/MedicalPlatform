<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class ProductMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new ProductMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	
	public function search($category_id,$name,$status)
	{
		$name=parameter_filter($name);
		$category_id=parameter_filter($category_id);
		
		
		$sql="select distinct n.id,nc.name category_name,n.logo, n.name,n.summary,n.seq,n.status
		,n.created_user,c.user_name created_username,n.created_date
		,n.updated_user,u.user_name updated_username,n.updated_date 
		from tb_product n
		inner join tb_product_category nc on n.category_id=nc.id and nc.status<>'D'
		left join tb_user c on n.created_user=c.user_id
		left join tb_user u on n.updated_user=u.user_id
		where  n.status like '%$status%'
		and ( n.name like '%$name%' )
		and ( $category_id=0 or n.category_id = $category_id )
		and n.status <>'D' 
		order by seq desc
		limit 0, 100 ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		
		return $result;
	}
	
	
	
	public function getProduct($id){
		$id=parameter_filter($id);
		$sql="select *
		from tb_product
		where id=$id ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;
	}
 
		
 public function save($id,$category_id,$name,$logo,$seq,$summary,$content,$status,$sysUser_id)
	{
		$id=parameter_filter($id);
		$category_id=parameter_filter($category_id);
		$name=parameter_filter($name);
		$logo=parameter_filter($logo);
		$seq=parameter_filter($seq);
		$summary=parameter_filter($summary);
		$content=parameter_filter($content);
		$status=parameter_filter($status);
		$this->dbmgr->begin_trans();
		
		if($id=="")
		{
			
			$sql="select ifnull(max(id),0)+1 from tb_product";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$id=$result[0];
			$sql="insert into `tb_product` 
	(id,category_id, name,logo, seq,summary,content, status, created_date, 
	created_user, updated_date, 
	updated_user)
	values
	($id,$category_id, '$name','$logo', '$seq', '$summary', '$content',  '$status', now(), 
	$sysUser_id, now(), 
	$sysUser_id)";
			
		}
		else
		{
			$sql="update tb_product set 
					category_id=$category_id,
					name='$name',
					logo='$logo',
					seq='$seq',
					summary='$summary',
					content='$content',
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
				$sql="update tb_product set status='D',updated_user=$sysUser_id,updated_date=now() where id=$id";
				$query = $this->dbmgr->query($sql);
			}
		}
		$this->dbmgr->commit_trans();
	}
 }
 
 $productMgr=ProductMgr::getInstance();
 $productMgr->dbmgr=$dbmgr;
 
 
 
 
?>