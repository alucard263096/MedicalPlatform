<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class GeneralMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new GeneralMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function searchGeneral($name)
	{
		$name=parameter_filter($name);
		$sql="select g.id,g.name,g.position,g.updated_user,u.user_name updated_username,g.updated_date 
		from tb_general g
		left join tb_user u on g.updated_user=u.user_id
		where user_name like '%$name%' ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
 
	public function getGeneral($id)
	{
		$sql="select id,name,position,content,`type` from tb_general where id=$id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query);
		return $result;
	}
	
 public function save($id,$content,$sysUser_id)
	{
		$id=parameter_filter($id);
		$content=parameter_filter($content);
		
		$sql="update tb_general set " .
					"content='$content'" .
					",updated_user=$sysUser_id" .
					",updated_date=now() " .
					"where id=$id";
		$query = $this->dbmgr->query($sql);
		
		return "right".$id;
	}
 
 
 public function  getKeyContent($key){
 	$sql="select content from tb_general where `key`='$key' ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query);
		return $result[0];
 }
 }
 
 $generalMgr=GeneralMgr::getInstance();
 $generalMgr->dbmgr=$dbmgr;
 
 
 
 
?>