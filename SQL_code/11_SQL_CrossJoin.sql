/* Instructions:
Cross Joins and how to use them effectively.

Question 1: Basic Cross Join
Consider two tables, Employees and Departments, each with the following columns:
Employees Table:
	•	EmployeeID (INT)
	•	FirstName (VARCHAR)
	•	LastName (VARCHAR)
Departments Table:
	•	DepartmentID (INT)
	•	DepartmentName (VARCHAR)

Write an SQL query that performs a basic Cross Join between the Employees and Departments tables 
to create a result set that lists all possible combinations of employees and departments. */

select * 
from employees
CROSS JOIN Departments


/* Question 2: Filtering the Result
Continuing from the previous question, you realize that the result set from the Cross Join in question 1 is too large. 
You want to filter the result set to only include employees who work in departments whose names start with 'S.' 
Write an SQL query that accomplishes this, using the result from question 1 as a starting point. */

select * 
from employees
CROSS JOIN Departments
WHERE DepartmentName LIKE 'S%'

/* Question 3: Creating Combinations
Suppose you have two tables, Colors and Sizes, each with the following columns:
Colors Table:
	•	ColorID (INT)
	•	ColorName (VARCHAR)
Sizes Table:
	•	SizeID (INT)
	•	SizeName (VARCHAR)
Write an SQL query that performs a Cross Join between the Colors and Sizes tables to create a result set that lists all possible combinations of colors and sizes. 
Include both the ColorName and SizeName in the result set. */

select ColorName, SizeName
FROM colors
CROSS JOIN Sizes

