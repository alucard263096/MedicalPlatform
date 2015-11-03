<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class UserMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new UserMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function getUserByName($loginname)
	{
		$loginname=parameter_filter($loginname);
		$sql="select * from tb_user where login_id='$loginname' ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
	public function searchUser($user_name,$email,$status)
	{
		$user_name=parameter_filter($user_name);
		$email=parameter_filter($email);
		$sql="select * from tb_user where 1=1 " .
				"and user_name like '%$user_name%' " .
				"and email like '%$email%' " .
				"and status like '%$status%' " .
				"and status <>'D' " .
				"order by user_name ";

		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		for($i=0;$i<count($result);$i++)
		{
			$result[$i]["function"]=$this->getUserFunction($result[$i]["user_id"]);
		}
		return $result;
	}
	
	public function getUserFunction($user_id)
	{
		$sql="select distinct c.* from tb_user_function a	" .
				"inner join tb_function b on a.function_id=b.function_id " .
				"inner join tb_function c on b.parent_id=c.function_id " .
				"where a.user_id=$user_id " .
				"and b.status=0 " .
				"and c.status=0 " .
				"and a.status=0 " .
				"order by c.seq";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		for($i=0;$i<count($result);$i++)
		{
			$result[$i]["sub_function"]=$this->getUserFunctionByParent($user_id,$result[$i]["function_id"]);
		}
		
		return $result;
	}
	
	public function getUserFunctionByParent($user_id,$function_id)
	{
		$sql="select distinct  b.* from tb_user_function a	" .
				"inner join tb_function b on a.function_id=b.function_id " .
				"where a.user_id=$user_id " .
				"and b.parent_id=$function_id " .
				"and b.status=0 " .
				"and a.status=0 " .
				"order by b.seq ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		for($i=0;$i<count($result);$i++)
		{
			$result[$i]["access_right"]=$this->getUserFunctionAccessRight($user_id,$result[$i]["function_id"]);
		}
		return $result;
	}
	public function getUserFunctionAccessRight($user_id,$function_id)
	{
		$sql="select * from tb_user_access_right a " .
				"inner join tb_access_right b on a.right_id=b.right_id " .
				"where a.user_id=$user_id " .
				"and   a.function_id=$function_id " .
				"order by b.seq  ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
	
	public function getFunctionWithUser($user_id)
	{
		$sql="select distinct * from tb_function where function_type=1 " .
				"and status='A'";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		for($i=0;$i<count($result);$i++)
		{
			$result[$i]["sub_function"]=$this->getSubFunctionWithUser($user_id,$result[$i]["function_id"]);
		}
		
		return $result;
	}
	public function getSubFunctionWithUser($user_id,$function_id)
	{
		$sql="select distinct a.*,b.user_id right_u from tb_function a " .
				"left join tb_user_function b on a.function_id=b.function_id and b.user_id=$user_id and b.status='A' " .
				"where a.parent_id=$function_id " .
				"and a.status='A'" .
				"and a.function_type>1 " .
				"order by a.seq";
				
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		for($i=0;$i<count($result);$i++)
		{
			$result[$i]["access_right"]=$this->getSubFunctionAccessRightWithUser($user_id,$result[$i]["function_id"]);
		}
		
		return $result;
	}
	
	public function getSubFunctionAccessRightWithUser($user_id,$function_id)
	{
		$sql="select distinct c.*,d.user_id right_u from tb_function a " .
				"inner join tb_function_right b on a.function_id=b.function_id " .
				"inner join tb_access_right c on b.right_id=c.right_id " .
				"left join tb_user_access_right d on a.function_id=d.function_id and c.right_id=d.right_id and d.user_id=$user_id " .
				"where a.function_id=$function_id " .
				"order by c.seq ";
				
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		return $result;
	}
	
	public function getUser($user_id)
	{
		$sql="select * from tb_user where user_id=$user_id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		
		return $result;
	}
	public function save($user_id,$login_id,$password,$user_name,$email,$status,$remarks,$access_right,$sysUser_id)
	{
		$user_id=parameter_filter($user_id);
		$login_id=parameter_filter($login_id);
		$password=parameter_filter($password);
		$user_name=parameter_filter($user_name);
		$email=parameter_filter($email);
		$status=parameter_filter($status);
		$remarks=parameter_filter($remarks);
		$access_right=parameter_filter($access_right);
		
		
		$this->dbmgr->begin_trans();
		if($user_id=="")
		{
			$sql="select * from tb_user where login_id='$login_id' ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array_all($query); 
			
			if(count($result)>0)
			{
				$this->dbmgr->commit_trans();
				return "login_id_exists";
			}
		
			$sql="select ifnull(max(user_id),0)+1 from tb_user";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$user_id=$result[0];
			$sql="insert into tb_user " .
					"(`user_id`,`login_id`,`password`,`user_name`,`email`,`remarks`,`status`,`created_user`,`created_date`,`updated_user`,`updated_date`) " .
					"values " .
					"($user_id,'$login_id','$password','$user_name','$email','$remarks','$status',$sysUser_id,now(),$sysUser_id,now())";
			
		}
		else
		{
			$sql="update tb_user set " .
					"user_name='$user_name'" .
					",email='$email'" .
					",remarks='$remarks'" .
					",status='$status'" .
					",updated_user=$sysUser_id" .
					",updated_date=now() " .
					"where user_id=$user_id";
		}
		$query = $this->dbmgr->query($sql);
		
		$sql="delete from tb_user_function where user_id=$user_id";
		$query = $this->dbmgr->query($sql);
		
		$sql="delete from tb_user_access_right where user_id=$user_id";
		$query = $this->dbmgr->query($sql);
		
		$split = explode(";", $access_right);
		for($i=0;$i<count($split);$i++)
		{
			if(strlen($split[$i])>0)
			{
				$chr=explode(",", $split[$i]);
				
				$function_id=$chr[0];
				$access_right=$chr[1];
				
				
				$sql="insert into tb_user_function " .
						"(user_id,function_id,`status`,created_user,created_date) " .
						"values " .
						"($user_id,$function_id,'A',$sysUser_id,now())";
				$query = $this->dbmgr->query($sql);
				
				if(strlen($access_right)>0)
				{
					$acr=explode("?", $access_right);
					
					for($j=0;$j<count($acr);$j++)
					{
						if(strlen($acr[$j])>0)
						{
							$access_right_id=$acr[$j];
							$sql="insert into tb_user_access_right " .
									"(user_id,function_id,right_id,created_user,created_date) " .
									"values " .
									"($user_id,$function_id,$access_right_id,$sysUser_id,now())";
							$query = $this->dbmgr->query($sql);
							
						}
					}
				}
			}
		}
		
		
		
		$this->dbmgr->commit_trans();
		return "right".$user_id;
	}
	
	public function delete($user_list,$sysUser_id)
	{
		$this->dbmgr->begin_trans();
		$split = explode(",", $user_list);
		for($i=0;$i<count($split);$i++)
		{
			if(strlen($split[$i])>0)
			{
				$user_id=$split[$i];
				$sql="update tb_user set status='D',updated_user=$sysUser_id,updated_date=now() where user_id=$user_id";
				$query = $this->dbmgr->query($sql);
			}
		}
		$this->dbmgr->commit_trans();
	}
	
	public function changsePassword($user_id,$current_password,$new_password)
	{
		$new_password=parameter_filter($new_password);
		$user=$this->getUser($user_id);
		if($current_password!=$user["password"])
		{
			return "current_password_diff";
		}
		
		$sql="update tb_user set password='$new_password',updated_user=$user_id,updated_date=now() where user_id=$user_id";
		$query = $this->dbmgr->query($sql);
		
		return "success";
	}
	
	public function resetPassword($user_id,$password,$sysUser_id)
	{
		$password=parameter_filter($password);
		
		$sql="update tb_user set password='$password',updated_user=$sysUser_id,updated_date=now() where user_id=$user_id";
		$query = $this->dbmgr->query($sql);
	}
	
 }
 
 $userMgr=UserMgr::getInstance();
 $userMgr->dbmgr=$dbmgr;
 
 
 
 
?>