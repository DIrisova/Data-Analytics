/* 
Title: Exploring Aggregate Functions in SQL Server
Aggregate functions allow you to perform calculations on sets of values within a database table. 
This assignment will help you understand and apply the following SQL Server aggregate functions:
    •   COUNT(): Counts the number of rows in a table or the number of non-null values in a column.
    •   SUM(): Calculates the sum of values in a column.
    •   AVG(): Calculates the average of values in a column.
    •   MIN(): Retrieves the minimum value from a column.
    •   MAX(): Retrieves the maximum value from a column.

Requirements:
    •   Use the sample database schema provided below for all tasks.
    •   Write SQL queries to fulfil each task and provide the expected output/result.
    •   Include comments in your SQL queries to explain your approach and any relevant information.
    •   You can use SQL Server Management Studio (SSMS) or any SQL client of your choice to run your queries.
*/

/* Sample Database Schema:
Assume we have a simple database schema with two tables: Orders and OrderDetails. */

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

-- Insert Sample Data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (1, 101, '2023-09-01');
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (2, 102, '2023-09-02');
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (3, 101, '2023-09-03');
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (4, 103, '2023-09-04');

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2)
);

-- Insert Sample Data into OrderDetails Table
INSERT INTO OrderDetails (OrderDetailID, OrderID, Product, Quantity, Price) VALUES (1, 1, 'Widget A', 5, 10.0);
INSERT INTO OrderDetails (OrderDetailID, OrderID, Product, Quantity, Price) VALUES (2, 1, 'Widget B', 3, 7.5);
INSERT INTO OrderDetails (OrderDetailID, OrderID, Product, Quantity, Price) VALUES (3, 2, 'Widget A', 2, 10.0);
INSERT INTO OrderDetails (OrderDetailID, OrderID, Product, Quantity, Price) VALUES (4, 2, 'Widget C', 1, 15.0);
INSERT INTO OrderDetails (OrderDetailID, OrderID, Product, Quantity, Price) VALUES (5, 3, 'Widget B', 4, 7.5);
INSERT INTO OrderDetails (OrderDetailID, OrderID, Product, Quantity, Price) VALUES (6, 3, 'Widget D', 2, 12.0);
INSERT INTO OrderDetails (OrderDetailID, OrderID, Product, Quantity, Price) VALUES (7, 4, 'Widget C', 3, 15.0);

/* Tasks: 

Task 1: COUNT() Function 
Write SQL queries to perform the following tasks: 

Count the total number of orders in the Orders table. */
SELECT COUNT(*) AS TotalOrders FROM Orders;

/* Count the number of order details in the OrderDetails table. */
SELECT COUNT(*) AS TotalOrderDetails FROM OrderDetails;

/* Count the number of unique products in the OrderDetails table. */
SELECT COUNT(DISTINCT Product) AS UniqueProducts FROM OrderDetails;

/* Task 2: SUM() and AVG() Functions 
Write SQL queries to perform the following tasks: */

/* Calculate the total quantity of all products ordered in the OrderDetails table. */
SELECT SUM(Quantity) AS TotalQuantity FROM OrderDetails;

/* Calculate the total price of all products ordered in the OrderDetails table. */
SELECT SUM(Quantity * Price) AS TotalPrice FROM OrderDetails;

/* Calculate the average price of a product in the OrderDetails table. */
SELECT AVG(Price) AS AveragePrice FROM OrderDetails;

/* Task 3: MIN() and MAX() Functions 
Write SQL queries to perform the following tasks: */

/* Find the minimum order date from the Orders table. */
SELECT MIN(OrderDate) AS MinimumOrderDate FROM Orders;

/* Find the maximum order date from the Orders table. */
SELECT MAX(OrderDate) AS MaximumOrderDate FROM Orders;

/* Find the highest quantity of a product ordered from the OrderDetails table. */
SELECT MAX(Quantity) AS HighestQuantity FROM OrderDetails;