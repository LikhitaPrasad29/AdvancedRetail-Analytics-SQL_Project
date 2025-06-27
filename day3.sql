------------------ADVANCED QUERIES--------------------

--1. Most active customers/Repeat customers
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID, c.CustomerName
HAVING 
    COUNT(o.OrderID) > 1
ORDER BY 
    TotalOrders DESC;


-- 2. Top 3 customers by total spend
SELECT 
    c.CustomerName,
    ROUND(SUM(o.quantity * p.price), 2) AS total_spent
FROM 
    Orders o
JOIN 
    Products p ON o.ProductID = p.ProductID
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerName
ORDER BY 
    total_spent DESC
LIMIT 3;



--3. Top-selling categories
SELECT 
    p.Category,
    SUM(o.Quantity) AS TotalQuantitySold
FROM 
    Orders o
JOIN 
    Products p ON o.ProductID = p.ProductID
GROUP BY 
    p.Category
ORDER BY 
    TotalQuantitySold DESC;


--4. Total Spend Per Customer
SELECT 
    c.CustomerID,
    c.CustomerName,
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
JOIN 
    Products p ON o.ProductID = p.ProductID
GROUP BY 
    c.CustomerID, c.CustomerName
ORDER BY 
    TotalSpent DESC;

