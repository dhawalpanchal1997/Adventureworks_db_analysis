CREATE TABLE jobs (
    JOB_ID NVARCHAR(10) PRIMARY KEY,
    JOB_TITLE NVARCHAR(100),
    MIN_SALARY INT,
    MAX_SALARY INT
);
INSERT INTO jobs (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
VALUES
('AD_MAN', 'MANAGER', 20080, 40000),
('AD_ANA', 'ANALYST', 15000, 30000),
('AD_PRES', 'President', 20080, 40000),
('AD_VP', 'Administration Vice President', 15000, 30000),
('AD_ASST', 'Administration Assistant', 3000, 6000),
('FI_MGR', 'Finance Manager', 8200, 16000),
('FI_ACCOUNT', 'Accountant', 4200, 9000),
('AC_MGR', 'Accounting Manager', 8200, 16000),
('AC_ACCOUNT', 'Public Accountant', 4200, 9000),
('SA_MAN', 'Sales Manager', 10000, 20080),
('SA_REP', 'Sales Representative', 6000, 12008),
('PU_MAN', 'Purchasing Manager', 8000, 15000),
('PU_CLERK', 'Purchasing Clerk', 2500, 5500),
('ST_MAN', 'Stock Manager', 5500, 8500),
('ST_CLERK', 'Stock Clerk', 2008, 5000),
('SH_CLERK', 'Shipping Clerk', 2500, 5500),
('IT_PROG', 'Programmer', 4000, 10000),
('MK_MAN', 'Marketing Manager', 9000, 15000),
('MK_REP', 'Marketing Representative', 4000, 9000),
('HR_REP', 'Human Resources Representative', 4000, 9000),
('PR_REP', 'Public Relations Representative', 4500, 10500);

CREATE TABLE job_history (
    EMPLOYEE_ID INT,
    START_DATE DATE,
    END_DATE DATE,
    JOB_ID NVARCHAR(10),
    DEPARTMENT_ID INT,
    PRIMARY KEY (EMPLOYEE_ID, START_DATE, JOB_ID), -- Composite primary key
    FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID) -- Assuming `jobs` table exists and is referenced
);
INSERT INTO job_history (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
VALUES
(1025, '2001-01-13', '2006-07-24', 'IT_PROG', 1001),
(1015, '1997-09-21', '2001-10-27', 'AC_ACCOUNT', 1001),
(1018, '2001-10-28', '2005-03-15', 'AC_MGR', 1001),
(2019, '2004-02-17', '2007-12-19', 'MK_REP',1001),
(1146, '2006-03-24', '2007-12-31', 'IT_PROG', 2001),
(2024, '2004-02-17', '2007-12-19', 'MK_REP',2001),
(107888, '2003-01-13', '2008-07-24', 'AD_ANA', 320),
(103050, '1997-09-21', '2008-10-27', 'AD_MAN', 280),
(107885, '1998-10-21', '2008-10-27', 'AD_ANA', 320),
(103008, '2001-01-13', '2008-07-24', 'AD_MAN', 280),
(107826, '1997-09-21', '2008-10-27', 'AD_ANA', 290),
(102, '2001-01-13', '2006-07-24', 'IT_PROG', 60),
(101, '1997-09-21', '2001-10-27', 'AC_ACCOUNT', 110),
(101, '2001-10-28', '2005-03-15', 'AC_MGR', 110),
(201, '2004-02-17', '2007-12-19', 'MK_REP', 20),
(114, '2006-03-24', '2007-12-31', 'ST_CLERK', 50),
(122, '2007-01-01', '2007-12-31', 'ST_CLERK', 50),
(200, '1995-09-17', '2001-06-17', 'AD_ASST', 90),
(176, '2006-03-24', '2006-12-31', 'SA_REP', 80),
(176, '2007-01-01', '2007-12-31', 'SA_MAN', 80),
(200, '2002-07-01', '2006-12-31', 'AC_ACCOUNT', 90);
CREATE TABLE countries (
    COUNTRY_ID NVARCHAR(2) PRIMARY KEY,
    COUNTRY_NAME NVARCHAR(100),
    REGION_ID INT
);
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES
('AR', 'Argentina', 2),
('AU', 'Australia', 3),
('BE', 'Belgium', 1),
('BR', 'Brazil', 2),
('CA', 'Canada', 2),
('CH', 'Switzerland', 1),
('CN', 'China', 3),
('DE', 'Germany', 1),
('DK', 'Denmark', 1),
('EG', 'Egypt', 4),
('FR', 'France', 1),
('IL', 'Israel', 4),
('IN', 'India', 3),
('IT', 'Italy', 1),
('JP', 'Japan', 3),
('KW', 'Kuwait', 4),
('ML', 'Malaysia', 3),
('MX', 'Mexico', 2),
('NG', 'Nigeria', 4),
('NL', 'Netherlands', 1),
('SG', 'Singapore', 3),
('UK', 'United Kingdom', 1),
('US', 'United States of America', 2),
('ZM', 'Zambia', 4),
('ZW', 'Zimbabwe', 4);
CREATE TABLE employees (
    EMPLOYEE_ID      INT PRIMARY KEY,
    FIRST_NAME       VARCHAR(50),
    LAST_NAME        VARCHAR(50),
    EMAIL            VARCHAR(100),
    PHONE_NUMBER     VARCHAR(20),
    HIRE_DATE        DATE,
    JOB_ID           VARCHAR(10),
    SALARY           DECIMAL(10, 2),
    COMMISSION_PCT   DECIMAL(2, 2),
    MANAGER_ID       INT,
    DEPARTMENT_ID    INT
);
INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) 
VALUES
(1121, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '2006-03-07', 'FI_ACCOUNT', 7800.00, 0.00, 108, 1001),
(1131, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '2007-12-07', 'FI_ACCOUNT', 6900.00, 0.00, 108, 1001),
(1141, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07', 'PU_MAN', 11000.00, 0.00, 100, 2001),
(1151, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '2003-05-18', 'PU_CLERK', 3100.00, 0.00, 114, 2001),
(103254, 'SANDRINE', 'BAKE', 'SKING', '515.123.4567', '2003-06-17', 'AD_MAN', 2400.00, 0.00, 0, 280),
(103050, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_MAN', 2400.00, 0.00, 0, 280),
(107885, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_ANA', 1700.00, 0.00, 100, 320),
(107665, 'ADELYN', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_ANA', 1400.00, 0.00, 100, 320),
(107888, 'FRANK', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_ANA', 1400.00, 0.00, 100, 320),
(103010, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_MAN', 1400.00, 0.00, 0, 280),
(107852, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_ANA', 1700.00, 0.00, 100, 290),
(103008, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_MAN', 2400.00, 0.00, 0, 280),
(107826, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_ANA', 2700.00, 0.00, 100, 290),
(103007, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 2400.00, 0.00, 0, 280),
(107825, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 2700.00, 0.00, 100, 290),
(100, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 17000.00, 0.00, 100, 90),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', 17000.00, 0.00, 100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000.00, 0.00, 102, 60),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000.00, 0.00, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', 4800.00, 0.00, 103, 60),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', 4800.00, 0.00, 103, 60),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', 4200.00, 0.00, 103, 60),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', 12008.00, 0.00, 101, 100),
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', 9000.00, 0.00, 108, 100),
(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', 8200.00, 0.00, 108, 100),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '2005-09-30', 'FI_ACCOUNT', 7700.00, 0.00, 108, 100),
(112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '2006-03-07', 'FI_ACCOUNT', 7800.00, 0.00, 108, 1001),
(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '2007-12-07', 'FI_ACCOUNT', 6900.00, 0.00, 108, 1001),
(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07', 'PU_MAN', 11000.00, 0.00, 100, 2001),
(115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '2003-05-18', 'PU_CLERK', 3100.00, 0.00, 114, 2001),
(116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '2005-12-24', 'PU_CLERK', 2900.00, 0.00, 114, 30),
(117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '2005-07-24', 'PU_CLERK', 2800.00, 0.00, 114, 30),
(118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '2006-11-15', 'PU_CLERK', 2600.00, 0.00, 114, 30),
(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '2007-08-10', 'PU_CLERK', 2500.00, 0.00, 114, 30),
(120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '2004-07-18', 'ST_MAN', 8000.00, 0.00, 100, 50),
(121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '2005-04-10', 'ST_MAN', 8200.00, 0.00, 100, 50),
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '2003-05-01', 'ST_MAN', 7900.00, 0.00, 100, 50),
(123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '2005-10-10', 'ST_MAN', 6500.00, 0.00, 100, 50),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '2007-11-16', 'ST_MAN', 5800.00, 0.00, 100, 50),
(125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '2005-07-16', 'ST_CLERK', 3200.00, 0.00, 120, 50),
(126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '2006-09-28', 'ST_CLERK', 2700.00, 0.00, 120, 50),
(127, 'James', 'Landry', 'JLANDRY', '650.124.1334', '2007-01-14', 'ST_CLERK', 2400.00, 0.00, 120, 50),
(128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '2008-03-08', 'ST_CLERK', 2200.00, 0.00, 120, 50),
(129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '2005-08-20', 'ST_CLERK', 3300.00, 0.00, 121, 50),
(130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '2005-10-30', 'ST_CLERK', 2800.00, 0.00, 121, 50),
(131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '2005-02-16', 'ST_CLERK', 2500.00, 0.00, 121, 50),
(132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '2007-04-10', 'ST_CLERK', 2100.00, 0.00, 121, 50),
(133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '2004-06-14', 'ST_CLERK', 3300.00, 0.00, 122, 50),
(134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '2006-08-26', 'ST_CLERK', 2800.00, 0.00, 122, 50),
(135, 'Irene', 'Zabers', 'IZABERS', '650.127.1734', '2007-01-30', 'ST_CLERK', 2300.00, 0.00, 122, 50);

UPDATE employees
SET DEPARTMENT_ID = 20
WHERE DEPARTMENT_ID = 50

UPDATE employees
SET HIRE_DATE = '2024-09-21'
WHERE EMPLOYEE_ID = 107852

CREATE TABLE locations (
    LOCATION_ID     INT PRIMARY KEY,
    STREET_ADDRESS  VARCHAR(100),
    POSTAL_CODE     VARCHAR(20),
    CITY            VARCHAR(50),
    STATE_PROVINCE  VARCHAR(50),
    COUNTRY_ID      CHAR(2)
);
INSERT INTO locations (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(3300, '1297 Via Cola di Rie', '989', 'PERTH', NULL, 'IT'),
(1000, '1297 Via Cola di Rie', '989', 'Roma', NULL, 'IT'),
(1100, '93091 Calle della Testa', '10934', 'Venice', NULL, 'IT'),
(1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
(1300, '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'),
(1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
(1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
(1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
(1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
(1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
(1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
(2000, '40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN'),
(2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
(2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
(2300, '198 Clementi North', '540198', 'Singapore', NULL, 'SG'),
(2400, '8204 Arthur St', NULL, 'London', NULL, 'UK'),
(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),
(2600, '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),
(2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
(2800, 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
(3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
(3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX');
CREATE TABLE departments (
    DEPARTMENT_ID   INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(50),
    MANAGER_ID      INT,
    LOCATION_ID     INT
);

INSERT INTO departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(1001, 'Control And Credit', 0, 1700),
(2001, 'Shareholder Services', 0, 1700),
(320, 'AUDIT', 201, 3300),
(280, 'FINANCE', 200, 2200),
(290, 'FINANCE', 201, 3300),
(10, 'Administration', 200, 1700),
(20, 'Marketing', 201, 1800),
(30, 'Purchasing', 114, 1700),
(40, 'Human Resources', 203, 2400),
(50, 'Shipping', 121, 1500),
(60, 'IT', 103, 1400),
(70, 'Public Relations', 204, 2700),
(80, 'Sales', 145, 2500),
(90, 'Executive', 100, 1700),
(100, 'Finance', 108, 1700),
(110, 'Accounting', 205, 1700),
(120, 'Treasury', 0, 1700),
(130, 'Corporate Tax', 0, 1700),
(140, 'Control And Credit', 0, 1700),
(150, 'Shareholder Services', 0, 1700),
(160, 'Benefits', 0, 1700),
(170, 'Manufacturing', 0, 1700),
(180, 'Construction', 0, 1700),
(190, 'Contracting', 0, 1700),
(200, 'Operations', 0, 1700),
(210, 'IT Support', 0, 1700),
(220, 'NOC', 0, 1700),
(230, 'IT Helpdesk', 0, 1700),
(240, 'Government Sales', 0, 1700),
(250, 'Retail Sales', 0, 1700),
(260, 'Recruiting', 0, 1700),
(270, 'Payroll', 0, 1700);

-- Creating the Salesman table
CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(3, 2)
);

-- Creating the Orders table
CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

-- Inserting data into the Salesman table
INSERT INTO Salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

-- Inserting data into the Orders table
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70003, 1200.75, '2023-01-15', 3003, 5005),
(70006, 1750.25, '2023-01-22', 3006, 5007),
(70010, 3000.00, '2023-02-05', 3010, 5006),
(70011, 1800.00, '2023-02-07', 3011, 5003),
(70012, 2800.25, '2023-02-10', 3012, 5007),
(70013, 2250.50, '2023-02-12', 3013, 5001),
(70014, 1950.75, '2023-02-14', 3014, 5002),
(70015, 1400.00, '2023-02-16', 3015, 5005),
(70016, 2700.80, '2023-02-18', 3016, 5006),
(70017, 3300.60, '2023-02-20', 3017, 5003),
(70018, 1450.90, '2023-02-22', 3018, 5007),
(70019, 1980.30, '2023-02-25', 3019, 5001),
(70020, 2600.00, '2023-02-27', 3020, 5002),
(70021, 3150.25, '2023-03-01', 3021, 5005),
(70022, 2750.45, '2023-03-03', 3022, 5006),
(70023, 1950.00, '2023-03-05', 3023, 5003),
(70024, 3100.75, '2023-03-08', 3024, 5007),
(70025, 2300.50, '2023-03-10', 3025, 5001),
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);

CREATE TABLE employee_grades (
    grade INT PRIMARY KEY,
    min_sal INT,
    max_sal INT
);

INSERT INTO employee_grades (grade, min_sal, max_sal)
VALUES
    (1, 800, 1300),
    (2, 1301, 1500),
    (3, 1501, 2100),
    (4, 2101, 3100),
    (5, 3101, 9999);

exec sp_rename 'employee_grades' , 'salary_grades'

CREATE TABLE physician (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    ssn VARCHAR(9) NOT NULL
);

--------------------------------------------------------------------------
--1-	Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
SELECT *
FROM Orders 
WHERE salesman_id IN (SELECT salesman_id FROM Salesman WHERE name = 'Paul Adam')

--2-	Write a query in SQL to display all the details of managers.
SELECT *
FROM employees
WHERE EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID FROM employees)

--3-	Write a query in SQL to list the employee ID, name, salary, department name of all the 'MANAGERS' and 'ANALYST' working in SYDNEY, PERTH with an exp more than 5 years without receiving the commission and display the list in ascending order of location.
SELECT 
		EMPLOYEE_ID,
		CONCAT_WS(' ',FIRST_NAME,LAST_NAME) AS FULL_NAME,
		SALARY,
		(SELECT DEPARTMENT_NAME 
		 FROM departments 
		 WHERE departments.DEPARTMENT_ID = employees.DEPARTMENT_ID) AS DEPARTMENT_NAME
FROM employees
WHERE JOB_ID IN (SELECT JOB_ID FROM jobs WHERE JOB_TITLE IN ('MANAGER','ANALYST'))
  AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM departments WHERE LOCATION_ID IN (SELECT LOCATION_ID FROM locations WHERE CITY IN ('SYDNEY','PERTH') ) )
  AND EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM job_history WHERE DATEDIFF(YEAR,START_DATE,END_DATE) >=5)
  AND COMMISSION_PCT = 0.00

--4-	Write a query in SQL to display the employee ID, name, salary, department name, location, department ID, job name of all the employees working at SYDNEY or working in the FINANCE department with an annual salary above 28000, but the monthly salary should not be 3000 or 2800 and who does not works as a MANAGER and whose ID containing a digit of '3' or '7' in 3rd position. List the result in ascending order of department ID and descending order of job name.

SELECT EMPLOYEE_ID,
	   CONCAT_WS(' ',FIRST_NAME,LAST_NAME) AS FULL_NAME,
	   SALARY,
	   (SELECT DEPARTMENT_NAME FROM departments WHERE departments.DEPARTMENT_ID = employees.DEPARTMENT_ID) as DEPARTMENT_NAME,
	   (SELECT CITY FROM locations WHERE locations.LOCATION_ID = (SELECT LOCATION_ID FROM departments WHERE departments.DEPARTMENT_ID = employees.DEPARTMENT_ID)) as Location,
	   DEPARTMENT_ID,
	   (SELECT JOB_TITLE FROM jobs WHERE jobs.JOB_ID = employees.JOB_ID) as Job_Name
FROM employees
WHERE 
	DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
					  FROM departments 
					  WHERE LOCATION_ID IN (SELECT LOCATION_ID FROM locations WHERE CITY IN ('SYDNEY','PERTH') )
							AND DEPARTMENT_NAME IN ('FINANCE'))
	AND 12*(SALARY) > 28000 
	AND SALARY NOT IN (2800,3000)
	AND JOB_ID IN (SELECT JOB_ID FROM jobs WHERE JOB_TITLE  NOT IN ('MANAGERS'))
	AND EMPLOYEE_ID LIKE '__[3,7]%'
ORDER BY DEPARTMENT_ID ASC, Job_Name DESC

--5-	Write a query in SQL to list all the employees of grade 2 and 3.
SELECT 
		EMPLOYEE_ID,
		CONCAT_WS(' ',FIRST_NAME,LAST_NAME) AS FULL_NAME,
		(SELECT grade FROM salary_grades WHERE employees.SALARY BETWEEN salary_grades.min_sal AND salary_grades.max_sal)as SALARY_GRADE
FROM employees
WHERE SALARY IN (SELECT salary 
					FROM employees 
					WHERE (salary > 1301 AND salary < 1500) 
					   OR (salary > 1501 AND salary < 2100) )

--6-	Write a query in SQL to list the employees of grade 3 and 4 working in the department of FINANCE or AUDIT and whose salary is more than the salary of ADELYN and experience is more than FRANK. List the result in the ascending order of experience.

SELECT 
		EMPLOYEE_ID,
		CONCAT_WS(' ',FIRST_NAME,LAST_NAME) AS FULL_NAME,
		(SELECT DEPARTMENT_NAME 
		 FROM departments 
		 WHERE departments.DEPARTMENT_ID = employees.DEPARTMENT_ID) AS DEPARTMENT_NAME,
		 SALARY,
		(SELECT grade FROM salary_grades WHERE employees.SALARY BETWEEN salary_grades.min_sal AND salary_grades.max_sal)as SALARY_GRADE,
		(SELECT DATEDIFF(YEAR,START_DATE,END_DATE) as exp FROM job_history WHERE job_history.EMPLOYEE_ID = employees.EMPLOYEE_ID) as Experience
FROM employees
WHERE SALARY IN (SELECT salary 
				 FROM employees 
				 WHERE (salary > 2101 AND salary < 3100) 
					   OR (salary > 1501 AND salary < 2100) )
	  AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
					  FROM departments 
					  WHERE DEPARTMENT_NAME IN ('FINANCE','AUDIT'))
	  AND SALARY > (SELECT salary FROM employees WHERE FIRST_NAME IN ('ADELYN'))
	  AND EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM job_history WHERE DATEDIFF(YEAR,START_DATE,END_DATE) > (SELECT DATEDIFF(YEAR,START_DATE,END_DATE) as exp FROM job_history WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM employees WHERE FIRST_NAME IN ('FRANK')) ))
ORDER BY Experience ASC

--7-	Write a query in SQL to list the employees whose designation is same as the designation of SANDRINE or ADELYN.

SELECT  
	EMPLOYEE_ID,
	CONCAT_WS(' ',FIRST_NAME,LAST_NAME) AS FULL_NAME,
	(SELECT JOB_TITLE FROM jobs WHERE jobs.JOB_ID = employees.JOB_ID) as Job_Name
FROM employees
WHERE 
	JOB_ID IN (SELECT JOB_ID FROM jobs WHERE jobs.JOB_ID IN(SELECT JOB_ID FROM employees WHERE FIRST_NAME IN('ADELYN','SANDRINE')))
	AND FIRST_NAME NOT IN ('ADELYN','SANDRINE')

--8-	Write a query in SQL to list any job of department ID 1001 those that are not found in department ID 2001.

SELECT JOB_ID,
	   (SELECT JOB_TITLE FROM jobs WHERE jobs.JOB_ID = job_history.JOB_ID) as Job_Title,
	   DEPARTMENT_ID,
	   (SELECT DEPARTMENT_NAME 
		 FROM departments 
		 WHERE departments.DEPARTMENT_ID = job_history.DEPARTMENT_ID) AS DEPARTMENT_NAME
FROM job_history
WHERE	DEPARTMENT_ID = 1001
		AND JOB_ID NOT IN (SELECT JOB_ID FROM job_history WHERE DEPARTMENT_ID = 2001)

--9-	Write a query in SQL to find the highest paid employees in the department MARKETING.
SELECT EMPLOYEE_ID,
	   CONCAT_WS(' ',FIRST_NAME,LAST_NAME) AS FULL_NAME,
	   SALARY,
	   DEPARTMENT_ID,
	   (SELECT DEPARTMENT_NAME FROM departments WHERE departments.DEPARTMENT_ID=employees.DEPARTMENT_ID) as DEPARTMENT_NAME
FROM employees
WHERE SALARY IN (SELECT MAX(SALARY) 
				 FROM employees 
				 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
										 FROM departments 
										 WHERE DEPARTMENT_NAME IN('Marketing') ))
	  AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
										 FROM departments 
										 WHERE DEPARTMENT_NAME IN('Marketing') )

--10-	Write a query in SQL to list the employees of grade 3 who have been hired in most recently and belongs to PERTH.

SELECT TOP 1
	   EMPLOYEE_ID,
	   CONCAT_WS(' ',FIRST_NAME,LAST_NAME) AS FULL_NAME,
	   HIRE_DATE,
	   SALARY,
	  (SELECT grade FROM salary_grades WHERE employees.SALARY BETWEEN min_sal AND max_sal) as Sal_Grade,
	   DEPARTMENT_ID,
	  (SELECT CITY FROM locations WHERE locations.LOCATION_ID = (SELECT LOCATION_ID FROM departments WHERE departments.DEPARTMENT_ID = employees.DEPARTMENT_ID)) as employee_city
FROM employees
WHERE SALARY BETWEEN (SELECT min_sal FROM salary_grades WHERE grade = 3) AND (SELECT max_sal FROM salary_grades WHERE grade = 3)
	  AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID from departments WHERE LOCATION_ID IN (SELECT LOCATION_ID FROM locations WHERE city = 'PERTH'))
ORDER BY HIRE_DATE DESC
