<?php
  require 'include/common.inc.php';
  require ROOT.'/classes/modelmgr/TestXmlModel.cls.php';

  $model=new TestXmlModel();
  $model->ShowList($smarty);
?>