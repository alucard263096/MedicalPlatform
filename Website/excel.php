<?php
/*
 * Created on 2011-1-23
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
 
  require 'include/common.inc.php';
  require ROOT.'/classes/mgr/excel.cls.php';
 
 $arr=$excelMgr->read(ROOT.'/excel/f.xlsx');
 //print_r($arr);
 
 $caa=array();
 for ($i = 0; $i <=3; $i++) {
 	$ca=array();
 	for($j=0;$j<=$i;$j++)
 	{
 		$c=array();
 		for($k=0;$k<=$j;$k++)
 		{
 			$c[$k]=$k;	
 		}
 		$ca[$j]=$c;
 	}
 	$caa[$i+4]=$ca;
}

 //print_r($caa);
 
 
 $excelMgr->write(ROOT.'/excel/f.xlsx',$caa);
 
 //file,sheetname,row,col,value
 echo $excelMgr->updateCell(ROOT.'/excel/f.xlsx',"5",15,15,"aaa");
 
 
?>
