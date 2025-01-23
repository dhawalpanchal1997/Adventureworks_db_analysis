--Retrieve all sales records from the Adventure Works Sales table.
SELECT *
FROM Sales.SalesOrderHeader;

--Find the earliest date of sale recorded in the Adventure Works Sales table.
SELECT MIN(OrderDate) AS EarliestSaleDate
FROM Sales.SalesOrderHeader;

--Find the latest date of sale recorded in the Adventure Works Sales table.
SELECT MAX(OrderDate) AS LatestSaleDate
FROM Sales.SalesOrderHeader;

--Retrieve sales records for a specific date, such as January 1, 2011.
SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate = '2011-01-01';

--Count the number of sales records that occurred in the year 2012.
SELECT COUNT(*) AS SalesCount
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012;

--Calculate the total sales amount for the month of March 2012.
SELECT SUM(TotalDue) AS TotalSalesAmount
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012 AND MONTH(OrderDate) = 3;

--Retrieve sales records for the last 7 days (assume present day as '2012-12-05'.
SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN DATEADD(day, -7, '2012-12-05') AND '2012-12-05';

--Calculate the average sales amount per day for the month of February 2012.
SELECT SUM(TotalDue) / COUNT(DISTINCT OrderDate) AS AverageSalesPerDay
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012 AND MONTH(OrderDate) = 2;

--Find the sales record with the highest sales amount in the Adventure Works Sales table.
SELECT TOP 1 *
FROM Sales.SalesOrderHeader
ORDER BY TotalDue DESC;

--Retrieve sales records for the current year(assume current year as 2012).
SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2012-01-01' 
  AND OrderDate < '2013-01-01';  -- To include all of 2012

--Calculate the total sales amount for each quarter of the year 2013.
SELECT 
    DATEPART(QUARTER, OrderDate) AS Quarter,
    SUM(TotalDue) AS TotalSalesAmount
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013
GROUP BY 
    DATEPART(QUARTER, OrderDate)
ORDER BY Quarter;

--Count the number of sales records that occurred on weekends (Saturday and Sunday).
SELECT COUNT(*) AS WeekendSalesCount
FROM Sales.SalesOrderHeader
WHERE DATEPART(WEEKDAY, OrderDate) IN (1, 7);  -- Adjust numbers based on your SQL dialect

--Retrieve sales records for a specific date range, such as January 1, 2011, to March 31, 2012.
SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-01-01' AND '2012-03-31';

--Calculate the average sales amount per month for the year 2012.
SELECT AVG(MonthlyTotal) AS AverageSalesPerMonth
FROM (
    SELECT MONTH(OrderDate) AS SaleMonth, 
           SUM(TotalDue) AS MonthlyTotal
    FROM Sales.SalesOrderHeader
    WHERE YEAR(OrderDate) = 2012
    GROUP BY MONTH(OrderDate)
) AS MonthlySales;

--Find the sales record with the lowest sales amount in the Adventure Works Sales table.
SELECT TOP 1 *
FROM Sales.SalesOrderHeader
ORDER BY TotalDue ASC;

--Retrieve sales records for the current month(assume current date as 2012-02-02).
SELECT *
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012 AND MONTH(OrderDate) = 2;

--Count the number of sales records that occurred on weekdays (Monday to Friday).
SELECT COUNT(*) AS WeekdaySalesCount
FROM Sales.SalesOrderHeader
WHERE DATENAME(WEEKDAY, OrderDate) NOT IN ('Saturday', 'Sunday');

--Calculate the total sales amount for each day of the week in the year 2012.
SELECT DATENAME(WEEKDAY, OrderDate) AS DayOfWeek,
       SUM(TotalDue) AS TotalSalesAmount
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012
GROUP BY DATENAME(WEEKDAY, OrderDate)
ORDER BY CASE 
           WHEN DATENAME(WEEKDAY, OrderDate) = 'Sunday' THEN 1
           WHEN DATENAME(WEEKDAY, OrderDate) = 'Monday' THEN 2
           WHEN DATENAME(WEEKDAY, OrderDate) = 'Tuesday' THEN 3
           WHEN DATENAME(WEEKDAY, OrderDate) = 'Wednesday' THEN 4
           WHEN DATENAME(WEEKDAY, OrderDate) = 'Thursday' THEN 5
           WHEN DATENAME(WEEKDAY, OrderDate) = 'Friday' THEN 6
           WHEN DATENAME(WEEKDAY, OrderDate) = 'Saturday' THEN 7
         END;


--Retrieve sales records for the previous year(current year=2012).
SELECT *
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011;

--Calculate the average sales amount per quarter for the year 2012.
SELECT DATEPART(QUARTER, OrderDate) AS Quarter,
       SUM(TotalDue) AS TotalSales,
       AVG(TotalDue) AS AverageSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012
GROUP BY DATEPART(QUARTER, OrderDate);

--Calculate the average sales amount per month for the last 12 months(current date as '2012-05-05').
SELECT FORMAT(OrderDate, 'yyyy-MM') AS Month,
       SUM(TotalDue) AS TotalSales,
       AVG(TotalDue) AS AverageSales
FROM Sales.SalesOrderHeader
WHERE OrderDate >= DATEADD(MONTH, -12, '2012-05-05') AND OrderDate < '2012-05-05'
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY Month;

--Retrieve the top 5 sales records with the highest sales amount in the Adventure Works Sales table.
SELECT TOP 5 *
FROM Sales.SalesOrderHeader
ORDER BY TotalDue DESC;

--Count the number of unique customers who made a purchase in the last 30 days(current date as '2012-05-05').
SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomerCount
FROM Sales.SalesOrderHeader
WHERE OrderDate >= DATEADD(DAY, -30, '2012-05-05') AND OrderDate < '2012-05-05';

--Calculate the total sales amount for each week of the current year(current date as '2012-05-05').
SELECT DATEPART(WEEK, OrderDate) AS WeekNumber,
       SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012
GROUP BY DATEPART(WEEK, OrderDate)
ORDER BY WeekNumber;

--Retrieve sales records for the current quarter and the previous year(current date as '2012-05-05').
SELECT *
FROM Sales.SalesOrderHeader
WHERE (YEAR(OrderDate) = 2012 AND DATEPART(QUARTER, OrderDate) = 2)
   OR (YEAR(OrderDate) = 2011);

--Find the date range with the highest average sales amount per day in the Adventure Works Sales table.
WITH MonthlySales AS (
    SELECT 
        YEAR(OrderDate) AS SalesYear,
        MONTH(OrderDate) AS SalesMonth,
        COUNT(DISTINCT OrderDate) AS DaysInMonth,
        SUM(TotalDue) AS TotalSales
    FROM Sales.SalesOrderHeader
    GROUP BY YEAR(OrderDate), MONTH(OrderDate)
)
SELECT TOP 1
    SalesYear,
    SalesMonth,
    TotalSales,
    TotalSales / DaysInMonth AS AvgSalesPerDay
FROM MonthlySales
ORDER BY AvgSalesPerDay DESC;

--Calculate the total sales amount for each month in the last 2 years, excluding the current year (current date as '2012-05-05')
SELECT 
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonth,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) >= YEAR(DATEADD(YEAR, -2, '2012-05-05') )
  AND YEAR(OrderDate) < YEAR('2012-05-05') -- Exclude the current year (2012)
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY SalesYear, SalesMonth;

--Retrieve sales records for the current month and the same month last year(current date as '2012-05-05').
SELECT *
FROM Sales.SalesOrderHeader
WHERE 
    (YEAR(OrderDate) = 2012 AND MONTH(OrderDate) = 5)
    OR (YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5);

--Calculate the average sales amount per weekday for the last 3 months(current date as '2012-05-05').
WITH SalesData AS (
    SELECT 
        OrderDate,
        TotalDue,
        DATENAME(WEEKDAY, OrderDate) AS WeekdayName
    FROM Sales.SalesOrderHeader
    WHERE OrderDate >= DATEADD(MONTH, -3, '2012-05-05') 
      AND OrderDate < '2012-05-06'  -- To include all of May 5, 2012
)
SELECT 
    WeekdayName,
    AVG(TotalDue) AS AvgSalesAmount
FROM SalesData
GROUP BY WeekdayName
ORDER BY 
    CASE WeekdayName
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;

--Retrieve sales records for the last 6 months, excluding weekends(current date as '2012-05-05').
SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate >= DATEADD(MONTH, -6, '2012-05-05') 
  AND OrderDate < '2012-05-06'  -- To include all of May 5, 2012
  AND DATENAME(WEEKDAY, OrderDate) NOT IN ('Saturday', 'Sunday');

--Count the number of sales records that occurred on the last day of each month in the Adventure Works Sales table.
WITH LastDays AS (
    SELECT 
        EOMONTH(OrderDate) AS LastDay
    FROM Sales.SalesOrderHeader
    GROUP BY EOMONTH(OrderDate)
)
SELECT 
    LD.LastDay,
    COUNT(SOH.SalesOrderID) AS SalesCount
FROM LastDays LD
LEFT JOIN Sales.SalesOrderHeader SOH
    ON LD.LastDay = CAST(SOH.OrderDate AS DATE)
GROUP BY LD.LastDay
ORDER BY LD.LastDay;

--Calculate the average sales amount per day of the week for the last 52 weeks(current date as '2012-05-05').
WITH SalesData AS (
    SELECT 
        OrderDate,
        TotalDue,
        DATENAME(WEEKDAY, OrderDate) AS WeekdayName
    FROM Sales.SalesOrderHeader
    WHERE OrderDate >= DATEADD(WEEK, -52, '2012-05-05') 
      AND OrderDate < '2012-05-06'  -- To include all of May 5, 2012
)
SELECT 
    WeekdayName,
    AVG(TotalDue) AS AvgSalesAmount
FROM SalesData
GROUP BY WeekdayName
ORDER BY 
    CASE WeekdayName
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;

--Retrieve the sales records for the previous quarter and the same quarter two years ago(current date as '2014-05-05')
SELECT *
FROM Sales.SalesOrderHeader
WHERE 
    (OrderDate >= '2014-01-01' AND OrderDate <= '2014-03-31')  -- Previous quarter (Q1 2014)
    OR (OrderDate >= '2012-01-01' AND OrderDate <= '2012-03-31');  -- Same quarter two years ago (Q1 2012)
