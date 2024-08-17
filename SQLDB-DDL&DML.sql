-- 1: 
-- DDL stands for Data Definition Language, which is used to define and manage database structures.

--CREATE: This statement is used to create new database objects such as tables, indexes, or databases.
-- CREATE TABLE Employees (ID INT, Name NVARCHAR(50), Department NVARCHAR(50))
 --ALTER: This statement is used to modify the structure of an existing database object.
-- ALTER TABLE Employees ADD Salary DECIMAL(10, 2)
 --DROP: This statement is used to delete database objects.
-- DROP TABLE Employees

-- 2: 
--Creating a new table named "Employees":
CREATE TABLE Employees (ID Int, Name NVarchar(20), Department NVarchar(50))

-- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table. It can also be used to add and drop constraints on a table.
ALTER TABLE Employees ADD Salary DECIMAL(10, 2)


-- 3: 
-- DML stands for Data Manipulation Language, which is used to manipulate data within database objects. 

 --INSERT: This statement is used to insert new rows into a table.
-- INSERT INTO Employees (ID, Name, Department) VALUES (1, 'John Doe', 'HR')
 --UPDATE: This statement is used to modify existing rows in a table.
-- UPDATE Employees SET Department = 'IT' WHERE ID = 1
 --DELETE: This statement is used to delete rows from a table.
-- DELETE FROM Employees WHERE ID = 1

-- 4: 
--Inserting records into the Employees table:

INSERT into Employees (ID, Name, Department, Salary) VALUES (1, 'Anna Smith', 'Accounting', 70000)
INSERT into Employees (ID, Name, Department, Salary) VALUES (2, 'Leanardo Fox', 'Engineering', 200000)
INSERT into Employees (ID, Name, Department, Salary) VALUES (3, 'Barbara Will', 'HR', 100000)


--Updating an employee's department:--
UPDATE Employees SET ID = 101 where ID = 1
UPDATE Employees SET ID = 102 where ID = 2
UPDATE Employees SET ID = 103 where ID = 3


-- 5: 
--Retrieving the names of all employees in a specific department:
SELECT Name FROM Employees where Department = 'HR'


-- 6: 
--Deleting a specific employee record:
DELETE FROM Employees WHERE ID = 102


-- 7: 
--Designing a simple database schema with two tables (Employees and Departments):
--Creating the tables:

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
)

CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)


--Populating the tables with sample data:--

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'Finance')
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (2, 'Marketing')
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (3, 'IT')

INSERT INTO Employees (ID, Name, DepartmentID) VALUES (1, 'Alice Smith', 1)
INSERT INTO Employees (ID, Name, DepartmentID) VALUES (2, 'Bob Johnson', 2)
INSERT INTO Employees (ID, Name, DepartmentID) VALUES (3, 'Carol Williams', 3)


--Data retrieval and manipulation:
--SELECT query:
SELECT Name FROM Employees WHERE DepartmentID = 3

--INSERT query:
INSERT INTO Employees (ID, Name, DepartmentID) VALUES (4, 'David Brown', 1)

--UPDATE query:
UPDATE Employees SET DepartmentID = 2 WHERE ID = 1


--DELETE query:
DELETE FROM Employees WHERE ID = 4