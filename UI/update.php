<?php

  require 'include/common.inc.php';

  
  $sql=" CREATE VIEW `dr_v_member_info` AS
select *,
        now() updated_date from dr_tb_member m
inner join dr_tb_member_info i on m.id=i.member_id
";
	$query = $dbmgr->query($sql);
	
  $sql=" 
	CREATE  OR REPLACE VIEW `dr_v_member_payment` AS
select m.id member_id,m.mobile,m.name,concat(m.mobile,'-',m.name) fullname,o.id,op.*,
        now() updated_date from dr_tb_member m
inner join dr_tb_order o on m.id=o.member_id
inner join dr_tb_order_payment op on o.id=op.order_id

";
	$query = $dbmgr->query($sql);
	
?>