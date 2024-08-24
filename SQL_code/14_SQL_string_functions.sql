-- Instructions: 
-- SQL string functions, specifically LEFT, RIGHT, CHARINDEX, and SUBSTRING. These functions are commonly used for text manipulation and extraction in SQL.

-- Question 1: Using LEFT Function
-- Consider a table called "Products" with the following columns:
-- 	•	ProductID (INT)
-- 	•	ProductName (VARCHAR)
-- 	•	Description (VARCHAR)
-- Write an SQL query that uses the LEFT function to retrieve the first 20 characters of the "Description" column for all products in the "Products" table. Include the "ProductID" and truncated "Description" in the result set.

SELECT productID, LEFT(Description, 20) as TruncatedDescription from Product 


-- Question 2: Using RIGHT Function
-- Write an SQL query that uses the RIGHT function to retrieve the first 20 characters of the "Description" column for all products in the "Products" table. Include the "ProductID" and truncated "Description" in the result set.

SELECT ProductID, RIGHT(Description, 20) as TruncatedDescription from Product

-- Question 3: Using CHARINDEX Function
-- Imagine a table named "FileID" with the following columns:
-- 	•	FileID (INT)
-- 	•	FileName (VARCHAR)
-- Write an SQL query that uses the CHARINDEX function to find the position of the first occurrence of the '.' (dot) character in the "FileName" column for all rows in the "FileNames" table. Include the "FileID" and the position of the dot in the result set.

SELECT 	FileID, 
		CHARINDEX('.', FileName) as DotPosition 
FROM 	FileNames;

-- Question 4: Using SUBSTRING Function
-- Suppose you have a table named "CustomerNames" with the following columns:
-- 	•	CustomerID (INT)
-- 	•	FullName (VARCHAR)
-- Write an SQL query that uses the SUBSTRING function to extract the first name (everything before the first space) from the "FullName" column for all customers in the "CustomerNames" table. Include the "CustomerID" and the extracted first name in the result set.

SELECT CustomerID, SUBSTRING(FullName, 1, CHARINDEX(' ', FullName) -1) as FirstName
FROM CustomerNames


-- Question 5: Combining Functions
-- Create a hypothetical table named "EmployeeData" with the following columns:
-- 	•	EmployeeID (INT)
-- 	•	FullName (VARCHAR)
-- Write an SQL query that combines the CHARINDEX and SUBSTRING functions to extract the last name (everything after the last space) from the "FullName" column for all employees in the "EmployeeData" table. Include the "EmployeeID" and the extracted last name in the result set.
-- Top of Form

SELECT EmployeeID, SUBSTRING(FullName, LEN(FullName) - CHARINDEX(' ', REVERSE(FullName)) + 2, LEN(FullName)) as LastName
FROM EmployeeData;
