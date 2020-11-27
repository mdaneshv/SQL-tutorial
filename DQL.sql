-- use database
Use classicmodels;
   
   
--  Select all data in a ascending order of ordernumbers
SELECT 
    *
FROM
    dup_orders
ORDER BY orderNumber ASC;


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


-- Nested selects
 SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Data Analyst');
 
 
 -- Nested selects
 SELECT 
    *
FROM
    titles t
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees)
        AND title = 'Data Analyst';


-- Nested selects
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
