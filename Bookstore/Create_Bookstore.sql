-- MySQL Script generated by MySQL Workbench
-- Fri Jul 21 03:04:13 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Bookstore
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Bookstore` ;

-- -----------------------------------------------------
-- Schema Bookstore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Bookstore` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema bookstore
-- -----------------------------------------------------
USE `Bookstore` ;

-- -----------------------------------------------------
-- Table `Bookstore`.`book_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`book_categories` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`book_categories` (
  `category_id` BIGINT NULL DEFAULT NULL,
  `category_name` TEXT NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`authors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`authors` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`authors` (
  `author_id` BIGINT NULL DEFAULT NULL,
  `author_name` TEXT NOT NULL,
  PRIMARY KEY (`author_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`books` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`books` (
  `book_id` BIGINT NULL DEFAULT NULL,
  `title` TEXT NOT NULL,
  `isbn` TEXT NOT NULL,
  `publication_year` INT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `author_id` INT NULL DEFAULT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE INDEX (`isbn` ASC) VISIBLE,
  INDEX (`category_id` ASC) VISIBLE,
  INDEX (`author_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`category_id`)
    REFERENCES `Bookstore`.`book_categories` (`category_id`),
  CONSTRAINT ``
    FOREIGN KEY (`author_id`)
    REFERENCES `Bookstore`.`authors` (`author_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`customers` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`customers` (
  `customer_id` BIGINT NULL DEFAULT NULL,
  `first_name` TEXT NOT NULL,
  `last_name` TEXT NOT NULL,
  `email` TEXT NOT NULL,
  `phone` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`orders` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`orders` (
  `order_id` BIGINT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `order_date` DATE NOT NULL,
  `total_amount` DECIMAL NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX (`customer_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`customer_id`)
    REFERENCES `Bookstore`.`customers` (`customer_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`order_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`order_details` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`order_details` (
  `order_detail_id` BIGINT NULL DEFAULT NULL,
  `order_id` INT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  `quantity` INT NOT NULL,
  `subtotal` DECIMAL NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  INDEX (`order_id` ASC) VISIBLE,
  INDEX (`book_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`order_id`)
    REFERENCES `Bookstore`.`orders` (`order_id`),
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`book_inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`book_inventory` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`book_inventory` (
  `book_id` INT NULL DEFAULT NULL,
  `quantity_in_stock` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX (`book_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`customer_addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`customer_addresses` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`customer_addresses` (
  `address_id` BIGINT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `address_line1` TEXT NOT NULL,
  `address_line2` TEXT NULL DEFAULT NULL,
  `city` TEXT NOT NULL,
  `postal_code` TEXT NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX (`customer_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`customer_id`)
    REFERENCES `Bookstore`.`customers` (`customer_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`employees` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`employees` (
  `employee_id` BIGINT NULL DEFAULT NULL,
  `first_name` TEXT NOT NULL,
  `last_name` TEXT NOT NULL,
  `job_title` TEXT NOT NULL,
  `hire_date` DATE NOT NULL,
  `salary` DECIMAL NOT NULL,
  PRIMARY KEY (`employee_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`employee_sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`employee_sales` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`employee_sales` (
  `sale_id` BIGINT NULL DEFAULT NULL,
  `employee_id` INT NULL DEFAULT NULL,
  `sale_date` DATE NOT NULL,
  `total_sales` DECIMAL NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX (`employee_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`employee_id`)
    REFERENCES `Bookstore`.`employees` (`employee_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`book_reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`book_reviews` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`book_reviews` (
  `review_id` BIGINT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `rating` INT NOT NULL,
  `review_text` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  INDEX (`book_id` ASC) VISIBLE,
  INDEX (`customer_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`),
  CONSTRAINT ``
    FOREIGN KEY (`customer_id`)
    REFERENCES `Bookstore`.`customers` (`customer_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`book_promotions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`book_promotions` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`book_promotions` (
  `promotion_id` BIGINT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  `discount_percent` DECIMAL NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`promotion_id`),
  INDEX (`book_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`payment_methods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`payment_methods` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`payment_methods` (
  `payment_method_id` BIGINT NULL DEFAULT NULL,
  `method_name` TEXT NOT NULL,
  PRIMARY KEY (`payment_method_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`payments` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`payments` (
  `payment_id` BIGINT NULL DEFAULT NULL,
  `order_id` INT NULL DEFAULT NULL,
  `payment_method_id` INT NULL DEFAULT NULL,
  `payment_date` DATE NOT NULL,
  `amount_paid` DECIMAL NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX (`order_id` ASC) VISIBLE,
  INDEX (`payment_method_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`order_id`)
    REFERENCES `Bookstore`.`orders` (`order_id`),
  CONSTRAINT ``
    FOREIGN KEY (`payment_method_id`)
    REFERENCES `Bookstore`.`payment_methods` (`payment_method_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`book_editions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`book_editions` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`book_editions` (
  `edition_id` BIGINT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  `edition_name` TEXT NOT NULL,
  `publication_year` INT NOT NULL,
  PRIMARY KEY (`edition_id`),
  INDEX (`book_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`book_sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`book_sales` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`book_sales` (
  `sale_id` BIGINT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  `sale_date` DATE NOT NULL,
  `sale_quantity` INT NOT NULL,
  `sale_amount` DECIMAL NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX (`book_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`staff_assignments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`staff_assignments` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`staff_assignments` (
  `assignment_id` BIGINT NULL DEFAULT NULL,
  `employee_id` INT NULL DEFAULT NULL,
  `assignment_details` TEXT NOT NULL,
  PRIMARY KEY (`assignment_id`),
  INDEX (`employee_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`employee_id`)
    REFERENCES `Bookstore`.`employees` (`employee_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`wishlists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`wishlists` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`wishlists` (
  `wishlist_id` BIGINT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`),
  INDEX (`customer_id` ASC) VISIBLE,
  INDEX (`book_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`customer_id`)
    REFERENCES `Bookstore`.`customers` (`customer_id`),
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`book_ratings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`book_ratings` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`book_ratings` (
  `rating_id` BIGINT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `rating` INT NOT NULL,
  PRIMARY KEY (`rating_id`),
  INDEX (`book_id` ASC) VISIBLE,
  INDEX (`customer_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`),
  CONSTRAINT ``
    FOREIGN KEY (`customer_id`)
    REFERENCES `Bookstore`.`customers` (`customer_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`book_recommendations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`book_recommendations` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`book_recommendations` (
  `recommendation_id` BIGINT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  `recommended_book_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`recommendation_id`),
  INDEX (`book_id` ASC) VISIBLE,
  INDEX (`recommended_book_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`),
  CONSTRAINT ``
    FOREIGN KEY (`recommended_book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`));


-- -----------------------------------------------------
-- Table `Bookstore`.`staff_reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bookstore`.`staff_reviews` ;

CREATE TABLE IF NOT EXISTS `Bookstore`.`staff_reviews` (
  `review_id` BIGINT NULL DEFAULT NULL,
  `book_id` INT NULL DEFAULT NULL,
  `employee_id` INT NULL DEFAULT NULL,
  `review_text` TEXT NOT NULL,
  PRIMARY KEY (`review_id`),
  INDEX (`book_id` ASC) VISIBLE,
  INDEX (`employee_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`book_id`)
    REFERENCES `Bookstore`.`books` (`book_id`),
  CONSTRAINT ``
    FOREIGN KEY (`employee_id`)
    REFERENCES `Bookstore`.`employees` (`employee_id`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
