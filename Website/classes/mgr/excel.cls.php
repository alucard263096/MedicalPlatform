<?php
/*
 * Created on 2011-1-23
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
include ROOT.'/libs/PHPExcel/Classes/PHPExcel.php';

/** PHPExcel_IOFactory */
include ROOT.'/libs/PHPExcel/Classes/PHPExcel/IOFactory.php';
 
 
 class ExcelMgr
 {
 	public $version=null;
 	
 	
 	
	private static $instance = null;
	public static function getInstance() 
	{
		return self::$instance!=null ? self::$instance : new ExcelMgr();
	}
	
	public function read($file)
	{
		if (!file_exists($file)) {
			return null;
		}
		$objReader = PHPExcel_IOFactory::createReader($this->version);
		$objPHPExcel = $objReader->load($file);

		$sheetCount=$objPHPExcel->getSheetCount();
		$sheetArray=array();
		for($i=0;$i<$sheetCount;$i++)
		{
			
			$sheet=$objPHPExcel->getSheet($i);
			$sheetArray[$sheet->getTitle()]=$sheet->toArray();
		}
		
		return $sheetArray;
	}
	
	
	public function write($file,$Array)
	{
		$objPHPExcel = new PHPExcel();
		$objPHPExcel->removeSheetByIndex(0);
		$i=0;
		foreach($Array as $key => $value)
		{
			$sheet=$objPHPExcel->createSheet($i);
			$sheet->fromArray($value);
			$sheet->setTitle((string)$key);
			$i++;
		}
		$objPHPExcel->setActiveSheetIndex(0);
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, $this->version);
		$objWriter->save($file);
		
	}
	
	
	public function updateCell($file,$sheetName,$row,$col,$value)
	{
		
		if (!file_exists($file)) {
			return false;
		}
		$objReader = PHPExcel_IOFactory::createReader($this->version);
		$objPHPExcel = $objReader->load($file);
		$sheet=$objPHPExcel->getSheetByName($sheetName);
		if($sheet==null)
		{
			return false;
		}
		$sheet->setCellValueByColumnAndRow($row,$col,(string)$value);
		
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, $this->version);
		$objWriter->save($file);
		return true;
	}
	
	
 }

$excelMgr = ExcelMgr::getInstance();
$excelMgr->version=$CONFIG['excel']['version'];





?>