<?php

  require 'include/common.inc.php';

  
  $sql=" USE `medicalplatform`;
CREATE  OR REPLACE VIEW `dr_v_order` AS
select main.*,
p.payment,p.trade_pin_code,p.payment_type,p.is_submit,p.trade_no,p.payment_time,p.real_payment,p.real_payment_confirmer,p.real_payment_confirm_date,
e.express_com,e.express_no,e.report_express_com,e.report_express_no,
sub.vaccine_id,sub.doctor_id,sub.office_id,0 gene_id 
from dr_tb_order main
inner join dr_tb_order_vaccine sub on main.id=sub.order_id and main.act='vc'
left join dr_tb_order_payment p on main.id=p.order_id
left join dr_tb_order_express e on main.id=e.order_id
union
select main.*,
p.payment,p.trade_pin_code,p.payment_type,p.is_submit,p.trade_no,p.payment_time,p.real_payment,p.real_payment_confirmer,p.real_payment_confirm_date,
e.express_com,e.express_no,e.report_express_com,e.report_express_no,
0 vaccine_id,0 doctor_id,0 office_id,sub.gene_id gene_id from dr_tb_order main
inner join dr_tb_order_gene sub on main.id=sub.order_id and main.act='gn'
left join dr_tb_order_payment p on main.id=p.order_id
left join dr_tb_order_express e on main.id=e.order_id;
";
	$query = $dbmgr->query($sql);

	


?>