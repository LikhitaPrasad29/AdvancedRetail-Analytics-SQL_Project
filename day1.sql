-- Create Customers table
create table Customers (
  CustomerID INT PRIMARY key ,
  CustomerName VARCHAR(100),
  City VARCHAR(50),
  State VARCHAR(50)
);

-- Create Products table
---------------------------CREATION---------------------

CREATE table Products (
  ProductID INT PRIMARY KEY ,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Price DECIMAl(10,2)
);

-- Create Orders table
create table Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductID INT,
  OrderDate DATE,
  Quantity INT,
  FOREIGN KEy (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEy (ProductID) REFERENCES Products(ProductID)

);

-----------------------------INSERTION------------------------

-- Insert into Customers
INSERT INTO Customers (CustomerID, CustomerName, City, State) VALUES
(1, 'Asha Rao', 'Bengaluru', 'Karnataka'),
(2, 'Rahul Mehta', 'Mumbai', 'Maharashtra'),
(3, 'Sneha Patel', 'Ahmedabad', 'Gujarat');

-- Insert into Products
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(101, 'Wireless Mouse', 'Electronics', 499.00),
(102, 'Bluetooth Headphones', 'Electronics', 1299.50),
(103, 'Notebook', 'Stationery', 55.75),
(104, 'Pen Set', 'Stationery', 120.00);

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity) VALUES
(201, 1, 101, '2025-06-01', 2),
(202, 1, 103, '2025-06-02', 5),
(203, 2, 102, '2025-06-03', 1),
(204, 3, 104, '2025-06-03', 3),
(205, 2, 101, '2025-06-04', 1);

SELECT * FROM Orders;
















