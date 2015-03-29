ALTER TABLE `medicalplatform`.`dr_tb_doctor_vaccine` 
CHANGE COLUMN `price` `price` INT NOT NULL COMMENT '单次接种疫苗收费' ,
CHANGE COLUMN `web_price` `web_price` INT NOT NULL COMMENT '一次性付款收费' ;
ALTER TABLE `medicalplatform`.`dr_tb_doctor_service` 
CHANGE COLUMN `price` `price` INT(11) NOT NULL ,
CHANGE COLUMN `web_price` `web_price` INT(11) NOT NULL ;
ALTER TABLE `medicalplatform`.`dr_tb_doctor_vaccine` 
CHANGE COLUMN `price` `price` INT(11) NULL COMMENT '单次接种疫苗收费' ;
ALTER TABLE `medicalplatform`.`dr_tb_doctor` 
CHANGE COLUMN `general_price` `general_price` DECIMAL(10,3) NULL COMMENT '全科收费' ,
CHANGE COLUMN `specialist_price` `specialist_price` DECIMAL(10,3) NULL COMMENT '专科收费' ,
CHANGE COLUMN `is_general` `is_general` VARCHAR(1) NULL COMMENT '是否为全科医生' ;
