--Find the total amount of ALL sales in the Sales Order Header table

SELECT SUM(TotalDue) as TotalSalesAmount
FROM Sales.SalesOrderHeader



--List the ID’s of customers by order of how many individual sales they’ve made 

SELECT CustomerID, COUNT(SalesOrderID) AS NumberOfSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY NumberOfSales DESC;


--List the ID’s of customers by order of the total amount they’ve spent

SELECT CustomerID, SUM(TotalDue) AS TotalAmountSpent
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY TotalAmountSpent DESC;


--List each Sales ID with Order date, Due date, and ship date with each of the three being in a different format from the other

SELECT 
    SalesOrderID,
    FORMAT(OrderDate, 'yyyy.MM.dd') AS OrderDate_Format1,       -- yyyy.mm.dd
    FORMAT(DueDate, 'dd-MM-yyyy') AS DueDate_Format2,           -- dd-mm-yyyy
    FORMAT(ShipDate, 'MMMM dd, yyyy') AS ShipDate_Format3       -- Month dd, yyyy
FROM 
    Sales.SalesOrderHeader;

--List two columns, one showing how many sales used a credit card and the other showing how many sales happened without

SELECT 
    COUNT(CASE WHEN CreditCardID IS NOT NULL THEN 1 END) AS SalesWithCreditCard,
    COUNT(CASE WHEN CreditCardID IS NULL THEN 1 END) AS SalesWithoutCreditCard
FROM 
    Sales.SalesOrderHeader;


--Display only the top 5 most expensive single orders with the Customer ID, SalesID, and the total amount of the sale

SELECT TOP 5 
    CustomerID, 
    SalesOrderID, 
    TotalDue AS TotalAmount
FROM 
    Sales.SalesOrderHeader
ORDER BY 
    TotalDue DESC;
