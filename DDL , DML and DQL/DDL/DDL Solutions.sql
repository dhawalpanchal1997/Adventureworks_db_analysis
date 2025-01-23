-- 1.	Create Dept table with 3 columns
CREATE TABLE Dept (
    DeptNo INT NOT NULL,
    DName VARCHAR(30),
    Location VARCHAR(30) CHECK (Location IN ('CA', 'PA', 'TX', 'GA', 'NY'))
);

--2. After table creation, add unique constraint on DNAME column and primary key on DeptNo column (ALTER TABLE)
ALTER TABLE Dept
ADD CONSTRAINT unique_dname UNIQUE (DName);

ALTER TABLE Dept
ADD CONSTRAINT pk_deptno PRIMARY KEY (DeptNo);

--3. Create this Employee table with following constraints. Do not insert record yet.
CREATE TABLE Employee (
    EID INT PRIMARY KEY,
    ENAME VARCHAR(50) NOT NULL,
    GENDER CHAR(1) CHECK (GENDER IN ('M', 'F')),
    DEPTNO INT,
    MID INT
);

--4. After Table is created, Add one column called SALARY. The range of Salary must between 30000 and 80000. Put constraint for this.
ALTER TABLE Employee
ADD SALARY DECIMAL(10, 2) CHECK (SALARY BETWEEN 30000 AND 80000);

--5. Add foreign key constraint on Deptno column . This will reference Dept Table.
ALTER TABLE Employee
ADD CONSTRAINT fk_deptno
FOREIGN KEY (DEPTNO) REFERENCES Dept(DeptNo);

--6. Now Insert records in DEPT table as per screenshot
INSERT INTO Dept (DeptNo, DName, Location)
VALUES 
    (10, 'SALES', 'CA'),
    (20, 'IT', 'GA'),
    (30, 'FINANCE', 'PA'),
    (40, 'MARKETING', 'TX');

--7. Insert record in Employee table as per screenshot
INSERT INTO Employee (EID, ENAME, GENDER, DEPTNO, MID, SALARY)
VALUES 
    (1, 'LINDA', 'F', 10, NULL, 75000),
    (2, 'MARY', 'F', 10, 1, 45000),
    (3, 'ANJELA', 'F', 10, 2, 32000),
    (4, 'JASON', 'M', 20, 1, 50000),
    (5, 'AHMED', 'M', 20, 4, 30000),
    (6, 'MARIA', 'F', 20, 4, 40000),
    (7, 'JOHN', 'M', 30, 1, 60000),
    (8, 'JACK', 'M', 30, 7, 55000),
    (9, 'JUNE', 'F', 30, 7, 40000),
    (10, 'OLA', 'M', 30, 8, 35000),
	(11, 'ALEX', 'M', 10, NULL, 55000),    -- Extra record add to get query results
	(12, 'LIZI', 'F', 10, NULL, 50000);	   -- Extra record add to get query results


--8 create table Sales(SID int primary key,sales money,sdate date,EID int)
CREATE TABLE Sales(
    SID INT PRIMARY KEY,
    sales MONEY,
    sdate DATE,
    EID INT
);

--9. After table is created, add foreign key on EID. This EID should reference Employee table primary key
ALTER TABLE Sales
ADD CONSTRAINT fk_employee
FOREIGN KEY (EID) REFERENCES Employee(EID);

--10. Insert the records:
INSERT INTO Sales (SID, sales, sdate, EID)
VALUES 
    (101, 4000, '2005-10-10', 1),
    (102, 2300, '2006-01-12', 1),
    (103, 9000, '2005-06-20', 2),
    (104, 4500, '2007-02-10', 2),
    (105, 3200, '2007-02-27', 3),
    (106, 2100, '2008-05-25', 3),
    (107, 6200, '2008-04-14', 4),
    (108, 1900, '2009-10-24', 4),
    (109, 9100, '2009-03-20', 5),
    (110, 7600, '2010-12-12', 5),
    (111, 8300, '2010-09-15', 6),
    (112, 4800, '2010-06-23', 6),
    (113, 3900, '2010-08-10', 7),
    (114, 8100, '2010-11-14', 7),
    (115, 4900, '2011-10-19', 8),
    (116, 5000, '2011-04-20', 8),
    (117, 8400, '2011-05-24', 8),
    (118, 2700, '2011-10-12', 9),
    (119, 7100, '2012-08-20', 9),
    (120, 4100, '2012-03-15', 9),
    (121, 2100, '2012-03-15', 10),
    (122, 9300, '2012-09-15', 10);

--11. Display the name of the employees who did sales between year 2008 and 2012
SELECT E.ENAME
FROM Employee E
JOIN Sales S ON E.EID = S.EID
WHERE S.sdate BETWEEN '2008-01-01' AND '2012-12-31';

--12. Display the name of employees who are not doing any sales
SELECT E.ENAME
FROM Employee E
LEFT JOIN Sales S ON E.EID = S.EID
WHERE S.SID IS NULL;

--13. Display sales information (SID,Sales, Ename) for employees who works in department 10 or 20
SELECT S.SID, S.sales, E.ENAME
FROM Sales S
JOIN Employee E ON S.EID = E.EID
WHERE E.DEPTNO IN (10, 20);

--14. Display Ename, Sales and Sdate according to desc order of year
SELECT E.ENAME, S.sales, S.sdate
FROM Sales S
JOIN Employee E ON S.EID = E.EID
ORDER BY YEAR(S.sdate) DESC;


--15. Display the name of the employees who are getting more salary than Ethan and Steven
SELECT ENAME
FROM Employee
WHERE SALARY > (
    SELECT MAX(SALARY)
    FROM Employee
    WHERE ENAME IN ('JUNE', 'OLA')   -- Filtered the name with those present in table to get output
);

--16. Display the DNAME and total salary of that department, but include only those employees who gets salary more than 40000.
SELECT D.DName, SUM(E.Salary) AS TotalSalary
FROM Dept D
JOIN Employee E ON D.DeptNo = E.DeptNo
WHERE E.Salary > 40000
GROUP BY D.DName;

--17. Modify the previous query and show the name of those departments and total salary who have at least 4 employees.
SELECT D.DName, SUM(E.Salary) AS TotalSalary
FROM Dept D
JOIN Employee E ON D.DeptNo = E.DeptNo
WHERE E.Salary > 40000
GROUP BY D.DName
HAVING COUNT(E.EID) >= 4;

--18. Display the name and manager name of all the employees including the name of Top level employee
SELECT E1.ENAME AS EmployeeName, E2.ENAME AS ManagerName
FROM Employee E1
LEFT JOIN Employee E2 ON E1.MID = E2.EID;

--19. Display the Ename and average, total and max sales done by them
SELECT E.ENAME,AVG(S.sales) AS AverageSales,SUM(S.sales) AS TotalSales,MAX(S.sales) AS MaxSales
FROM Employee E
JOIN Sales S ON E.EID = S.EID
GROUP BY E.ENAME;

--20. Display the sales information from sales only for dept IT and Finance
SELECT S.SID, S.sales, S.sdate, E.ENAME, D.DName
FROM Sales S
JOIN Employee E ON S.EID = E.EID
JOIN Dept D ON E.DEPTNO = D.DeptNo
WHERE D.DName IN ('IT', 'FINANCE');

--21. Display dname,ename,salary for top 2 employees salary wise  only for IT department. Use ranking function
WITH RankedEmployees AS (
    SELECT D.DName,E.ENAME,E.Salary,
        RANK() OVER (PARTITION BY D.DName ORDER BY E.Salary DESC) AS SalaryRank
    FROM Employee E
    JOIN Dept D ON E.DEPTNO = D.DeptNo
    WHERE D.DName = 'IT'
)

SELECT DName,ENAME,Salary
FROM RankedEmployees
WHERE SalaryRank <= 2;

--22. Display top 2 salaried employees from every department. Show Dname, Ename and Salary
WITH RankedEmployees AS (
    SELECT D.DName,E.ENAME,E.Salary,
        RANK() OVER (PARTITION BY D.DName ORDER BY E.Salary DESC) AS SalaryRank
    FROM Employee E
    JOIN Dept D ON E.DEPTNO = D.DeptNo
)

SELECT DName,ENAME,Salary
FROM RankedEmployees
WHERE SalaryRank <= 2;

--23. Display the department name and total sales done by those department.
SELECT D.DName,SUM(S.sales) AS TotalSales
FROM Dept D
JOIN Employee E ON D.DeptNo = E.DeptNo
JOIN Sales S ON E.EID = S.EID
GROUP BY D.DName;

--24. Display the name and sales for those employees who do sales in October
SELECT E.ENAME,S.sales
FROM Sales S
JOIN Employee E ON S.EID = E.EID
WHERE MONTH(S.sdate) = 10;

--25. Display the name of those employees who reports to Miranda.
SELECT E.ENAME
FROM Employee E
WHERE E.MID = (SELECT EID FROM Employee WHERE ENAME = 'LINDA'); -- Filtered with the value value present in table to get query result

--26. Display the even number records from employee table
SELECT *
FROM Employee
WHERE EID % 2 = 0;

--27. Display the odd number records from employee table
SELECT *
FROM Employee
WHERE EID % 2 <> 0;


--28. Make the copy of all three tables only with structure. Record should not copy into new tables 
--Give similar kind of name to new structures
SELECT * 
INTO Dept_Copy
FROM Dept
WHERE 1 = 0;  

SELECT *
INTO Employee_Copy
FROM Employee
WHERE 1 = 0;  

SELECT * 
INTO Sales_Copy
FROM Sales 
WHERE 1 = 0;  

--29. Now transfer the records from older structure into new structure. 
INSERT INTO Employee_Copy (EID, ENAME, GENDER, DEPTNO, MID, SALARY)
SELECT EID, ENAME, GENDER, DEPTNO, MID, SALARY
FROM Employee;

INSERT INTO Dept_Copy (DeptNo, DName, Location)
SELECT DeptNo, DName, Location
FROM Dept;


INSERT INTO Sales_Copy (SID, sales, sdate, EID)
SELECT SID, sales, sdate, EID
FROM Sales;

--30. Increase the sales by 20% for dept IT
UPDATE Sales_Copy
SET sales = sales * 1.2
WHERE EID IN (
    SELECT EID
    FROM Employee_Copy
    WHERE DEPTNO = (
        SELECT DeptNo
        FROM Dept_Copy
        WHERE DName = 'IT'
    )
);

--31. Increse salary by 30% for Finance and Sales dept employees
UPDATE Employee_Copy
SET SALARY = SALARY * 1.3
WHERE DEPTNO IN (
    SELECT DeptNo
    FROM Dept_Copy
    WHERE DName IN ('FINANCE', 'SALES')
);

--32. Increase salary by 1000 for employees who report to Miranda
UPDATE Employee_Copy
SET SALARY = SALARY + 1000
WHERE MID = (
    SELECT EID
    FROM Employee_Copy
    WHERE ENAME = 'LINDA'
);

--33. Add ten days in sdate for employee Nancy, OLA and Sylvia.Change should be permanent
UPDATE Sales_Copy
SET sdate = DATEADD(DAY, 10, sdate)
WHERE EID IN (
    SELECT EID
    FROM Employee_Copy
    WHERE ENAME IN ('MARY','OLA', 'JOHN')
);

--34. Increase sales by 2000 for employees who belongs to department 10 or 20
UPDATE Sales_Copy
SET sales = sales + 2000
WHERE EID IN (
    SELECT EID
    FROM Employee_Copy
    WHERE DEPTNO IN (10, 20)
);

--35. Drop all the sales records for Finance department
DELETE FROM Sales_Copy
WHERE EID IN (
    SELECT EID
    FROM Employee_Copy
    WHERE DEPTNO = (
        SELECT DeptNo
        FROM Dept_Copy
        WHERE DName = 'FINANCE'
    )
);

--create table candidate(sname varchar(20))
CREATE TABLE candidate (
    sname VARCHAR(20)
);

--insert into candidate values('Nitin,Gupta'),('Abhinav,Atrey'),('Vivek,Singh')
INSERT INTO candidate (sname) VALUES 
('Nitin,Gupta'), 
('Abhinav,Atrey'), 
('Vivek,Singh');

--1. select the candidates name and display - instead of comma between firstName and Lastname (Use Stuff function)
SELECT STUFF(sname, CHARINDEX(',', sname), 1, '-') AS CandidateName
FROM candidate;

--2.Display lastname in reverse order
SELECT REVERSE(SUBSTRING(sname, CHARINDEX(',', sname) + 1, LEN(sname))) AS LastName
FROM candidate;

--3.Display firstname and lastname as separate column from table
SELECT SUBSTRING(sname, 1, CHARINDEX(',', sname) - 1) AS FirstName,
	   SUBSTRING(sname, CHARINDEX(',', sname) + 1, LEN(sname)) AS LastName
FROM candidate;

--4.Display name of employees who did sales on Monday or Wednesday
SELECT  DISTINCT e.ename
FROM employee e
JOIN sales s ON e.eid = s.eid
WHERE DATENAME(weekday, s.sdate) IN ('Monday', 'Wednesday');

--5.Display name of employees who did sales before year 2008
SELECT DISTINCT e.ename
FROM  employee e
JOIN sales s ON e.eid = s.eid
WHERE s.sdate < '2008-01-01';

--6.Display name of employees who are doing sales for more than 10 years
SELECT DISTINCT e.ename
FROM employee e
JOIN sales s ON e.eid = s.eid
WHERE s.sdate < DATEADD(year, -10, GETDATE());


