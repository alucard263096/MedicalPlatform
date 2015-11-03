<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class ProductCategoryMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new ProductCategoryMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public  function  getCategoryList(){
		$sql="select *
		from tb_product_category where status<>'D' ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
	
	public function search($name,$status)
	{
		$name=parameter_filter($name);
		
		
		$sql="select distinct n.id, n.name,n.seq,n.status
		,n.created_user,c.user_name created_username,n.created_date
		,n.updated_user,u.user_name updated_username,n.updated_date 
		from tb_product_category n
		left join tb_user c on n.created_user=c.user_id
		left join tb_user u on n.updated_user=u.user_id
		where  n.status like '%$status%'
		and ( n.name like '%$name%' )
		and n.status <>'D' 
		order by seq desc
		limit 0, 100 ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		
		return $result;
	}
	
	
	
	public function getProductCategory($id){
		$id=parameter_filter($id);
		$sql="select *
		from tb_product_category
		where id=$id ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;
	}
 
		
 public function save($id,$name,$seq,$status,$sysUser_id)
	{
		$id=parameter_filter($id);
		$name=parameter_filter($name);
		$seq=parameter_filter($seq);
		$status=parameter_filter($status);
		$this->dbmgr->begin_trans();
		
		if($id=="")
		{
			
			$sql="select ifnull(max(id),0)+1 from tb_product_category";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$id=$result[0];
			$sql="insert into `tb_product_category` 
	(id, name, seq, status, created_date, 
	created_user, updated_date, 
	updated_user)
	values
	($id, '$name', '$seq',  '$status', now(), 
	$sysUser_id, now(), 
	$sysUser_id)";
			
		}
		else
		{
			$sql="update tb_product_category set 
					name='$name',
					seq='$seq',
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
				$sql="update tb_product_category set status='D',updated_user=$sysUser_id,updated_date=now() where id=$id";
				$query = $this->dbmgr->query($sql);
			}
		}
		$this->dbmgr->commit_trans();
	}
 }
 
 $productCategoryMgr=ProductCategoryMgr::getInstance();
 $productCategoryMgr->dbmgr=$dbmgr;
 
 
 
 
?>