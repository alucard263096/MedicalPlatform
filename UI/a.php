

ALTER TABLE `medicalplatform`.`dr_tb_member_vaccine_order` 
ADD COLUMN `idport_type` VARCHAR(1) NULL AFTER `h_comment`,
ADD COLUMN `idport` VARCHAR(40) NULL AFTER `idport_type`;
