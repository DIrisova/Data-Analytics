/*
Title: Self-Joins in SQL
Self-joins allow you to join a table to itself to establish relationships within the same table.

Requirements:
    • Use the sample database schema provided below for all tasks.
    • Write SQL queries to fulfill each task and provide the expected output/result.
    • Include comments in your SQL queries to explain your approach and any relevant information.
    • You can use SQL Server Management Studio (SSMS) or any SQL client of your choice to run your queries.

Sample Database Schema for an Employee Hierarchy 

Create Employees Table */
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id));

/* Insert Sample Data into Employees Table */
INSERT INTO Employees (employee_id, first_name, last_name, manager_id) VALUES (1, 'John', 'Doe', NULL); /* CEO */
INSERT INTO Employees (employee_id, first_name, last_name, manager_id) VALUES (2, 'Jane', 'Smith', 1);
INSERT INTO Employees (employee_id, first_name, last_name, manager_id) VALUES (3, 'Alice', 'Johnson', 1);
INSERT INTO Employees (employee_id, first_name, last_name, manager_id) VALUES (4, 'Bob', 'Brown', 2);
INSERT INTO Employees (employee_id, first_name, last_name, manager_id) VALUES (5, 'Emma', 'Davis', 2);
INSERT INTO Employees (employee_id, first_name, last_name, manager_id) VALUES (6, 'Michael', 'Miller', 3);


/* Basic Self-Join Operations */

/* Task 1a: Write a SQL query to retrieve a list of employees along with their respective managers' first names and last names. Display the result in a tabular format. */
SELECT e.employee_id, e.first_name AS employee_first_name, e.last_name AS employee_last_name, 
       m.first_name AS manager_first_name, m.last_name AS manager_last_name
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id;

/* Task 1b: Write a SQL query to find the names (first name and last name) of employees who do not have a manager (CEO). */
SELECT first_name, last_name
FROM Employees
WHERE manager_id IS NULL;

/* Advanced Self-Join Operations */

/* Task 2a: Write a SQL query to calculate the total number of employees reporting to each manager. Include the manager's name (first name and last name) and the count of their direct reports. */
SELECT m.employee_id, m.first_name AS manager_first_name, m.last_name AS manager_last_name, 
       COUNT(e.employee_id) AS direct_reports_count
FROM Employees m
LEFT JOIN Employees e ON m.employee_id = e.manager_id
GROUP BY m.employee_id, m.first_name, m.last_name;

