-- MySQL Script generated by MySQL Workbench
-- 06/15/15 23:47:22
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
CREATE SCHEMA IF NOT EXISTS `cars` DEFAULT CHARACTER SET utf8 ;
USE `cars` ;

-- -----------------------------------------------------
-- Table `cars`.`weights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`weights` (
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
    REFERENCES `cars`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars`.`production`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`production` (
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
    REFERENCES `cars`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars`.`parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`parts` (
  `id_parts` INT(11) NOT NULL,
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
    REFERENCES `cars`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars`.`material_mix`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`material_mix` (
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
    REFERENCES `cars`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cars`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`model` (
  `id_model` INT(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `model_year` INT(11) NULL DEFAULT NULL,
  `segment` VARCHAR(45) NULL DEFAULT NULL,
  `internaloem` VARCHAR(45) NULL DEFAULT NULL,
  `fk_weights` INT(11) NOT NULL,
  `fk_production` INT(11) NOT NULL,
  `fk_parts` INT(11) NOT NULL,
  `fk_lengths` INT(11) NOT NULL,
  `fk_material_mix` INT(11) NOT NULL,
  PRIMARY KEY (`id_model`),
  INDEX `fk_model_weights_idx` (`fk_weights` ASC),
  INDEX `fk_model_production1_idx` (`fk_production` ASC),
  INDEX `fk_model_parts1_idx` (`fk_parts` ASC),
  INDEX `fk_model_lengths1_idx` (`fk_lengths` ASC),
  INDEX `fk_model_material_mix1_idx` (`fk_material_mix` ASC),
  CONSTRAINT `fk_model_weights`
    FOREIGN KEY (`fk_weights`)
    REFERENCES `cars`.`weights` (`id_weights`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_production`
    FOREIGN KEY (`fk_production`)
    REFERENCES `cars`.`production` (`id_production`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_parts`
    FOREIGN KEY (`fk_parts`)
    REFERENCES `cars`.`parts` (`id_parts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_lengths`
    FOREIGN KEY (`fk_lengths`)
    REFERENCES `cars`.`lengths` (`id_lengths`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_material_mix`
    FOREIGN KEY (`fk_material_mix`)
    REFERENCES `cars`.`material_mix` (`id_material_mix`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


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
  `track_mean` INT(11) NULL DEFAULT NULL,
  `wheelbase` INT(11) NULL DEFAULT NULL,
  `contact_area` FLOAT NULL DEFAULT NULL,
  `fk_model` INT(11) NOT NULL,
  PRIMARY KEY (`id_lengths`),
  INDEX `fk_lengths_model1_idx` (`fk_model` ASC),
  CONSTRAINT `fk_lengths_model1`
    FOREIGN KEY (`fk_model`)
    REFERENCES `cars`.`model` (`id_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
