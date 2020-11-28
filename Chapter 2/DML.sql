--------------------------------------------------------------
-- SQL tutorial
-- by Mohammad Daneshvar

-- Chapter 2: Data Manipulation Language
--------------------------------------------------------------
use database data;

-- Insert into a table from another table
INSERT INTO orders
  SELECT * FROM data.order_details;
  
  
-- Insert manually
INSERT INTO orders (orderNumber, orderDate)
  VALUES (1, '2020-01-01'),
  (2 ,'2020-01-02'),
  (3 ,'2020-01-03');
  
  
-- Insert into the table from a csv or txt file. Use FIRSTROW=2 to skip the column headers.
LOAD DATA INFILE 'C:\orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',';  
  

-- Delete statement: it deletes records from the table based on the condition
DELETE FROM orders 
WHERE
    orderNumber = 1;


-- Update table
UPDATE orders 
SET 
    orderDate = '9999-01-01'
WHERE
    orderNumber = 2;
    

