/* 
Title: Exploring Various SQL Clauses in SQL Server
	•	SELECT Clause: Used to specify the columns to retrieve from a table.
	•	FROM Clause: Specifies the table(s) from which to retrieve data.
	•	WHERE Clause: Filters rows based on specified conditions.
	•	GROUP BY Clause: Groups rows into sets based on common values in one or more columns.
	•	HAVING Clause: Filters the grouped rows based on specified conditions.
	•	ORDER BY Clause: Sorts the result set in ascending or descending order.

Requirements:
	•	Use the sample database schema provided below for all tasks.
	•	Write SQL queries to fulfil each task and provide the expected output/result.
	•	Include comments in your SQL queries to explain your approach and any relevant information.
	•	You can use SQL Server Management Studio (SSMS) or any SQL client of your choice to run your queries.

Sample Database Schema:
Assume we have a simple database schema with two tables: Students and Courses. */

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10)
);

-- Insert Sample Data into Students Table
INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender) VALUES (1, 'John', 'Doe', 22, 'Male');
INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender) VALUES (2, 'Jane', 'Smith', 21, 'Female');
INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender) VALUES (3, 'Alice', 'Johnson', 23, 'Female');

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

-- Insert Sample Data into Courses Table
INSERT INTO Courses (CourseID, CourseName, Credits) VALUES (101, 'Math', 3);
INSERT INTO Courses (CourseID, CourseName, Credits) VALUES (102, 'Science', 4);
INSERT INTO Courses (CourseID, CourseName, Credits) VALUES (103, 'History', 3);

/* Tasks: 

Task 1: SELECT and FROM Clauses 
Write SQL queries to perform the following tasks: */

-- Retrieve the first and last names of all students. 
SELECT FirstName, LastName FROM Students;

-- Retrieve the names and credits of all courses. 
SELECT CourseName, Credits FROM Courses;

-- Retrieve the age and gender of students with an age greater than 21.
SELECT Age, Gender FROM Students WHERE Age > 21;

/* Task 2: WHERE Clause 
Write SQL queries to perform the following tasks: */

-- Retrieve the first and last names of students who are females.
SELECT FirstName, LastName FROM Students WHERE Gender = 'Female';

-- Retrieve the names and credits of courses with more than 3 credits.
SELECT CourseName, Credits FROM Courses WHERE Credits > 3;

-- Retrieve the first and last names of students who are older than 20 and are females.
SELECT FirstName, LastName FROM Students WHERE Age > 20 AND Gender = 'Female';

/* Task 3: GROUP BY and HAVING Clauses 
Write SQL queries to perform the following tasks: */

-- Calculate and display the average age of students.
SELECT AVG(Age) AS AverageAge FROM Students;

-- Group students by gender and display the count of students in each group, but only for groups with more than one student. 
SELECT Gender, COUNT(*) AS StudentCount 
FROM Students 
GROUP BY Gender 
HAVING COUNT(*) > 1;

/* Task 4: ORDER BY Clause 
Write SQL queries to perform the following tasks: */

-- Retrieve the first and last names of students, ordered by age in ascending order. 
SELECT FirstName, LastName 
FROM Students 
ORDER BY Age ASC;

-- Retrieve the course names and credits, ordered by credits in descending order.
SELECT CourseName, Credits 
FROM Courses 
ORDER BY Credits DESC;

