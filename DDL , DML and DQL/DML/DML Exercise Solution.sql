-- 1.	Write a query to create the above categories table & insert all records.
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories (category_id, category_name) VALUES
(25, 'Deli'),
(50, 'Produce'),
(75, 'Bakery'),
(100, 'General Merchandise'),
(125, 'Technology');

--2.	Write a SQL query to insert one record into the categories table. This new record would have a category_id of 150 and a category_name as 'Miscellaneous'.
INSERT INTO categories (category_id, category_name) 
VALUES (150, 'Miscellaneous');

--3.	Write a SQL code to delete all the records where category_id is less than 100.
DELETE FROM categories 
WHERE category_id < 100;

-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
--1.	Write a SQL Code to create employees table.
CREATE TABLE employees_dml (
    employee_number INT PRIMARY KEY,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    salary DECIMAL(10, 2),
    dept_id INT
);

--2.	Write a single SQL statement to insert all records in employees table.
INSERT INTO employees_dml (employee_number, last_name, first_name, salary, dept_id) 
VALUES 
(1001, 'Smith', 'John', 62000, 500),
(1002, 'Anderson', 'Jane', 57500, 500),
(1003, 'Everest', 'Brad', 71000, 501),
(1004, 'Horvath', 'Jack', 42000, 501);

--3.	Write a code to insert record in employees table. This new record would have employee_number of 1005, first_name as 'Mary', salary of 47500 & employee_number of 1006, last_name as 'William', salary of 32000.
INSERT INTO employees_dml (employee_number, last_name, first_name, salary, dept_id) 
VALUES 
(1005, NULL, 'Mary', 47500, NULL),
(1006, 'William', NULL, 32000, NULL);

--4.	Write a code to update all salary of employees by 20 percent.
UPDATE employees_dml 
SET salary = salary * 1.20;

--5.	Write a SQL query to delete all records for dept_id of 501.
DELETE FROM employees_dml 
WHERE dept_id = 501;

-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

--1.	Write a SQL Query to create & insert all records in suppliers table.
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- Insert records into the suppliers table
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES
(100, 'Microsoft', 'Redmond', 'Washington'),
(200, 'Google', 'Mountain View', 'California'),
(300, 'Oracle', 'Redwood City', 'California'),
(400, 'Kimberly-Clark', 'Irving', 'Texas'),
(500, 'Tyson Foods', 'Springdale', 'Arkansas'),
(600, 'SC Johnson', 'Racine', 'Wisconsin'),
(700, 'Dole Food Company', 'Westlake Village', 'California'),
(800, 'Flowers Foods', 'Thomasville', 'Georgia'),
(900, 'Electronic Arts', 'Redwood City', 'California');


--2.	Write a query to delete a record where state as ‘California’ and supplier_name as ‘Google’.
DELETE FROM suppliers 
WHERE state = 'California' AND supplier_name = 'Google';

--3.	Write a query to delete a record where state as ‘California’ and supplier_name as ‘Google’ and ‘Oracle’.
DELETE FROM suppliers 
WHERE state = 'California' AND supplier_name IN ('Google', 'Oracle');

--4.	Write a query to delete a record from suppliers table where supplier_name as ‘Microsoft’.
DELETE FROM suppliers 
WHERE supplier_name = 'Microsoft';

--5.	Write a query to delete a record from suppliers table where state as ‘California’.
DELETE FROM suppliers 
WHERE state = 'California';


