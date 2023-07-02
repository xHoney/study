-- MySQL Script generated by MySQL Workbench
-- Sun Jul  2 00:30:37 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema online_shop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `online_shop` ;

-- -----------------------------------------------------
-- Schema online_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_shop` DEFAULT CHARACTER SET utf8 ;
USE `online_shop` ;

-- -----------------------------------------------------
-- Table `online_shop`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `online_shop`.`Users` ;

CREATE TABLE IF NOT EXISTS `online_shop`.`Users` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(15) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `lastname` VARCHAR(30) NOT NULL,
  `email` VARCHAR(319) NOT NULL,
  `password` VARCHAR(60) NOT NULL COMMENT 'passw => hash',
  `data_regist` DATE NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `id_Users_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `online_shop`.`Category` ;

CREATE TABLE IF NOT EXISTS `online_shop`.`Category` (
  `category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `online_shop`.`Product` ;

CREATE TABLE IF NOT EXISTS `online_shop`.`Product` (
  `product_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` DECIMAL(10,3) NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  INDEX `category_id_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `online_shop`.`Category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `online_shop`.`Orders` ;

CREATE TABLE IF NOT EXISTS `online_shop`.`Orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `order_date` DATETIME NOT NULL,
  `order_status` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `online_shop`.`Users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`Order_Details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `online_shop`.`Order_Details` ;

CREATE TABLE IF NOT EXISTS `online_shop`.`Order_Details` (
  `order_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `online_shop`.`Orders` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `online_shop`.`Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
