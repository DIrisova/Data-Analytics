/*
Title: Subqueries and Correlated Subqueries in SQL
These techniques allow you to perform more complex queries and retrieve data based on related conditions.

Requirements:
    • Use the sample database schema provided below for all tasks.
    • Write SQL queries to fulfill each task and provide the expected output/result.
    • Include comments in your SQL queries to explain your approach and any relevant information.
    • You can use SQL Server Management Studio (SSMS) or any SQL client of your choice to run your queries.
Sample Database Schema for an Online Store 

Create Customers Table */
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

/* Insert Sample Data into Customers Table */
INSERT INTO Customers (customer_id, first_name, last_name, email) VALUES (1, 'John', 'Doe', 'john.doe@example.com');
INSERT INTO Customers (customer_id, first_name, last_name, email) VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com');
INSERT INTO Customers (customer_id, first_name, last_name, email) VALUES (3, 'Alice', 'Johnson', 'alice.johnson@example.com');
INSERT INTO Customers (customer_id, first_name, last_name, email) VALUES (4, 'Bob', 'Brown', 'bob.brown@example.com');

/* Create Orders Table */
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

/* Insert Sample Data into Orders Table */
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES (1, 1, '2023-01-01', 100.00);
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES (2, 2, '2023-01-02', 150.00);
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES (3, 3, '2023-01-03', 200.00);
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES (4, 1, '2023-01-04', 120.00);

/* Tasks: */

/* Subqueries */

/* Task 1: Write a SQL query to find the first and last names of customers from the "Customers" table who have placed orders in the "Orders" table. Use a subquery to achieve this. */
SELECT first_name, last_name
FROM Customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM Orders);

/* Task 2: Write a SQL query to find the first and last names of customers from the "Customers" table who have not placed orders in the "Orders" table. Use a subquery to achieve this. */
SELECT first_name, last_name
FROM Customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders);

/* Correlated Subqueries */

/* Task 3: Write a correlated subquery to show first_name, last_name, email, and total amount of orders placed by each customer. */
SELECT first_name, last_name, email, 
       (SELECT SUM(total_amount) 
        FROM Orders 
        WHERE Orders.customer_id = Customers.customer_id) AS total_order_amount
FROM Customers;

/* Task 4: Write a correlated subquery to find the customers who have placed orders with a total amount higher than the average total amount of orders placed by each customer. */
SELECT first_name, last_name, email
FROM Customers
WHERE (SELECT SUM(total_amount) 
       FROM Orders 
       WHERE Orders.customer_id = Customers.customer_id) > 
      (SELECT AVG(total_amount) 
       FROM Orders);
