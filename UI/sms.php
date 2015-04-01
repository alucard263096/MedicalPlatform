<?php

  require 'include/common.inc.php';
  require ROOT.'/classes/datamgr/sms.cls.php';
  $arr["mobile"]="15920593055";
  $smsMgr->SendVaccineOrderInfoMessage($arr);

?>