USE interview_prep;

DROP TABLE customers_table;
DROP TABLE final;
DROP TABLE orders_table;
DROP TABLE products_table;
DROP TABLE total_1;

-- Table View --

SELECT *
FROM employee_table;

SELECT *
FROM salary_table;

CREATE TABLE temporary_1 (
SELECT *
FROM salary_table s
JOIN employee_table e
	USING (employee_id)
    );    


CREATE TABLE temporary_2(
SELECT date_format (pay_date, '%Y-%m') as pay_month,
	   department_id,
       AVG (amount) as avg_depart_salary
FROM temporary_1
GROUP BY 1,2
);

SELECT *
FROM temporary_2;

CREATE TABLE temporary_3 (

SELECT date_format (pay_date, '%Y-%m') as pay_month,
	   AVG (amount) as avg_company_salary
FROM temporary_1
GROUP BY 1

);


SELECT t2.pay_month,
	   t2.department_id,
       CASE
			WHEN t1.avg_company_salary < t2.avg_depart_salary THEN 'Higher'
            WHEN t1.avg_company_salary > t2.avg_depart_salary THEN 'Lower'
            ELSE 'Same'
       END AS 'comparison'
FROM temporary_2 t2
LEFT JOIN temporary_3 t1
 USING (pay_month)
 ORDER BY 2,1 ASC;
 
 -- Concepts tested: Joins, Creating new Tables and New Columns, Group By, Arithmetic Logic, CASE statements
 
 
		