<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class AppointmentMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new AppointmentMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function Handle($id,$h_status,$h_comment){
		
		$id=parameter_filter($id);
		$h_status=parameter_filter($h_status);
		$h_comment=parameter_filter($h_comment);

		$sql="update dr_tb_order set h_status='$h_status', h_comment='$h_comment',updated_date=now()
		where id=$id ";
		$query = $this->dbmgr->query($sql);

	}
 }
 
 $appointmentMgr=AppointmentMgr::getInstance();
 $appointmentMgr->dbmgr=$dbmgr;
 
 
 
 
?>