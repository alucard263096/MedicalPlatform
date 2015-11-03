<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class ManagerMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new ManagerMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public  function  getManagerList(){
		
		$sql="select * from tb_manager where status='A' order by qq ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		$sum=count($result);
		for($i=0;$i<$sum;$i++)
		{
			$result[$i]["seq"]=$i+1;
			$result[$i]["provincelist"]=explode("," , $result[$i]["provinces"]);
		}
		
		return $result;
	}
	
	public  function getPositionHistory(){
		$sql="select distinct position from tb_manager
		order by position asc
		limit 0, 100 ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
	
	
	public function search($chname,$engname,$position,$tel,$qq,$status)
	{
		$chname=parameter_filter($chname);
		$engname=parameter_filter($engname);
		$position=parameter_filter($position);
		$tel=parameter_filter($tel);
		$qq=parameter_filter($qq);
		
		
		
		
		$sql="select distinct n.id, n.chname,n.engname,n.position,n.tel,n.qq,n.email,n.address,n.provinces,n.status
		,n.created_user,c.user_name created_username,n.created_date
		,n.updated_user,u.user_name updated_username,n.updated_date 
		from tb_manager n
		left join tb_user c on n.created_user=c.user_id
		left join tb_user u on n.updated_user=u.user_id
		where  n.status like '%$status%'
		and ( n.chname like '%$chname%' )
		and ( n.engname like '%$engname%' )
		and ( n.position like '%$position%' )
		and ( n.tel like '%$tel%' )
		and ( n.qq like '%$qq%' )
		and n.status <>'D' 
		limit 0, 100 ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		
		return $result;
	}
	
	
	
	public function getManager($id){
		$sql="select *
		from tb_manager
		where id=$id ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;
	}
	
	
	
	
		
 public function save($id
					 	,$chname
					 	,$engname
					 	,$position
					 	,$tel
					 	,$qq
					 	,$email
					 	,$address
					 	,$provinces
					 	,$description
					 	,$remark
					 	,$status
					 	,$sysUser_id)
	{
		$id=parameter_filter($id);
		$chname=parameter_filter($chname);
		$engname=parameter_filter($engname);
		$position=parameter_filter($position);
		$tel=parameter_filter($tel);
		$qq=parameter_filter($qq);
		$email=parameter_filter($email);
		$address=parameter_filter($address);
		$provinces=parameter_filter($provinces);
		$description=parameter_filter($description);
		$remark=parameter_filter($remark);
		$status=parameter_filter($status);
		$this->dbmgr->begin_trans();
		
		if($id=="")
		{
			
			$sql="select ifnull(max(id),0)+1 from tb_manager";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$id=$result[0];
			$sql="insert into `tb_manager` 
	(id, chname, engname, position, tel, qq, 
	email, address, provinces, description, 
	remark, status, created_user, created_date, 
	updated_user, updated_date)
	values
	($id, '$chname', '$engname', '$position', '$tel', '$qq', 
	'$email', '$address', '$provinces', '$description', 
	'$remark', '$status', $sysUser_id, now(), 
	$sysUser_id, now())";
			
		}
		else
		{
			$sql="update tb_manager set 
					chname='$chname',
					engname='$engname',
					position='$position',
					tel='$tel',
					qq='$qq',
					email='$email',
					address='$address',
					provinces='$provinces',
					description='$description',
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
				$sql="update tb_manager set status='D',updated_user=$sysUser_id,updated_date=now() where id=$id";
				$query = $this->dbmgr->query($sql);
			}
		}
		$this->dbmgr->commit_trans();
	}
 }
 
 $managerMgr=ManagerMgr::getInstance();
 $managerMgr->dbmgr=$dbmgr;
 
 
 
 
?>