-- use database
use database classicmodels;


-- select tables
SELECT * FROM customers;
SELECT * FROM orderdetails;
SELECT * FROM orders;


-- inner join 
SELECT t1.orderNumber, t2.orderDate ,t1.quantityOrdered
FROM orderdetails t1
INNER JOIN
orders t2 ON t1.orderNumber=t2.orderNumber
ORDER BY orderNumber


-- left join 
SELECT  t2.customerNumber, t1.customerName, sum(amount) AS summation
FROM customers t1
 LEFT JOIN
payments t2 ON t2.customerNumber=t1.customerNumber
WHERE t1.customerName like 'L%'
GROUP BY customerName
HAVING summation >10000
ORDER BY customerName;

