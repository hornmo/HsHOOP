-- -----------------------------------------------------
-- CREATING TEMPORARY TABLE
-- -----------------------------------------------------

DROP TABLE IF EXISTS cars_temp;

CREATE SCHEMA IF NOT EXISTS `cars_temp` DEFAULT CHARACTER SET utf8 ;
USE `cars_temp` ;

-- -----------------------------------------------------
-- TABLE `cars_temp`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `cars_temp` (
  `id_temp` INT(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `generation` INT(11) NULL DEFAULT NULL,
  `internaloem` VARCHAR(45) NULL DEFAULT NULL,
  `model_year` INT(11) NULL DEFAULT NULL,
  `sop` VARCHAR(45) NULL DEFAULT NULL,
  `segment` VARCHAR(45) NULL DEFAULT NULL,
  `length` INT(11) NULL DEFAULT NULL,
  `width` INT(11) NULL DEFAULT NULL,
  `height` INT(11) NULL DEFAULT NULL,
  `track_front` INT(11) NULL DEFAULT NULL,
  `track_rear` INT(11) NULL DEFAULT NULL,
  `track_mean` INT(11) NULL DEFAULT NULL,
  `wheelbase` INT(11) NULL DEFAULT NULL,
  `contact_area` FLOAT NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `front_doors` FLOAT NULL DEFAULT NULL,
  `rear_doors` FLOAT NULL DEFAULT NULL,
  `hood` FLOAT NULL DEFAULT NULL,
  `tailgate` FLOAT NULL DEFAULT NULL,
  `front_fenders` FLOAT NULL DEFAULT NULL,
  `hinges` FLOAT NULL DEFAULT NULL,
  `fuelflap` FLOAT NULL DEFAULT NULL,
  `frontend` FLOAT NULL DEFAULT NULL,
  `total_weight` FLOAT NULL DEFAULT NULL,
  `steel` FLOAT NULL DEFAULT NULL,
  `aluminium` FLOAT NULL DEFAULT NULL,
  `magnesium` FLOAT NULL DEFAULT NULL,
  `other` FLOAT NULL DEFAULT NULL,
  `thermoplastics` FLOAT NULL DEFAULT NULL,
  `control` FLOAT NULL DEFAULT NULL,
  `process_stability` FLOAT NULL DEFAULT NULL,
  `re_use_factor` FLOAT NULL DEFAULT NULL,
  `mechanisation` FLOAT NULL DEFAULT NULL,
  `intended_production_vol` INT(11) NULL DEFAULT NULL,
  `production_lead_time` INT(11) NULL DEFAULT NULL,
  `no_parts` INT(11) NULL,
  `parts100g` INT(11) NULL DEFAULT NULL,
  `parts1kg` INT(11) NULL DEFAULT NULL,
  `parts5kg` INT(11) NULL DEFAULT NULL,
  `parts_more5kg` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_temp`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- LOAD PROCEDURE TEMPORARY TABLE
-- -----------------------------------------------------

LOAD DATA LOCAL INFILE 'testdata.csv'
INTO TABLE cars_temp
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES
(
  manufacturer, 
  name, 
  generation, 
  internaloem, 
  model_year, 
  sop, 
  segment, 
  length, 
  width, 
  height, 
  track_front, 
  track_rear, 
  track_mean, 
  wheelbase, 
  contact_area, 
  total, 
  front_doors, 
  rear_doors, 
  hood, 
  tailgate, 
  front_fenders, 
  hinges, 
  fuelflap, 
  frontend, 
  total_weight, 
  steel, 
  aluminium, 
  magnesium, 
  thermoplastics, 
  other, 
  control, 
  process_stability, 
  re_use_factor, 
  mechanisation, 
  intended_production_vol, 
  production_lead_time, 
  no_parts, 
  parts100g, 
  parts1kg, 
  parts5kg, 
  parts_more5kg
  )
;

-- -----------------------------------------------------
-- IF THEN SET NULL
-- -----------------------------------------------------

IF manufacturer = ('' OR 'n.sp.' OR 'n.a.') THEN SET manufacturer = NULL;
IF name = ('' OR 'n.sp.' OR 'n.a.') THEN SET name = NULL;
IF generation = ('' OR 'n.sp.' OR 'n.a.') THEN SET generation = NULL;
IF internaloem = ('' OR 'n.sp.' OR 'n.a.') THEN SET internaloem = NULL;
IF model_year = ('' OR 'n.sp.' OR 'n.a.') THEN SET model_year = NULL;
IF sop = ('' OR 'n.sp.' OR 'n.a.') THEN SET sop = NULL;
IF segment = ('' OR 'n.sp.' OR 'n.a.') THEN SET segment = NULL;
IF length = ('' OR 'n.sp.' OR 'n.a.') THEN SET length = NULL;
IF width = ('' OR 'n.sp.' OR 'n.a.') THEN SET width = NULL;
IF height = ('' OR 'n.sp.' OR 'n.a.') THEN SET height = NULL;
IF track_front = ('' OR 'n.sp.' OR 'n.a.') THEN SET track_front = NULL;
IF track_rear = ('' OR 'n.sp.' OR 'n.a.') THEN SET track_rear = NULL;
IF track_mean = ('' OR 'n.sp.' OR 'n.a.') THEN SET track_mean = NULL;
IF wheelbase = ('' OR 'n.sp.' OR 'n.a.') THEN SET wheelbase = NULL;
IF contact_area = ('' OR 'n.sp.' OR 'n.a.') THEN SET contact_area = NULL;
IF total = ('' OR 'n.sp.' OR 'n.a.') THEN SET total = NULL;
IF front_doors = ('' OR 'n.sp.' OR 'n.a.') THEN SET front_doors = NULL;
IF rear_doors = ('' OR 'n.sp.' OR 'n.a.') THEN SET rear_doors = NULL;
IF hood = ('' OR 'n.sp.' OR 'n.a.') THEN SET hood = NULL;
IF tailgate = ('' OR 'n.sp.' OR 'n.a.') THEN SET tailgate = NULL;
IF front_fenders = ('' OR 'n.sp.' OR 'n.a.') THEN SET front_fenders = NULL;
IF hinges = ('' OR 'n.sp.' OR 'n.a.') THEN SET hinges = NULL;
IF fuelflap = ('' OR 'n.sp.' OR 'n.a.') THEN SET fuelflap = NULL;
IF frontend = ('' OR 'n.sp.' OR 'n.a.') THEN SET frontend = NULL;
IF total_weight = ('' OR 'n.sp.' OR 'n.a.') THEN SET total_weight = NULL;
IF steel = ('' OR 'n.sp.' OR 'n.a.') THEN SET steel = NULL;
IF aluminium = ('' OR 'n.sp.' OR 'n.a.') THEN SET aluminium = NULL;
IF magnesium = ('' OR 'n.sp.' OR 'n.a.') THEN SET magnesium = NULL;
IF thermoplastics = ('' OR 'n.sp.' OR 'n.a.') THEN SET thermoplastics = NULL;
IF other = ('' OR 'n.sp.' OR 'n.a.') THEN SET other = NULL;
IF control = ('' OR 'n.sp.' OR 'n.a.') THEN SET control = NULL;
IF process_stability = ('' OR 'n.sp.' OR 'n.a.') THEN SET process_stability = NULL;
IF re_use_factor = ('' OR 'n.sp.' OR 'n.a.') THEN SET re_use_factor = NULL;
IF mechanisation = ('' OR 'n.sp.' OR 'n.a.') THEN SET mechanisation = NULL;
IF intended_production_vol = ('' OR 'n.sp.' OR 'n.a.') THEN SET intended_production_vol = NULL;
IF production_lead_time = ('' OR 'n.sp.' OR 'n.a.') THEN SET production_lead_time = NULL;
IF no_parts = ('' OR 'n.sp.' OR 'n.a.') THEN SET no_parts = NULL;
IF parts100g = ('' OR 'n.sp.' OR 'n.a.') THEN SET parts100g = NULL;
IF parts1kg = ('' OR 'n.sp.' OR 'n.a.') THEN SET parts1kg = NULL;
IF parts5kg = ('' OR 'n.sp.' OR 'n.a.') THEN SET parts5kg = NULL;
IF parts_more5kg = ('' OR 'n.sp.' OR 'n.a.') THEN SET parts_more5kg = NULL;

-- -----------------------------------------------------
-- INSERT INTO SCHEMA
-- -----------------------------------------------------

INSERT IGNORE INTO `cars`.`model` (manufacturer, name, generation, model_year, sop, segment, internaloem)
VALUES
  (
    SELECT DISTINCT manufacturer, name, generation, model_year, sop, segment, internaloem
    FROM cars_temp
  );

INSERT IGNORE INTO `cars`.`dimensions` (length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, total, fk_model)
VALUES 
  (
    SELECT DISTINCT length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, total, id_temp
    FROM cars_temp
  );

INSERT IGNORE INTO `cars`.`weights` (front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, total, fk_model)
VALUES
  (
    SELECT DISTINCT front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, total_weight, id_temp
    FROM cars_temp
  );

INSERT IGNORE INTO `cars`.`material_mix` (steel, aluminium, magnesium, thermoplastics, other, control, fk_model) 
VALUES
  (
    SELECT DISTINCT steel, aluminium, magnesium, thermoplastics, other, control, id_temp
    FROM cars_temp
  );

INSERT IGNORE INTO `cars`.`production` (process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time, fk_model)
VALUES
  (
    SELECT DISTINCT process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time, id_temp
    FROM cars_temp
  );

INSERT IGNORE INTO `cars`.`parts` (no_parts, parts100g, parts1kg, parts5kg, parts_more5kg, fk_model)
VALUES
  (
    SELECT DISTINCT no_parts, parts100g, parts1kg, parts5kg, parts_more5kg, id_temp
    FROM cars_temp
  );

  -- -----------------------------------------------------
-- DROP TEMPORARY TABLE
-- -----------------------------------------------------

DROP TABLE cars_temp;