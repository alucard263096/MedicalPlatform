<?php
  require 'include/common.inc.php';
  require ROOT.'/classes/modelmgr/TestXmlModel.cls.php';
  $action=
  $model=new TestXmlModel();
  $model->ShowList($smarty);
?>