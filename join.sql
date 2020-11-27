-- use database
use database classicmodels;


-- select tables
SELECT * FROM customers;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM payments;


-- inner join 
SELECT 
    t1.orderNumber, t2.orderDate, t1.quantityOrdered
FROM
    orderdetails t1
        INNER JOIN
    orders t2 ON t1.orderNumber = t2.orderNumber
ORDER BY orderNumber;


-- left join 
SELECT 
    t2.customerNumber, t1.customerName, SUM(amount) AS summation
FROM
    customers t1
        LEFT JOIN
    payments t2 ON t2.customerNumber = t1.customerNumber
WHERE
    t1.customerName LIKE 'L%'
GROUP BY customerName
HAVING summation > 10000
ORDER BY customerName;


-- union 
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no,
            d.dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022)
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY emp_no
    ORDER BY emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no,
            d.dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039)
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY emp_no
    ORDER BY emp_no) AS B 
UNION SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no,
            d.dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022)
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY emp_no) AS C 
UNION SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no,
            d.dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039)
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY emp_no) AS D;
