--------------------------------------------------------------
-- SQL tutorial
-- by Mohammad Daneshvar

-- Chapter 1: Data Definition Language
--------------------------------------------------------------
CREATE Database data

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    `id` INT NOT NULL,
    `orderNumber` INT NOT NULL,
    `orderDate` DATE NULL,
    `shippedDate` DATE DEFAULT NULL,
    `status` VARCHAR(15) NULL,
    `comments` TEXT,
    `customerNumber` INT NOT NULL,
    `customerName` VARCHAR(30) NOT NULL,
    `customerLocation` VARCHAR(30) NULL,
    `primary key` (id)
);


-- Alter: add a primary key if not specified already 
ALTER TABLE orders
ADD PRIMARY KEY (ID);


-- Alter: drop a primary key
ALTER TABLE orders
DROP PRIMARY KEY;


-- Alter: change the data type
ALTER TABLE orders
CHANGE customerName customerName char(128) NOT NULL;


-- Alter: add a new column
ALTER TABLE orders
ADD CustomerPhone varchar(255) Null;


-- Rename 
RENAME TABLE orders TO order_details;

-- Equivalently we can rename the table in this way:
ALTER TABLE orders RENAME order_details;


-- Truncate: it deletes the table but preserves the structure of the table.
TRUNCATE TABLE order_details;

-- Drop: table is deleted with its full structure. It cannot be rolled back.
DROP TABLE order_details;



CREATE DATABASE 

USE `data`;

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`),
  KEY `reportsTo` (`reportsTo`),
  KEY `officeCode` (`officeCode`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 

(1002,'Danesh','Moh','x5800','daneshmoh@company.com','1',NULL,'President'),

(1056,'Johnson','Eric','x4611','jeric@company.com','1',1002,'VP Sales'),

(1076,'Lopez','Mike','x9273','lomike@company.com','1',1002,'VP Marketing'),

(1088,'Grant','Alan','x4871','grantal@company.com','6',1056,'Sales Manager (APAC)'),

(1102,'Malcolm','Ian','x5408','malian@company.com','4',1056,'Sale Manager (EMEA)');


DROP TABLE IF EXISTS `offices`;

CREATE TABLE `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL,
  PRIMARY KEY (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `offices`(`officeCode`,`city`,`phone`,`addressLine1`,`state`,`country`,`postalCode`,`territory`) values 

('1','San Francisco','+1 123 123 3245','100 Market Street','CA','USA','94080','NA'),

('2','Boston','+1 222 222 2222','1550 Court Place','MA','USA','02107','NA'),

('3','NYC','+1 333 333 3333','523 East 53rd Street','NY','USA','10022','NA'),

('4','Paris','+444 444 4444','43 Rue Jouffroy D\'abbans',NULL,'France','75017','EMEA'),

('5','Tokyo','+555 555 5555','4-1 Kioicho','Chiyoda-Ku','Japan','102-8578','Japan');
