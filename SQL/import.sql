-- -----------------------------------------------------
-- CREATING TEMPORARY TABLE
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP TABLE IF EXISTS cars_temp;

CREATE SCHEMA IF NOT EXISTS `cars_temp` DEFAULT CHARACTER SET utf8 ;
USE `cars_temp` ;

-- -----------------------------------------------------
-- Table `cars_temp`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_temp`.`model` (
  `id_model` INT(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `model_year` INT(11) NULL DEFAULT NULL,
  `sop` VARCHAR(45) NULL DEFAULT NULL,
  `segment` VARCHAR(45) NULL DEFAULT NULL,
  `internaloem` VARCHAR(45) NULL DEFAULT NULL,
  `generation` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_model`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_temp`.`weights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_temp`.`weights` (
  `id_weights` INT(11) NOT NULL AUTO_INCREMENT,
  `biw` FLOAT NULL DEFAULT NULL,
  `front_doors` FLOAT NULL DEFAULT NULL,
  `rear_doors` FLOAT NULL DEFAULT NULL,
  `hood` FLOAT NULL DEFAULT NULL,
  `tailgate` FLOAT NULL DEFAULT NULL,
  `front_fenders` FLOAT NULL DEFAULT NULL,
  `hinges` FLOAT NULL DEFAULT NULL,
  `fuelflap` FLOAT NULL DEFAULT NULL,
  `frontend` FLOAT NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `fk_model` INT(11) NOT NULL,
  PRIMARY KEY (`id_weights`),
  INDEX `fk_weights_model1_idx` (`fk_model` ASC),
  CONSTRAINT `fk_weights_model1`
    FOREIGN KEY (`fk_model`)
    REFERENCES `cars_temp`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_temp`.`production`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_temp`.`production` (
  `id_production` INT(11) NOT NULL AUTO_INCREMENT,
  `process_stability` FLOAT NULL DEFAULT NULL,
  `re_use_factor` FLOAT NULL DEFAULT NULL,
  `mechanisation` FLOAT NULL DEFAULT NULL,
  `intended_production_vol` INT(11) NULL DEFAULT NULL,
  `production_lead_time` INT(11) NULL DEFAULT NULL,
  `fk_model` INT(11) NOT NULL,
  PRIMARY KEY (`id_production`),
  INDEX `fk_production_model1_idx` (`fk_model` ASC),
  CONSTRAINT `fk_production_model1`
    FOREIGN KEY (`fk_model`)
    REFERENCES `cars_temp`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_temp`.`parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_temp`.`parts` (
  `id_parts` INT(11) NOT NULL AUTO_INCREMENT,
  `no_parts` INT(11) NULL,
  `parts100g` INT(11) NULL DEFAULT NULL,
  `parts1kg` INT(11) NULL DEFAULT NULL,
  `parts5kg` INT(11) NULL DEFAULT NULL,
  `parts_more5kg` INT(11) NULL DEFAULT NULL,
  `fk_model` INT(11) NOT NULL,
  PRIMARY KEY (`id_parts`),
  INDEX `fk_parts_model1_idx` (`fk_model` ASC),
  CONSTRAINT `fk_parts_model1`
    FOREIGN KEY (`fk_model`)
    REFERENCES `cars_temp`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_temp`.`material_mix`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_temp`.`material_mix` (
  `id_material_mix` INT(11) NOT NULL AUTO_INCREMENT,
  `steel` FLOAT NULL DEFAULT NULL,
  `aluminium` FLOAT NULL DEFAULT NULL,
  `magnesium` FLOAT NULL DEFAULT NULL,
  `other` FLOAT NULL DEFAULT NULL,
  `thermoplastics` FLOAT NULL DEFAULT NULL,
  `control` FLOAT NULL DEFAULT NULL,
  `fk_model` INT(11) NOT NULL,
  PRIMARY KEY (`id_material_mix`),
  INDEX `fk_material_mix_model1_idx` (`fk_model` ASC),
  CONSTRAINT `fk_material_mix_model1`
    FOREIGN KEY (`fk_model`)
    REFERENCES `cars_temp`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars_temp`.`dimensions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_temp`.`dimensions` (
  `id_dimensions` INT(11) NOT NULL AUTO_INCREMENT,
  `length` INT(11) NULL DEFAULT NULL,
  `width` INT(11) NULL DEFAULT NULL,
  `height` INT(11) NULL DEFAULT NULL,
  `track_front` INT(11) NULL DEFAULT NULL,
  `track_rear` INT(11) NULL DEFAULT NULL,
  `track_mean` INT(11) NULL DEFAULT NULL,
  `wheelbase` INT(11) NULL DEFAULT NULL,
  `contact_area` FLOAT NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `fk_model` INT(11) NOT NULL,
  PRIMARY KEY (`id_dimensions`),
  INDEX `fk_dimensions_model1_idx` (`fk_model` ASC),
  CONSTRAINT `fk_dimensions_model1`
    FOREIGN KEY (`fk_model`)
    REFERENCES `cars_temp`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- LOAD PROCEDURE
-- -----------------------------------------------------

LOAD DATA LOCAL INFILE 'testdata.csv'
INTO TABLE cars_temp.model
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES
(manufacturer, name, generation, internaloem, model_year, sop, segment)



;