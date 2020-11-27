
-- Delete statement 
DELETE FROM dup_orders 
WHERE
    orderNumber = 100;


-- Update tabel
UPDATE dup_orders 
SET 
    orderDate = '9999-01-01'
WHERE
    orderNumber = 10100;
    

