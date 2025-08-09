-- Check if database exists and create if not
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Online_Market_SQL')
BEGIN
    CREATE DATABASE Online_Market_SQL;
END
GO

USE Online_Market_SQL;
GO

-- Create Tables only if they don't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Customers')
BEGIN
    CREATE TABLE Customers (
        CustomerID INT NOT NULL PRIMARY KEY,
        Name VARCHAR(100) NOT NULL,
        Email VARCHAR(100) NOT NULL
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Products')
BEGIN
    CREATE TABLE Products (
        ProductID INT NOT NULL PRIMARY KEY,
        ProductName VARCHAR(100) NOT NULL,
        Price DECIMAL(10, 2) NOT NULL
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders')
BEGIN
    CREATE TABLE Orders (
        OrderID INT NOT NULL PRIMARY KEY,
        CustomerID INT NOT NULL,
        ProductID INT NOT NULL,
        OrderDate DATE NOT NULL,
        Quantity INT NOT NULL,
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    );
END
GO

-- Insert Data into Customers (only if empty)
IF NOT EXISTS (SELECT 1 FROM Customers)
BEGIN
    INSERT INTO Customers (CustomerID, Name, Email) 
    VALUES
    (1, 'John Doe', 'john@example.com'),
    (2, 'Mary Smith', 'mary@example.com');
END
GO

-- Insert Data into Products (only if empty)
IF NOT EXISTS (SELECT 1 FROM Products)
BEGIN
    INSERT INTO Products (ProductID, ProductName, Price) 
    VALUES
    (1, 'Laptop', 12000.00),
    (2, 'Mouse', 150.00),
    (3, 'Keyboard', 500.00);
END
GO

-- Insert Data into Orders (only if empty)
IF NOT EXISTS (SELECT 1 FROM Orders)
BEGIN
    INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity) 
    VALUES
    (1, 1, 1, '2025-08-01', 1),
    (2, 1, 2, '2025-08-02', 2),
    (3, 2, 3, '2025-08-03', 1);
END
GO

-- QUESTION 1 (Changed LIMIT to TOP for SQL Server)
SELECT TOP 1 p.ProductName, SUM(p.Price * o.Quantity) AS TotalRevenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;

-- QUESTION 2
SELECT p.ProductName, SUM(o.Quantity) AS TotalQuantity
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING SUM(o.Quantity) > 1;

-- QUESTION 3
SELECT c.Name, COUNT(o.OrderID) AS OrderCount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(o.OrderID) > 1;

-- QUESTION 4
SELECT MIN(OrderDate) AS EarliestOrderDate
FROM Orders;

-- QUESTION 5
SELECT COUNT(DISTINCT CustomerID) AS DistinctCustomers
FROM Orders;