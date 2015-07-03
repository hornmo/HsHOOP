-- -----------------------------------------------------
-- CREATING TEMPORARY TABLE
-- -----------------------------------------------------

DROP TABLE IF EXISTS `cars_temp`;

-- -----------------------------------------------------
-- TABLE `cars_temp`
-- -----------------------------------------------------

CREATE TEMPORARY TABLE IF NOT EXISTS `cars_temp` (
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

-- -----------------------------------------------------
-- LOAD PROCEDURE TEMPORARY TABLE
-- -----------------------------------------------------

LOAD DATA LOCAL INFILE 'testdata.csv'
INTO TABLE cars_temp
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
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
UPDATE cars_temp SET manufacturer = NULL WHERE(manufacturer='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET name = NULL WHERE(name='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET generation = NULL WHERE(generation='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET internaloem = NULL WHERE(internaloem='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET model_year = NULL WHERE(model_year='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET sop = NULL WHERE(sop='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET segment = NULL WHERE(segment='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET length = NULL WHERE(length='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET width = NULL WHERE(width='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET height = NULL WHERE(height='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET track_front = NULL WHERE(track_front='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET track_rear = NULL WHERE(track_rear='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET track_mean = NULL WHERE(track_mean='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET wheelbase = NULL WHERE(wheelbase='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET contact_area = NULL WHERE(contact_area='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET total = NULL WHERE(total='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET front_doors = NULL WHERE(front_doors='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET rear_doors = NULL WHERE(rear_doors='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET hood = NULL WHERE(hood='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET tailgate = NULL WHERE(tailgate='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET front_fenders = NULL WHERE(front_fenders='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET hinges = NULL WHERE(hinges='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET fuelflap = NULL WHERE(fuelflap='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET frontend = NULL WHERE(frontend='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET total_weight = NULL WHERE(total_weight='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET steel = NULL WHERE(steel='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET aluminium = NULL WHERE(aluminium='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET magnesium = NULL WHERE(magnesium='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET thermoplastics = NULL WHERE(thermoplastics='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET other = NULL WHERE(other='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET control = NULL WHERE(control='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET process_stability = NULL WHERE(process_stability='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET re_use_factor = NULL WHERE(re_use_factor='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET mechanisation = NULL WHERE(mechanisation='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET intended_production_vol = NULL WHERE(intended_production_vol='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET production_lead_time = NULL WHERE(production_lead_time='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET no_parts = NULL WHERE(no_parts='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET parts100g = NULL WHERE(parts100g='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET parts1kg = NULL WHERE(parts1kg='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET parts5kg = NULL WHERE(parts5kg='' OR 'n.sp.' OR 'n.a.');
UPDATE cars_temp SET parts_more5kg = NULL WHERE(parts_more5kg='' OR 'n.sp.' OR 'n.a.');

-- -----------------------------------------------------
-- INSERT INTO SCHEMA
-- -----------------------------------------------------

INSERT IGNORE INTO `cars`.`model` (manufacturer, name, generation, model_year, sop, segment, internaloem)
SELECT DISTINCT ct.manufacturer, ct.name, ct.generation, ct.model_year, ct.sop, ct.segment, ct.internaloem
FROM cars_temp AS ct;

INSERT IGNORE INTO `cars`.`dimensions` (length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, total, fk_model)
SELECT DISTINCT ct.length, ct.width, ct.height, ct.track_front, ct.track_rear, ct.track_mean, ct.wheelbase, ct.contact_area, ct.total, cm.id_model
FROM cars_temp AS ct, cars.model AS cm;

INSERT IGNORE INTO `cars`.`weights` (front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, total, fk_model)
SELECT DISTINCT ct.front_doors, ct.rear_doors, ct.hood, ct.tailgate, ct.front_fenders, ct.hinges, ct.fuelflap, ct.frontend, ct.total_weight, cm.id_model
FROM cars_temp AS ct, cars.model AS cm;

INSERT IGNORE INTO `cars`.`material_mix` (steel, aluminium, magnesium, thermoplastics, other, control, fk_model) 
SELECT DISTINCT ct.steel, ct.aluminium, ct.magnesium, ct.thermoplastics, ct.other, ct.control, cm.id_model
FROM cars_temp AS ct, cars.model AS cm;

INSERT IGNORE INTO `cars`.`production` (process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time, fk_model)
SELECT DISTINCT ct.process_stability, ct.re_use_factor, ct.mechanisation, ct.intended_production_vol, ct.production_lead_time, cm.id_model
FROM cars_temp AS ct, cars.model AS cm;

INSERT IGNORE INTO `cars`.`parts` (no_parts, parts100g, parts1kg, parts5kg, parts_more5kg, fk_model)
SELECT DISTINCT ct.no_parts, ct.parts100g, ct.parts1kg, ct.parts5kg, ct.parts_more5kg, cm.id_model
FROM cars_temp AS ct, cars.model AS cm;

  -- -----------------------------------------------------
-- DROP TEMPORARY TABLE
-- -----------------------------------------------------

DROP TABLE cars_temp;