<?php
	require ROOT.'/libs/Excel/reader.php';



function getArrayFromExcel($filepath){

$data = new Spreadsheet_Excel_Reader();
$data->setOutputEncoding('utf-8');

$data->read($filepath);
	$arrR=array();
	
	for ($i = 1; $i <= $data->sheets[0]['numRows']; $i++) {
		$arrC=array();
		for ($j = 1; $j <= $data->sheets[0]['numCols']; $j++) {
			$arrC[$j]=$data->sheets[0]['cells'][$i][$j];
			//echo "\"".$data->sheets[0]['cells'][$i][$j]."\",";
		}
		$arrR[$i]=$arrC;
	}
	return $arrR;
}

?>