/*
Title: Exploring UNION, UNION ALL, INTERSECT, and EXCEPT Operators in SQL
These operators are used to combine and compare the results of multiple SELECT statements. 
This assignment will help you understand and apply these operators effectively.

Requirements:
    • Use the sample database schema provided below for all tasks.
    • Write SQL queries to fulfill each task and provide the expected output/result.
    • Include comments in your SQL queries to explain your approach and any relevant information.
    • You can use SQL Server Management Studio (SSMS) or any SQL client of your choice to run your queries.


Sample Database Schema:
Assume we have a simple database schema with two tables: Employees and Contractors. */

/* Create Employees Table */
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

/* Insert Sample Data into Employees Table */
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department) VALUES (1, 'John', 'Doe', 'HR');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department) VALUES (2, 'Jane', 'Smith', 'IT');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department) VALUES (3, 'Alice', 'Johnson', 'Finance');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department) VALUES (4, 'Bob', 'Brown', 'HR');

/* Create Contractors Table */
CREATE TABLE Contractors (
    ContractorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Project VARCHAR(50)
);

/* Insert Sample Data into Contractors Table */
INSERT INTO Contractors (ContractorID, FirstName, LastName, Project) VALUES (101, 'Sarah', 'White', 'Project A');
INSERT INTO Contractors (ContractorID, FirstName, LastName, Project) VALUES (102, 'Michael', 'Lee', 'Project B');
INSERT INTO Contractors (ContractorID, FirstName, LastName, Project) VALUES (103, 'Alice', 'Johnson', 'Project C');
INSERT INTO Contractors (ContractorID, FirstName, LastName, Project) VALUES (104, 'Emma', 'Davis', 'Project D');


/* Task 1: UNION Operator 
Write SQL queries to perform the following tasks:

1a. Retrieve the first names of all employees and contractors. */
SELECT FirstName 
FROM Employees
UNION
SELECT FirstName 
FROM Contractors;

/* 1b. Retrieve the last names of all employees and contractors. */
SELECT LastName 
FROM Employees
UNION
SELECT LastName 
FROM Contractors;

/* 1c. Retrieve the first names of employees and contractors who work in the HR department or are assigned to Project A. */
SELECT FirstName 
FROM Employees 
WHERE Department = 'HR'
UNION
SELECT FirstName 
FROM Contractors 
WHERE Project = 'Project A';

/* Task 2: UNION ALL Operator 
Write SQL queries to perform the following tasks: 

2a. Retrieve the first names of all employees and contractors. */
SELECT FirstName 
FROM Employees
UNION ALL
SELECT FirstName 
FROM Contractors;

/* 2b. Retrieve the last names of all employees and contractors. */
SELECT LastName 
FROM Employees
UNION ALL
SELECT LastName 
FROM Contractors;

/* 2c. Retrieve the first names of employees and contractors who work in the HR department or are assigned to Project A. */
SELECT FirstName 
FROM Employees 
WHERE Department = 'HR'
UNION ALL
SELECT FirstName 
FROM Contractors 
WHERE Project = 'Project A';

/* Task 3: INTERSECT Operator 
Write SQL queries to perform the following tasks: */

/* 3a. Retrieve the first names of employees who are also contractors. */
SELECT FirstName 
FROM Employees
INTERSECT
SELECT FirstName 
FROM Contractors;

/* 3b. Retrieve the last names of employees who are also contractors. */
SELECT LastName 
FROM Employees
INTERSECT
SELECT LastName 
FROM Contractors;

/* Task 4: EXCEPT Operator 
Write SQL queries to perform the following tasks:

4a. Retrieve the first names of employees who are not contractors. */
SELECT FirstName 
FROM Employees
EXCEPT
SELECT FirstName 
FROM Contractors;

/* 4b. Retrieve the last names of employees who are not contractors. */
SELECT LastName 
FROM Employees
EXCEPT
SELECT LastName 
FROM Contractors;