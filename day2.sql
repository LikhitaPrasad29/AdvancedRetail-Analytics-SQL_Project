--------------------INTERMEDIATE QUERIES-----------------

-- 1. Top 5 best-selling products by quantity
SELECT 
    p.productName,
    SUM(o.quantity) AS total_quantity_sold
FROM 
    Orders o
JOIN 
    Products p ON o.ProductID = p.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    total_quantity_sold DESC
LIMIT 5;



-- 2. Monthly revenue trend
SELECT 
    DATE(orderDate, '%Y-%m') AS month,
    ROUND(SUM(o.quantity * p.price), 2) AS total_revenue
FROM 
    Orders o
JOIN 
    Products p ON o.ProductID = p.ProductID
GROUP BY 
    month
ORDER BY 
    month;


--3. First and Last order date per customer
SELECT 
    c.CustomerID,
    c.CustomerName,
    MIN(o.OrderDate) AS FirstOrderDate,
    MAX(o.OrderDate) AS LastOrderDate
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID, c.CustomerName
ORDER BY 
    FirstOrderDate;   


--4. Average order value per customers
SELECT 
    c.CustomerID,
    c.CustomerName,
    ROUND(SUM(o.Quantity * p.Price) * 1.0 / COUNT(o.OrderID), 2) AS AvgOrderValue
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
JOIN 
    Products p ON o.ProductID = p.ProductID
GROUP BY 
    c.CustomerID, c.CustomerName
ORDER BY 
    AvgOrderValue DESC;