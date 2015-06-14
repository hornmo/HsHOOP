-- MySQL Script generated by MySQL Workbench
-- 06/14/15 13:54:50
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars` DEFAULT CHARACTER SET latin1 ;
USE `cars` ;

-- -----------------------------------------------------
-- Table `cars`.`joining_process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`joining_process` (
  `id_joining_process` INT(11) NOT NULL AUTO_INCREMENT,
  `spot_welds` FLOAT NULL DEFAULT NULL,
  `arc_welding` FLOAT NULL DEFAULT NULL,
  `friction_stir_welding` FLOAT NULL DEFAULT NULL,
  `laser_welding` FLOAT NULL DEFAULT NULL,
  `conventional_brazing` FLOAT NULL DEFAULT NULL,
  `adhesive_joining` FLOAT NULL DEFAULT NULL,
  `rivets` FLOAT NULL DEFAULT NULL,
  `clinch_spots` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id_joining_process`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cars`.`lengths`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`lengths` (
  `id_lengths` INT(11) NOT NULL AUTO_INCREMENT,
  `length` INT(11) NULL DEFAULT NULL,
  `width` INT(11) NULL DEFAULT NULL,
  `height` INT(11) NULL DEFAULT NULL,
  `track_front` INT(11) NULL DEFAULT NULL,
  `track_rear` INT(11) NULL DEFAULT NULL,
  `wheelbase` INT(11) NULL DEFAULT NULL,
  `contact_area` INT(11) NULL DEFAULT NULL,
  `lengthscol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_lengths`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cars`.`weights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`weights` (
  `id_weights` INT(11) NOT NULL AUTO_INCREMENT,
  `biw` INT(11) NULL DEFAULT NULL,
  `front_doors` INT(11) NULL DEFAULT NULL,
  `rear_doors` INT(11) NULL DEFAULT NULL,
  `hood` INT(11) NULL DEFAULT NULL,
  `tailgate` INT(11) NULL DEFAULT NULL,
  `front_fenders` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_weights`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cars`.`stiffness_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`stiffness_data` (
  `id_stiffness_data` INT(11) NOT NULL AUTO_INCREMENT,
  `first_trimmed_body` FLOAT NULL DEFAULT NULL,
  `second_trimmed_body` FLOAT NULL DEFAULT NULL,
  `first_body` FLOAT NULL DEFAULT NULL,
  `second_body` FLOAT NULL DEFAULT NULL,
  `torsional` FLOAT NULL DEFAULT NULL,
  `bend` FLOAT NULL DEFAULT NULL,
  `stiffness_datacol` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id_stiffness_data`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cars`.`material_mix`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`material_mix` (
  `id_material_mix` INT(11) NOT NULL AUTO_INCREMENT,
  `low_strength_steel` FLOAT NULL DEFAULT NULL,
  `hss` FLOAT NULL DEFAULT NULL,
  `ahss` FLOAT NULL DEFAULT NULL,
  `stainless_steel` FLOAT NULL DEFAULT NULL,
  `uhss` FLOAT NULL DEFAULT NULL,
  `aluminium` FLOAT NULL DEFAULT NULL,
  `magnesium` FLOAT NULL DEFAULT NULL,
  `frp` FLOAT NULL DEFAULT NULL,
  `smc` FLOAT NULL DEFAULT NULL,
  `thermoplastics` FLOAT NULL DEFAULT NULL,
  `elastomers` FLOAT NULL DEFAULT NULL,
  `material_mixcol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_material_mix`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cars`.`production`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`production` (
  `id_production` INT(11) NOT NULL AUTO_INCREMENT,
  `process` FLOAT NULL DEFAULT NULL,
  `re_use_factor` FLOAT NULL DEFAULT NULL,
  `mechanisation` FLOAT NULL DEFAULT NULL,
  `intended_production_vol` INT(11) NULL DEFAULT NULL,
  `production_lead_time` TIME NULL DEFAULT NULL,
  `cycle_time` TIME NULL DEFAULT NULL,
  `degree_material_utilisation` FLOAT NULL DEFAULT NULL,
  `no_parts` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_production`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cars`.`production_sites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`production_sites` (
  `id_production_sites` INT(11) NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_production_sites`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cars`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`model` (
  `id_model` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `model_year` INT(11) NULL DEFAULT NULL,
  `segment` VARCHAR(45) NULL DEFAULT NULL,
  `fk_lengths` INT(11) NOT NULL,
  `fk_weights` INT(11) NOT NULL,
  `fk_joining_process` INT(11) NOT NULL,
  `fk_stiffness_data` INT(11) NOT NULL,
  `fk_material_mix` INT(11) NOT NULL,
  `fk_production` INT(11) NOT NULL,
  `fk_production_sites` INT(11) NOT NULL,
  PRIMARY KEY (`id_model`),
  INDEX `fk_model_lengths1_idx` (`fk_lengths` ASC),
  INDEX `fk_model_weights1_idx` (`fk_weights` ASC),
  INDEX `fk_model_joining_process1_idx` (`fk_joining_process` ASC),
  INDEX `fk_model_stiffness_data1_idx` (`fk_stiffness_data` ASC),
  INDEX `fk_model_material_mix1_idx` (`fk_material_mix` ASC),
  INDEX `fk_model_production1_idx` (`fk_production` ASC),
  INDEX `fk_model_production_sites1_idx` (`fk_production_sites` ASC),
  CONSTRAINT `fk_model_lengths1`
    FOREIGN KEY (`fk_lengths`)
    REFERENCES `cars`.`lengths` (`id_lengths`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_weights1`
    FOREIGN KEY (`fk_weights`)
    REFERENCES `cars`.`weights` (`id_weights`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_joining_process1`
    FOREIGN KEY (`fk_joining_process`)
    REFERENCES `cars`.`joining_process` (`id_joining_process`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_stiffness_data1`
    FOREIGN KEY (`fk_stiffness_data`)
    REFERENCES `cars`.`stiffness_data` (`id_stiffness_data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_material_mix1`
    FOREIGN KEY (`fk_material_mix`)
    REFERENCES `cars`.`material_mix` (`id_material_mix`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_production1`
    FOREIGN KEY (`fk_production`)
    REFERENCES `cars`.`production` (`id_production`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_production_sites1`
    FOREIGN KEY (`fk_production_sites`)
    REFERENCES `cars`.`production_sites` (`id_production_sites`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cars`.`manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`manufacturer` (
  `id_manufacturer` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `model_id_model` INT(11) NOT NULL,
  PRIMARY KEY (`id_manufacturer`),
  INDEX `fk_manufacturer_model_idx` (`model_id_model` ASC),
  CONSTRAINT `fk_manufacturer_model`
    FOREIGN KEY (`model_id_model`)
    REFERENCES `cars`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
