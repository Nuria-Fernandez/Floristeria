-- MySQL Script generated by MySQL Workbench
-- Wed Mar  6 01:02:30 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FlowerShopsBBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FlowerShopsBBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FlowerShopsBBDD` DEFAULT CHARACTER SET utf8 ;
USE `FlowerShopsBBDD` ;

-- -----------------------------------------------------
-- Table `FlowerShopsBBDD`.`FlowerShops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlowerShopsBBDD`.`FlowerShops` (
  `IdFlowerShop` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdFlowerShop`),
  UNIQUE INDEX `IdFlowrShop_UNIQUE` (`IdFlowerShop` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlowerShopsBBDD`.`Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlowerShopsBBDD`.`Type` (
  `idType` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TypeName` VARCHAR(15) NULL,
  PRIMARY KEY (`idType`),
  UNIQUE INDEX `idType_UNIQUE` (`idType` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlowerShopsBBDD`.`GardenElements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlowerShopsBBDD`.`GardenElements` (
  `idGardenElements` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TypesId` TINYINT UNSIGNED NOT NULL,
  `features` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGardenElements`),
  UNIQUE INDEX `idGardenElements_UNIQUE` (`idGardenElements` ASC) VISIBLE,
  INDEX `TypeToGardenElements_idx` (`TypesId` ASC) VISIBLE,
  CONSTRAINT `TypeToGardenElements`
    FOREIGN KEY (`TypesId`)
    REFERENCES `FlowerShopsBBDD`.`Type` (`idType`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlowerShopsBBDD`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlowerShopsBBDD`.`Stock` (
  `idStock` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FlowerShopId` INT UNSIGNED NULL,
  `GardenElementsId` INT UNSIGNED NULL,
  `Quantity` SMALLINT UNSIGNED NULL,
  `Price` DECIMAL(6,2) NULL,
  PRIMARY KEY (`idStock`),
  UNIQUE INDEX `idStock_UNIQUE` (`idStock` ASC) VISIBLE,
  INDEX `FlowerShopToStock_idx` (`FlowerShopId` ASC) VISIBLE,
  INDEX `GardenElementsToStock_idx` (`GardenElementsId` ASC) VISIBLE,
  CONSTRAINT `FlowerShopToStock`
    FOREIGN KEY (`FlowerShopId`)
    REFERENCES `FlowerShopsBBDD`.`FlowerShops` (`IdFlowerShop`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `GardenElementsToStock`
    FOREIGN KEY (`GardenElementsId`)
    REFERENCES `FlowerShopsBBDD`.`GardenElements` (`idGardenElements`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlowerShopsBBDD`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlowerShopsBBDD`.`Ticket` (
  `idTicket` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FlowerShopId` INT UNSIGNED NULL,
  `Date` DATETIME NULL DEFAULT NOW(),
  `TotalPrice` SMALLINT UNSIGNED NULL,
  PRIMARY KEY (`idTicket`),
  UNIQUE INDEX `idTicket_UNIQUE` (`idTicket` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlowerShopsBBDD`.`TicketGardenElements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlowerShopsBBDD`.`TicketGardenElements` (
  `idTicketGardenElements` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TicketId` INT UNSIGNED NULL,
  `GardenElementsId` INT UNSIGNED NULL,
  `Quantity` SMALLINT UNSIGNED NULL,
  PRIMARY KEY (`idTicketGardenElements`),
  UNIQUE INDEX `idTicketGardenElements_UNIQUE` (`idTicketGardenElements` ASC) VISIBLE,
  INDEX `TiquetToGardenElements_idx` (`TicketId` ASC) VISIBLE,
  INDEX `GardenElementsToTicket_idx` (`GardenElementsId` ASC) VISIBLE,
  CONSTRAINT `TicketToGardenElements`
    FOREIGN KEY (`TicketId`)
    REFERENCES `FlowerShopsBBDD`.`Ticket` (`idTicket`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `GardenElementsToTicket`
    FOREIGN KEY (`GardenElementsId`)
    REFERENCES `FlowerShopsBBDD`.`GardenElements` (`idGardenElements`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
