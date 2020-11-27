-- use database
Use classicmodels;

-- Create a table
DROP TABLE IF EXISTS dup_orders;

CREATE TABLE IF NOT EXISTS dup_orders (
    `orderNumber` INT  NOT NULL,
    `orderDate` DATE  NULL,
    `requiredDate` DATE  NULL,
    `shippedDate` DATE DEFAULT NULL,
    `status` VARCHAR(15)  NULL,
    `comments` TEXT,
    `customerNumber` INT NOT NULL,
     `customerName` VARCHAR(30) NOT NULL,
     `customerLocation` VARCHAR(30) NULL
);


-- Insert into the table from a csv file. Use FIRSTROW=2 to skip the column headers.
LOAD DATA INFILE 'C:\customers.csv'
INTO TABLE dup_orders
FIELDS TERMINATED BY ',';
   
   
-- Insert into the table using select statement and another table
INSERT INTO dup_orders
  SELECT * FROM classicmodels.orders;
  
  
-- Or insert manually
INSERT INTO dup_orders (orderNumber, orderDate)
  VALUES (100, '3000-01-01'),
  (300 ,'9000-01-01');
  

--  Select all data in a ascending order of ordernumbers
SELECT 
    *
FROM
    dup_orders
ORDER BY orderNumber ASC;


-- A different table named customer
SELECT 
    *
FROM
    customers;
    

-- Extract all phone numbers starting with 508  
SELECT 
    phone
FROM
    customers
WHERE
    phone LIKE ('508%');


-- Select with aliases 
SELECT 
    contactFirstName, COUNT(contactFirstName) as FirstNameCount
FROM
    customers
GROUP BY contactFirstName;


--  Return a table with customerNumber and summation columns with information about
--  customers who have paid more than $1000 after 2004-01-01.
SELECT 
    customerNumber, SUM(amount) AS summation
FROM
    payments
WHERE
    paymentDate > '2004-01-01'
GROUP BY customerNumber
HAVING summation > 1000
ORDER BY summation;


COMMIT; -- A transaction control language used to save the changes permanently.
        -- Should be used specially before delete, insert or update statements

DELETE FROM dup_orders WHERE orderNumber=100;
SELECT * FROM dup_orders ORDER BY orderNumber ASC;
-- Rollback changes it back to the last commit.
ROLLBACK; 
SELECT * FROM dup_orders;



COMMIT; -- Changes are saved and this transaction can not be undone.
UPDATE dup_orders SET orderDate='9999-01-01' WHERE orderNumber=10100;
ROLLBACK; -- Changes back to the last commit.
