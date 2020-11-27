 
 -- Commit: a transaction control language used to save the changes permanently.
 -- Should be used specially before delete, insert or update statements
COMMIT;

DELETE FROM dup_orders 
WHERE
    orderNumber = 100;
SELECT 
    *
FROM
    dup_orders
ORDER BY orderNumber ASC;


-- Rollback cancels all modifications made by the current transaction.
-- it changes everything back to the last commit.
ROLLBACK;
SELECT 
    *
FROM
    dup_orders;


COMMIT;-- Changes are saved and this transaction can not be undone.

UPDATE dup_orders 
SET 
    orderDate = '9999-01-01'
WHERE
    orderNumber = 10100;
    
ROLLBACK;
