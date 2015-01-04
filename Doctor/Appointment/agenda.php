<?php
  require '../include/common.inc.php';
  include ROOT.'/include/init.inc.php';
  require ROOT.'/classes/datamgr/order.cls.php';
  
  $smarty->assign("MyModule","appointment");

  $office_id=base64_decode($_REQUEST["id"]);
  $smarty->assign("MyMenuId","agenda_$office_id");
  
    $smarty->display(ROOT.'/templates/appointment/agenda.html');


?>