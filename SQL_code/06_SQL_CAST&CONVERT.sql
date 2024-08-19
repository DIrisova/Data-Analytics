/*
Title: Exploring CAST, TRY_CAST, CONVERT, and TRY_CONVERT Functions in SQL Server
These functions are used to change the data type of a value or expression and handle conversion errors gracefully. 
This assignment will help you understand and apply these functions effectively.

Requirements:
    • Use the sample database schema provided below for all tasks.
    • Write SQL queries to fulfil each task and provide the expected output/result.
    • Include comments in your SQL queries to explain your approach and any relevant information.
    • You can use SQL Server Management Studio (SSMS) or any SQL client of your choice to run your queries.
*/

/* Sample Database Schema:
Assume we have a simple database schema with a table called Orders. */

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate VARCHAR(50),
    OrderAmount VARCHAR(50)
);

-- Insert Sample Data into Orders Table
INSERT INTO Orders (OrderID, CustomerName, OrderDate, OrderAmount) VALUES (1, 'John Doe', '2023-09-01', '100.00');
INSERT INTO Orders (OrderID, CustomerName, OrderDate, OrderAmount) VALUES (2, 'Jane Smith', '2023-09-02', '50.25');
INSERT INTO Orders (OrderID, CustomerName, OrderDate, OrderAmount) VALUES (3, 'Alice Johnson', '2023-09-03', '75.50');

/* Tasks:

Task 1: CAST Function 
Write SQL queries to perform the following tasks:

1a. Create a query to calculate the total order amount for each order. 
      In the result, cast the total order amount to the DECIMAL(10, 2) data type. 
      Name the resulting column as "TotalOrderAmount". */
SELECT OrderID, 
       CAST(OrderAmount AS DECIMAL(10, 2)) AS TotalOrderAmount
FROM Orders;

/* 1b. Cast the OrderDate column as a DATE and retrieve the OrderID, CustomerName, and OrderAmount. */
SELECT OrderID, 
       CustomerName, 
       CAST(OrderDate AS DATE) AS OrderDate, 
       OrderAmount
FROM Orders;

/* Task 2: TRY_CAST Function 
Write SQL queries to perform the following tasks:

2a. Create a query to select the OrderID, CustomerName, OrderDate, and OrderAmount columns 
       from the "Orders" table, but only include rows where the OrderAmount can be cast to a numeric value using TRY_CAST. 
       Exclude rows where the OrderAmount cannot be cast to a numeric value. */
SELECT OrderID, 
       CustomerName, 
       OrderDate, 
       OrderAmount
FROM Orders
WHERE TRY_CAST(OrderAmount AS DECIMAL(10, 2)) IS NOT NULL;

/* 2b. Create a query to calculate the average order amount for each order, 
       but this time use TRY_CAST to handle invalid order amounts. 
       In the result, cast the average order amount to the DECIMAL(10, 2) data type. 
       Name the resulting column as "AverageOrderAmount". */
SELECT OrderID, 
       CAST(AVG(TRY_CAST(OrderAmount AS DECIMAL(10, 2))) AS DECIMAL(10, 2)) AS AverageOrderAmount
FROM Orders
GROUP BY OrderID;

/* Task 3: CONVERT & TRY_CONVERT Function 
Write SQL queries to perform the above activities using CONVERT & TRY_CONVERT as well. */

/* 3a. Create a query to calculate the total order amount for each order using CONVERT. 
       Name the resulting column as "TotalOrderAmount". */
SELECT OrderID, 
       CONVERT(DECIMAL(10, 2), OrderAmount) AS TotalOrderAmount
FROM Orders;

/* 3b. Cast the OrderDate column as a DATE using CONVERT and retrieve the OrderID, CustomerName, and OrderAmount. */
SELECT OrderID, 
       CustomerName, 
       CONVERT(DATE, OrderDate) AS OrderDate, 
       OrderAmount
FROM Orders;

/* 3c. Create a query to select the OrderID, CustomerName, OrderDate, and OrderAmount columns 
       from the "Orders" table using TRY_CONVERT, but only include rows where the OrderAmount can be cast to a numeric value. 
       Exclude rows where the OrderAmount cannot be cast to a numeric value. */
SELECT OrderID, 
       CustomerName, 
       OrderDate, 
       OrderAmount
FROM Orders
WHERE TRY_CONVERT(DECIMAL(10, 2), OrderAmount) IS NOT NULL;

/* 3d. Create a query to calculate the average order amount for each order using TRY_CONVERT. 
       In the result, cast the average order amount to the DECIMAL(10, 2) data type. 
       Name the resulting column as "AverageOrderAmount". */
SELECT OrderID, 
       CONVERT(DECIMAL(10, 2), AVG(TRY_CONVERT(DECIMAL(10, 2), OrderAmount))) AS AverageOrderAmount
FROM Orders
GROUP BY OrderID;

/* 3e. Write a few more queries for Task 1(b) with different date formats using CONVERT. */

/* Format: mm/dd/yyyy */
SELECT OrderID, 
       CustomerName, 
       CONVERT(VARCHAR, CONVERT(DATE, OrderDate), 101) AS OrderDate, 
       OrderAmount
FROM Orders;

/* Format: yyyy.mm.dd */
SELECT OrderID, 
       CustomerName, 
       CONVERT(VARCHAR, CONVERT(DATE, OrderDate), 102) AS OrderDate, 
       OrderAmount
FROM Orders;

/* Format: dd/mm/yyyy */
SELECT OrderID, 
       CustomerName, 
       CONVERT(VARCHAR, CONVERT(DATE, OrderDate), 103) AS OrderDate, 
       OrderAmount
FROM Orders;

/* Format: dd mon yyyy */
SELECT OrderID, 
       CustomerName, 
       CONVERT(VARCHAR, CONVERT(DATE, OrderDate), 106) AS OrderDate, 
       OrderAmount
FROM Orders;

/* Format: yyyy/mm/dd */
SELECT OrderID, 
       CustomerName, 
       CONVERT(VARCHAR, CONVERT(DATE, OrderDate), 111) AS OrderDate, 
       OrderAmount
FROM Orders;