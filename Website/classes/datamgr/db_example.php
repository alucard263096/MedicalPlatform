<?php
/*
 * Created on 2011-1-20
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
  class ExampleMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static $webServiceClient = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new ExampleMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function getString($language_id)
	{
		$sql="select * from ccccc";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	public function getString_one($language_id)
	{
		$sql="select * from ccccc";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;
	}
	
	public function testTrans()
	{
		$this->dbmgr->begin_trans();
		
		$sql="insert into ccccc value (3)";
		$query = $this->dbmgr->query($sql);
		$sql="insert into ccccc value (4)";
		$query = $this->dbmgr->query($sql);
		
		$this->dbmgr->commit_trans();
	}
	
 }
 
 $dBExampleMgr=ExampleMgr::getInstance();
 $dBExampleMgr->dbmgr=$dbmgr;
 
 
 
 
?>