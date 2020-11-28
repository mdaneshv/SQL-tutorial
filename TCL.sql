 --------------------------------------------------------------
-- SQL tutorial
-- by Mohammad Daneshvar

-- Chapter 4: Transaction Control Language
--------------------------------------------------------------

 
 use data;

-- Commit: a transaction control language used to save the changes permanently.
-- Should be used specially before delete, insert or update statements
COMMIT;

DELETE FROM orders 
WHERE
    orderNumber = 100;
SELECT 
    *
FROM
    orders
ORDER BY orderNumber ASC;


-- Rollback cancels all modifications made by the current transaction.
-- it changes everything back to the last commit.
ROLLBACK;
SELECT 
    *
FROM
    orders;


COMMIT;-- Changes are saved and this transaction can not be undone.

UPDATE orders 
SET 
    orderDate = '2020-01-01'
WHERE
    orderNumber = 100;
    
ROLLBACK;

