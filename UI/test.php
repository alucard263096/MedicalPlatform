<?php
//获取USER AGENT
$agent = strtolower($_SERVER['HTTP_USER_AGENT']);

//分析数据
$is_pc = (strpos($agent, 'windows nt')) ? true : false;   
$is_iphone = (strpos($agent, 'iphone')) ? true : false;   
$is_ipad = (strpos($agent, 'ipad')) ? true : false;   
$is_android = (strpos($agent, 'android')) ? true : false;   

//输出数据 
    if($is_pc){   
        echo "这是PC";   
    }   
    if($is_iphone){   
        echo "这是iPhone";   
    }   
    if($is_ipad){   
        echo "这是iPad";   
    }   
    if($is_android){   
        echo "这是Android";   
    }   
?>