<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class RequisitionMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new RequisitionMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
  
  public function checkHasRequisition($qq,$phone,$companyname)
  {
		$qq=trim(parameter_filter($qq));
		$phone=trim(parameter_filter($phone));
		$company_name=trim(parameter_filter($company_name));
    
    $sql="select 1 from tb_requisition 
    where ('$qq'<>'' and qq='$qq')
    or ('$qq'<>'' and phone='$phone' )
    or ('$company_name'<>'' and company_name='$company_name' )";
    
    $query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query);
    
    return count($result)>0;
  }
  
  public function getRequisition($id){
  
		$id=parameter_filter($id);
		$sql="select *
		from tb_requisition
		where id=$id ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;
  }
  
  public function getUnprocessCount(){
    $sql="select count(1) from tb_requisition 
    where status='P' ";
    
    $query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query);
    
     return $result[0];
  }
	
	//status P 申请中，A 完成，I 拒绝
	
	public function search($name,$phone,$qq,$company_name,$company_phone,
                                    $from,$to,$status)
	{
		$name=parameter_filter($name);
		$phone=parameter_filter($phone);
		$qq=parameter_filter($qq);
		$company_name=parameter_filter($company_name);
		$company_phone=parameter_filter($company_phone);
		$status=parameter_filter($status);
		$from=parameter_filter($from);
		$to=parameter_filter($to);
    
	  $sql="select distinct dt.*
		,dt.updated_user,u.user_name updated_username,dt.updated_date 
		from tb_requisition dt
		left join tb_user u on dt.updated_user=u.user_id
		where  ('$status'='ALL' or dt.status like '%$status%')
    and dt.phone like '%$phone%' 
    and dt.qq like '%$qq%' 
    and dt.company_name like '%$company_name%' 
    and dt.company_phone like '%$company_phone%' 
		and ('$from'='' or dt.applied_date >= '$from 0:0:0' )
		and ('$to'='' or dt.applied_date <= '$to 23:59:59' )
		order by dt.applied_date ";
		
    
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		return $result;
	}
	
 public function submitRequisition($name,$position,$email,$phone,$qq,
 $company_name,$company_city,$company_address,$company_phone,$company_website,
 $knew,$message,$question)
 {
		$name=parameter_filter($name);
		$position=parameter_filter($position);
		$email=parameter_filter($email);
		$phone=parameter_filter($phone);
		$qq=parameter_filter($qq);
		$company_name=parameter_filter($company_name);
		$company_city=parameter_filter($company_city);
		$company_address=parameter_filter($company_address);
		$company_phone=parameter_filter($company_phone);
		$company_website=parameter_filter($company_website);
		$knew=parameter_filter($knew);
		$message=parameter_filter($message);
		$question=parameter_filter($question);
		
			
			$sql="select ifnull(max(id),0)+1 from tb_requisition ";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$id=$result[0];
			$sql="insert into `tb_requisition` 
	(id, name,position,email,phone,qq,
 company_name,company_city,company_address,company_phone,company_website,
 knew,message,question,status, remarks, applied_date)
	values
	($id, '$name','$position','$email','$phone','$qq',
 '$company_name','$company_city','$company_address','$company_phone','$company_website',
 '$knew','$message','$question','P','',now())";
  
			$query = $this->dbmgr->query($sql);
			
		$this->dbmgr->commit_trans();
		
		return "right".$id;
	}
  
  public function editStatus($id,$status,$remarks
					 	,$sysUser_id){
    
		$id=parameter_filter($id);
		$status=parameter_filter($status);
		$description=parameter_filter($description);
    
    $sql="update tb_requisition set status='$status',
                                    remarks='$remarks',
                                    updated_user=$sysUser_id,
                                    updated_date=now()
                                    where id=$id";
                                    
                                    
			$query = $this->dbmgr->query($sql);
      return "right";
    
  }
	
 }
 
 $requisitionMgr=RequisitionMgr::getInstance();
 $requisitionMgr->dbmgr=$dbmgr;
 
 
 
 
?>