
use database classicmodel;

-- Insert into a table from another table
INSERT INTO dup_orders
  SELECT * FROM classicmodels.orders;
  
  
-- Insert manually
INSERT INTO dup_orders (orderNumber, orderDate)
  VALUES (100, '3000-01-01'),
  (300 ,'9000-01-01');
  
  
-- Insert into the table from a csv or txt file. Use FIRSTROW=2 to skip the column headers.
LOAD DATA INFILE 'C:\customers.csv'
INTO TABLE dup_orders
FIELDS TERMINATED BY ',';  
  

-- Delete statement: it deletes existing records from the table based on the condition
DELETE FROM dup_orders 
WHERE
    orderNumber = 100;


-- Update tablw
UPDATE dup_orders 
SET 
    orderDate = '9999-01-01'
WHERE
    orderNumber = 10100;
    

