
--1.	Get me the list of all Employees whose Job Title starts with ‘E’
SELECT 
    p.FirstName,
    p.LastName,
    e.JobTitle
FROM 
    AdventureWorks2012.Person.Person AS p
JOIN 
    AdventureWorks2012.HumanResources.Employee AS e ON p.BusinessEntityID = e.BusinessEntityID
WHERE 
    e.JobTitle LIKE 'E%'
ORDER BY 
    p.FirstName, p.LastName;


--2.	Get me the list of all Employees who have at least one 'E' in the Job Title, and must not have more than two ‘a’.
SELECT 
    p.FirstName,
    p.LastName,
    e.JobTitle
FROM 
    AdventureWorks2012.Person.Person AS p
JOIN 
    AdventureWorks2012.HumanResources.Employee AS e ON p.BusinessEntityID = e.BusinessEntityID
WHERE 
    e.JobTitle LIKE '%E%'  -- Ensures there is at least one 'E'
    AND (LEN(e.JobTitle) - LEN(REPLACE(e.JobTitle, 'a', ''))) <= 2  -- Counts occurrences of 'a' and ensures it's 2 or fewer
ORDER BY 
    p.FirstName, p.LastName;



--3.	Get me the info all the employees where job title contains 2nd character as 'u' and have at least two 's' in it, and 3rd last character 'a'.
SELECT 
    p.FirstName,
    p.LastName,
    e.JobTitle
FROM 
    AdventureWorks2012.Person.Person AS p
JOIN 
    AdventureWorks2012.HumanResources.Employee AS e ON p.BusinessEntityID = e.BusinessEntityID
WHERE 
    e.JobTitle LIKE '_u%' -- Checks if the 2nd character is 'u'
    AND (LEN(e.JobTitle) - LEN(REPLACE(e.JobTitle, 's', ''))) >= 2  -- Ensures there are at least two 's' characters
    AND e.JobTitle LIKE '%a__'  -- Checks if the 3rd last character is 'a'
ORDER BY 
    p.FirstName, p.LastName;



--4.	Get me the list of persons whose has a Middle Name. use Person. Person Table
SELECT 
    BusinessEntityID,
    FirstName,
    MiddleName,
    LastName
FROM 
    AdventureWorks2012.Person.Person
WHERE 
    MiddleName IS NOT NULL
ORDER BY 
    FirstName, LastName;


--5.	Get me the list of all persons first name starts with 'M' and Last Name ends with 'n'.
SELECT 
    BusinessEntityID,
    FirstName,
    MiddleName,
    LastName
FROM 
    AdventureWorks2012.Person.Person
WHERE 
    FirstName LIKE 'M%'  -- Ensures the first name starts with 'M'
    AND LastName LIKE '%n'  -- Ensures the last name ends with 'n'
ORDER BY 
    FirstName, LastName;



-- 6- create this below table and insert the sample row given
CREATE TABLE sample_001 (
    col1 VARCHAR(100)
);

INSERT INTO sample_001 (col1) VALUES 
('A001/DJ-402\44_/100/2015'),
('A001_\DJ-402\44_/100/2015'),
('A001_DJ-402-2014-2015'),
('A002_DJ-401-2014-2015'),
('A001/DJ_401'),
('A001/DJ_402\44'),
('A001/DJ_402\44\2015'),
('A001/DJ-402%45\2015/200'),
('A001/DJ_402\45\2015%100'),
('A001/DJ_402%45\2015/300'),
('A001/DJ-402\44')


-- 6-1. Write a SQL statement to find those rows from the table test table which contain the escape character underscore (_) in its column 'col1'
SELECT  col1
FROM	sample_001
WHERE	col1 LIKE '%H_%' ESCAPE 'H';


--6-2. Write a SQL statement to find those rows from the table test table which does not contain the character (%) in its column 'col1'.
SELECT col1
FROM sample_001
WHERE col1 NOT LIKE '%H%%' ESCAPE 'H';


--6-3. Write a SQL statement to find those rows from the table test table which does not contain the string (/) in its column 'col1'.
SELECT col1
FROM sample_001
WHERE col1 NOT LIKE '%H/%' ESCAPE 'H';

--6-4. Write a SQL statement to find those rows from the table test table which contain the string (/) in its column 'col1'.
SELECT col1
FROM sample_001
WHERE col1 LIKE '%H/%' ESCAPE 'H';