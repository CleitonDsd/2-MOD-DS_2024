-- 1. WHERE
SELECT *
FROM Person.Person
WHERE LastName = 'Smith';

-- 2. ORDER BY
SELECT FirstName, LastName
FROM Person.Person
ORDER BY LastName ASC, FirstName DESC;

-- 3. GROUP BY
SELECT StateProvinceID, COUNT(*) AS TotalCustomers
FROM Sales.Customer
GROUP BY StateProvinceID;

-- 4. HAVING
SELECT StateProvinceID, COUNT(*) AS TotalCustomers
FROM Sales.Customer
GROUP BY StateProvinceID
HAVING COUNT(*) > 10;  -- Apenas estados com mais de 10 clientes

-- 5. INNER JOIN
SELECT p.FirstName, p.LastName, a.City
FROM Person.Person p
INNER JOIN Person.BusinessEntityAddress a ON p.BusinessEntityID = a.BusinessEntityID
WHERE a.AddressTypeID = 1;  -- Filtra por tipo de endereço

-- 6. LEFT JOIN
SELECT p.FirstName, p.LastName, o.OrderDate
FROM Person.Person p
LEFT JOIN Sales.SalesOrderHeader o ON p.BusinessEntityID = o.CustomerID;

-- 7. Funções Agregadas

-- COUNT
SELECT COUNT(*) AS TotalOrders
FROM Sales.SalesOrderHeader;

-- SUM
SELECT SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader;

-- AVG
SELECT AVG(TotalDue) AS AverageOrderValue
FROM Sales.SalesOrderHeader;

-- MIN e MAX
SELECT MIN(TotalDue) AS LowestOrderValue, MAX(TotalDue) AS HighestOrderValue
FROM Sales.SalesOrderHeader;

-- 8. Exemplo Completo Usando Várias Cláusulas
SELECT c.StateProvinceID, COUNT(o.SalesOrderID) AS TotalOrders, AVG(o.TotalDue) AS AverageOrderValue
FROM Sales.Customer c
INNER JOIN Sales.SalesOrderHeader o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >
