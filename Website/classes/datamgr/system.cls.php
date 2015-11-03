<?php

/**
 * system short summary.
 *
 * system description.
 *
 * @version 1.0
 * @author Administrator
 */
class SystemMgr
{
    private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new SystemMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function RecreateFunction()
	{
		
		
		$this->dbmgr->begin_trans();
        
        $sql="delete  from tb_function  ";
		$query = $this->dbmgr->query($sql);
        
        
		$sql="insert into  tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,status) 
              values (1,'���ݹ���','#',1,1,1,1,'A') ";
		$query = $this->dbmgr->query($sql);
        
        
        $sql="insert into  tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,status) 
              values (2,'��������','about_us.php',1,9,1,11,'A') ";
        $query = $this->dbmgr->query($sql);
        
        $sql="insert into  tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,status) 
              values (3,'��ϵ����','contact_us.php',1,9,1,12,'A') ";
        $query = $this->dbmgr->query($sql);
        
        $sql="insert into  tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,status) 
              values (4,'��Ƹ��Ϣ','employee.php',1,9,1,13,'A') ";
        $query = $this->dbmgr->query($sql);
        
        $sql="insert into  tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,status) 
              values (5,'�������','partner.php',1,9,1,14,'A') ";
        $query = $this->dbmgr->query($sql);
        
        $sql="insert into  tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,status) 
              values (6,'��Ʒ����','product_list.php',1,9,1,15,'A') ";
        $query = $this->dbmgr->query($sql);
        
        $sql="insert into  tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,status) 
              values (7,'�ճ�����','#',7,1,2,2,'A') ";
        $query = $this->dbmgr->query($sql);
        
        $sql="insert into  tb_function (function_id,function_name,function_link,parent_id,function_type,function_group,seq,status) 
              values (8,'�û�����','user.php',7,1,7,71,'A') ";
        $query = $this->dbmgr->query($sql);
		
		
		$this->dbmgr->commit_trans();
	}
	
	
 }
 
 $systemMgr=SystemMgr::getInstance();
 $systemMgr->dbmgr=$dbmgr;
 
 ?>
