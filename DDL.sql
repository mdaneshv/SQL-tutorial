-- Create and Drop 
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
    `ID` INT NOT NULL,
    `orderNumber` INT NOT NULL,
    `orderDate` DATE NULL,
    `requiredDate` DATE NULL,
    `shippedDate` DATE DEFAULT NULL,
    `status` VARCHAR(15) NULL,
    `comments` TEXT,
    `customerNumber` INT NOT NULL,
    `customerName` VARCHAR(30) NOT NULL,
    `customerLocation` VARCHAR(30) NULL,
    `primary key` (employees_name)
);


-- Alter: add a primary key if not specified already 
ALTER TABLE orders
ADD PRIMARY KEY (ID);


-- Alter: drop a primary key
ALTER TABLE orders
DROP PRIMARY KEY;


ALTER TABLE orders
CHANGE customerName customerName char(128) NOT NULL;


-- Rename 
RENAME TABLE orders TO order_details;

-- Equivalently we can rename the table in this way:
ALTER TABLE orders RENAME order_details;


-- Truncate: it deletes the table but preserves the structure of the table.
TRUNCATE TABLE order_details;

-- Drop: table is deleted with its full structure. It cannot be rolled back.
DROP TABLE order_details;

