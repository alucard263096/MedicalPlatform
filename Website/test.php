<?php

$item["current"]=true;
$item["title"]="管理工具";
$item["link"]="#";

$url["name"]="数据库备份";
$url["urlPathinfo"]="url";
$subitemcontent["url1"]=$url;
$url["name"]="数据库删除";
$url["urlPathinfo"]="url";
$subitemcontent["url2"]=$url;
$list["aaca"]=$subitemcontent;



$url["name"]="数据库备份";
$url["urlPathinfo"]="url";
$subitemcontent["url1"]=$url;
$url["name"]="数据库删除";
$url["urlPathinfo"]="url";
$subitemcontent["url2"]=$url;
$list["aav"]=$subitemcontent;

$url["name"]="数据库备份";
$url["urlPathinfo"]="url";
$subitemcontent["url1"]=$url;
$url["name"]="数据库删除";
$url["urlPathinfo"]="url";
$subitemcontent["url2"]=$url;
$list["aaa"]=$subitemcontent;

$item["list"]=$list;

print_r($item);
echo json_encode($item)

?>