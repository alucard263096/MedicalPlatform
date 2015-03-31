CREATE TABLE `medicalplatform`.`dr_tb_sms_code` (
  `mobile` VARCHAR(20) NULL,
  `code` VARCHAR(6) NULL,
  `type` VARCHAR(1) NULL,
  `created_time` DATETIME NULL);
  ALTER TABLE `medicalplatform`.`dr_tb_sms_code` 
ADD COLUMN `lastsent_time` DATETIME NULL AFTER `created_time`;
ALTER TABLE `medicalplatform`.`dr_tb_sms_code` 
ADD COLUMN `templete_id` VARCHAR(100) NULL AFTER `lastsent_time`;
ALTER TABLE `medicalplatform`.`dr_tb_sms_code` 
ADD COLUMN `id` INT NOT NULL AFTER `templete_id`,
ADD PRIMARY KEY (`id`);
