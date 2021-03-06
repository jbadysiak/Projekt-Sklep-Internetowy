-- MySQL Script generated by MySQL Workbench
-- 11/22/16 15:20:20
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BazaDanychSklep
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BazaDanychSklep
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BazaDanychSklep` DEFAULT CHARACTER SET utf8 ;
USE `BazaDanychSklep` ;

-- -----------------------------------------------------
-- Table `BazaDanychSklep`.`Kategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BazaDanychSklep`.`Kategoria` (
  `idKategorii` INT NOT NULL,
  `nazwaKategorii` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idKategorii`),
  UNIQUE INDEX `idKategorii_UNIQUE` (`idKategorii` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BazaDanychSklep`.`Producent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BazaDanychSklep`.`Producent` (
  `idProducenta` INT NOT NULL,
  `nazwaProducenta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProducenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BazaDanychSklep`.`Produkt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BazaDanychSklep`.`Produkt` (
  `idProduktu` INT NOT NULL,
  `nazwaProduktu` VARCHAR(45) NOT NULL,
  `cena` DECIMAL NOT NULL,
  `opis` TEXT(2000) NULL,
  `Kategoria_idKategorii` INT NOT NULL,
  `Producent_idProducenta` INT NOT NULL,
  PRIMARY KEY (`idProduktu`),
  INDEX `fk_Produkt_Kategoria_idx` (`Kategoria_idKategorii` ASC),
  INDEX `fk_Produkt_Producent1_idx` (`Producent_idProducenta` ASC),
  CONSTRAINT `fk_Produkt_Kategoria`
    FOREIGN KEY (`Kategoria_idKategorii`)
    REFERENCES `BazaDanychSklep`.`Kategoria` (`idKategorii`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produkt_Producent1`
    FOREIGN KEY (`Producent_idProducenta`)
    REFERENCES `BazaDanychSklep`.`Producent` (`idProducenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
