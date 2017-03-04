-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8 ;
USE `cupcake` ;

-- -----------------------------------------------------
-- Table `cupcake`.`Bottom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`Bottom` (
  `id_bottom` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(11,0) NOT NULL,
  PRIMARY KEY (`id_bottom`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cupcake`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`Cart` (
  `id_cart` INT(11) NOT NULL,
  `id_orderline` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cart`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cupcake`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`Customer` (
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `balance` DECIMAL(11,2) NULL DEFAULT '50.00',
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cupcake`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`Invoice` (
  `id_invoice` INT(11) NOT NULL,
  PRIMARY KEY (`id_invoice`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cupcake`.`Orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`Orderline` (
  `id_orderline` INT(11) NOT NULL,
  `quantity` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_orderline`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cupcake`.`Topping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`Topping` (
  `id_topping` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(11,0) NOT NULL,
  PRIMARY KEY (`id_topping`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

INSERT INTO Bottom(name, price) VALUES("Chocolate", 5.00);
INSERT INTO Bottom(name, price) VALUES("Vanilla", 5.00);
INSERT INTO Bottom(name, price) VALUES("Nutmeg", 5.00);
INSERT INTO Bottom(name, price) VALUES("Pistacio", 6.00);
INSERT INTO Bottom(name, price) VALUES("Almond", 7.00);
INSERT INTO Topping(name, price) VALUES("Chocolate", 5.00);
INSERT INTO Topping(name, price) VALUES("Blueberry", 5.00);
INSERT INTO Topping(name, price) VALUES("Raspberry", 5.00);
INSERT INTO Topping(name, price) VALUES("Crispy", 6.00);
INSERT INTO Topping(name, price) VALUES("Strawberry", 6.00);
INSERT INTO Topping(name, price) VALUES("Rum/Raisin", 7.00);
INSERT INTO Topping(name, price) VALUES("Orange", 8.00);
INSERT INTO Topping(name, price) VALUES("Lemon", 8.00);
INSERT INTO Topping(name, price) VALUES("Blue Cheese", 9.00);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
