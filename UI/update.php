<?php

  require 'include/common.inc.php';

  
  $sql=" CREATE VIEW `dr_v_member_info` AS
 SELECT 
        `m`.`id` AS `id`,
        `m`.`email` AS `email`,
        `m`.`mobile` AS `mobile`,
        `m`.`password` AS `password`,
        `m`.`name` AS `name`,
        `m`.`status` AS `status`,
        `i`.`member_id` AS `member_id`,
        `i`.`photo` AS `photo`,
        `i`.`is_male` AS `is_male`,
        `i`.`birth` AS `birth`,
        `i`.`location` AS `location`,
        `i`.`is_completed` AS `is_completed`,
        `i`.`height` AS `height`,
        `i`.`weight` AS `weight`,
        `i`.`has_new_die` AS `has_new_die`,
        `i`.`has_ill_relate` AS `has_ill_relate`,
        `i`.`has_vaccine` AS `has_vaccine`,
        `i`.`has_treat` AS `has_treat`,
        `i`.`smoke` AS `smoke`,
        `i`.`drink` AS `drink`,
        `i`.`long_medicine` AS `long_medicine`,
        `i`.`allergy` AS `allergy`,
        NOW() AS `updated_date`
    FROM
        (`dr_tb_member` `m`
        JOIN `dr_tb_member_info` `i` ON ((`m`.`id` = `i`.`member_id`)))
";
	$query = $dbmgr->query($sql);
	
  $sql=" 
	CREATE  OR REPLACE VIEW `dr_v_member_payment` AS
SELECT 
        `m`.`id` AS `member_id`,
        `m`.`mobile` AS `mobile`,
        `m`.`name` AS `name`,
        CONCAT(`m`.`mobile`, '-', `m`.`name`) AS `fullname`,
        `op`.`order_id` AS `id`,
        `op`.`order_id` AS `order_id`,
        `op`.`payment` AS `payment`,
        `op`.`trade_pin_code` AS `trade_pin_code`,
        `op`.`payment_type` AS `payment_type`,
        `op`.`is_submit` AS `is_submit`,
        `op`.`trade_no` AS `trade_no`,
        `op`.`payment_time` AS `payment_time`,
        `op`.`real_payment` AS `real_payment`,
        `op`.`real_payment_confirmer` AS `real_payment_confirmer`,
        `op`.`real_payment_confirm_date` AS `real_payment_confirm_date`,
        NOW() AS `updated_date`
    FROM
        ((`dr_tb_member` `m`
        JOIN `dr_tb_order` `o` ON ((`m`.`id` = `o`.`member_id`)))
        JOIN `dr_tb_order_payment` `op` ON ((`o`.`id` = `op`.`order_id`)))

";
	$query = $dbmgr->query($sql);
	
?>