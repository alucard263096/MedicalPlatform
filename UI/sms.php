<?php

  require 'include/common.inc.php';
  require ROOT.'/classes/datamgr/sms.cls.php';
  $arr["mobile"]="13751082562";
  $smsMgr->SendVaccineOrderInfoMessage($arr);

?>