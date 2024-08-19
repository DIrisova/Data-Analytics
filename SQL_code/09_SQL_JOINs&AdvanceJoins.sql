/*
Title: JOINS & Advanced JOINS in SQL
These techniques allow you to combine data from multiple tables based on related columns.

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

/* Create Products Table */
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

/* Insert Sample Data into Products Table */
INSERT INTO Products (product_id, product_name, unit_price) VALUES (1, 'Widget A', 10.00);
INSERT INTO Products (product_id, product_name, unit_price) VALUES (2, 'Widget B', 15.00);
INSERT INTO Products (product_id, product_name, unit_price) VALUES (3, 'Widget C', 20.00);
INSERT INTO Products (product_id, product_name, unit_price) VALUES (4, 'Widget D', 25.00);

/* Create Order_Items Table */
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

/* Insert Sample Data into Order_Items Table */
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity) VALUES (1, 1, 1, 2);
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity) VALUES (2, 1, 2, 1);
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity) VALUES (3, 2, 1, 1);
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity) VALUES (4, 3, 3, 2);
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity) VALUES (5, 4, 2, 3);

/* Tasks: */

/* INNER JOIN */

/* Task 1: Write a SQL query to retrieve the first and last names of customers along with the order IDs they have placed. */
SELECT c.first_name, c.last_name, o.order_id
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

/* Task 2: Write a SQL query to retrieve the product names and unit prices of products included in each order. */
SELECT p.product_name, p.unit_price, oi.order_id
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id;

/* Task 3: Write an SQL query to retrieve the first and last names of customers who have placed orders, along with the total amount of each order. Use an INNER JOIN to combine data from the "Customers" and "Orders" tables. */
SELECT c.first_name, c.last_name, o.total_amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

/* LEFT JOIN */

/* Task 4: Write an SQL query to retrieve the first and last names of all customers, along with the total amount of any orders they have placed (if applicable). Use a LEFT JOIN to ensure all customers are included, even if they haven't placed orders. */
SELECT c.first_name, c.last_name, o.total_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

/* RIGHT JOIN */

/* Task 5: Write a SQL query to retrieve the product names and unit prices of all products, including those that have been ordered. Use RIGHT JOIN. */
SELECT p.product_name, p.unit_price, oi.order_id
FROM Products p
RIGHT JOIN Order_Items oi ON p.product_id = oi.product_id;

/* FULL JOIN */

/* Task 6: Write a SQL query to retrieve the first and last names of customers along with the product names they have ordered. Include all customers and products, even if there are no matches. Use FULL JOIN */
SELECT c.first_name, c.last_name, p.product_name
FROM Customers c
FULL JOIN Orders o ON c.customer_id = o.customer_id
FULL JOIN Order_Items oi ON o.order_id = oi.order_id
FULL JOIN Products p ON oi.product_id = p.product_id;

/* Advanced JOINS (Multiple Tables) */

/* Task 7a: Write a SQL query to retrieve the first and last names of customers, along with the product names and unit prices of products they have ordered. Use JOINs to combine data from the "Customers," "Orders," "Order_Items," and "Products" tables. */
SELECT c.first_name, c.last_name, p.product_name, p.unit_price
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN Products p ON oi.product_id = p.product_id;

/* Task 7b: Write an SQL query to calculate the total revenue generated by each product (product name and total revenue), considering all orders and quantities from the "Order_Items" table. */
SELECT p.product_name, SUM(oi.quantity * p.unit_price) AS total_revenue
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_name;
