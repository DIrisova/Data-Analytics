-- Aggregate Functions: SUM, AVG, MAX & MIN 
-- Exercises to reinforce your understanding of using the SUM, AVERAGE, MIN, and MAX functions with the OVER clause in SQL. Use a sample dataset or create your own tables to practice. 
-- Exercise 1: Analyzing Sales Data
-- Consider a table named Sales with the following columns:
-- 	•	SaleID (int)
-- 	•	ProductID (int)
-- 	•	SaleDate (date)
-- 	•	QuantitySold (int)
-- 	•	Revenue (decimal)

CREATE TABLE Sales (
	SaleID int,
	ProductID int,
	SaleDate date,
	QuantitySold int,
	Revenue decimal
)

INSERT into Sales (SaleID, ProductID, SaleDate, QuantitySold, Revenue) 
VALUES
    (1, 101, '2023-01-15', 10, 150.00),
    (2, 102, '2023-01-20', 5, 75.50),
    (3, 103, '2023-02-05', 20, 300.00),
    (4, 104, '2023-02-10', 15, 225.75),
    (5, 105, '2023-03-01', 7, 105.00),
    (6, 106, '2023-03-15', 12, 180.00),
    (7, 107, '2023-04-01', 8, 120.00),
    (8, 108, '2023-04-10', 14, 210.50);


-- Write SQL queries to accomplish the following tasks:
-- 	•	Use the SUM function with the OVER clause to calculate the cumulative sum of revenue over all rows, ordered by SaleDate. Display SaleID, SaleDate, Revenue, and the cumulative revenue.

SELECT SaleID, SaleDate, Revenue, SUM(Revenue) 
OVER(ORDER BY SaleDate) as Cumulative_Sum
FROM Sales
ORDER BY SaleDate;

-- 	•	Use the AVERAGE function with the OVER clause to calculate the average revenue for each product, ordered by SaleDate. Display ProductID, SaleDate, Revenue, and the average revenue for each product.
 SELECT ProductID, SaleDate, Revenue, AVG(Revenue) OVER(PARTITION BY ProductID order by SaleDate)  as AverageRevenue 
 FROM Sales; 


-- 	•	Use the MIN function with the OVER clause to find the minimum quantity sold for each product, ordered by SaleDate. Display ProductID, SaleDate, QuantitySold, and the minimum quantity sold.
SELECT ProductID, SaleDate, QuantitySold, MIN(QuantitySold) OVER(PARTITION BY ProductID order by SaleDate) as minimum_quantity_sold from Sales;

-- 	•	Use the MAX function with the OVER clause to find the maximum quantity sold for each product, ordered by SaleDate. Display ProductID, SaleDate, QuantitySold, and the maximum quantity sold.
SELECT ProductID, SaleDate, QuantitySold, MAX(QuantitySold) OVER(PARTITION BY ProductID ORDER BY SaleDate) as MaximumQuantitySold from Sales;


-- Exercise 2: Analyzing Employee Salaries
-- Consider a table named EmployeeSalaries with the following columns:
-- 	•	EmployeeID (int)
-- 	•	FirstName (varchar)
-- 	•	LastName (varchar)
-- 	•	Department (varchar)
-- 	•	Salary (decimal)

CREATE TABLE EmployeeSalaries (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO EmployeeSalaries (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
    (1, 'John', 'Doe', 'Finance', 55000.00),
    (2, 'Jane', 'Smith', 'HR', 60000.00),
    (3, 'Michael', 'Johnson', 'IT', 75000.00),
    (4, 'Emily', 'Davis', 'Marketing', 58000.00),
    (5, 'William', 'Brown', 'IT', 72000.00);

Select * FROM EmployeeSalaries;
-- Write SQL queries to perform the following tasks:
-- 	•	Use the SUM function with the OVER clause to calculate the total salary for each department, ordered by LastName. Display Department, LastName, Salary, and the total salary for each department.
SELECT LastName, Salary, SUM(Salary) OVER(ORDER BY LastName) as TotalSalary


-- 	•	Use the AVERAGE function with the OVER clause to calculate the average salary for each department, ordered by LastName. Display Department, LastName, Salary, and the average salary for each department.
SELECT Department, LastName, Salary, 
AVG(Salary) OVER(PARTITION By Department order by LastName) as AvgSalaryDepartment
FROM EmployeeSalaries

-- 	•	Use the MIN function with the OVER clause to find the minimum salary for each department, ordered by LastName. Display Department, LastName, Salary, and the minimum salary for each department.
SELECT Department, LastName, Salary, MIN(Salary) OVER(PARTITION BY Department ORDER BY LastName)  as MinSalaryDepartment FROM EmployeeSalaries

-- 	•	Use the MAX function with the OVER clause to find the maximum salary for each department, ordered by LastName. Display Department, LastName, Salary, and the maximum salary for each department.
SELECT Department, LastName, Salary, MAX(Salary) OVER(PARTITION BY Department ORDER BY LastName)  as MinSalaryDepartment FROM EmployeeSalaries

-- Exercise 3: Analyzing Exam Scores
-- Consider a table named ExamScores with the following columns:
-- 	•	StudentID (int)
-- 	•	StudentName (varchar)
-- 	•	ExamDate (date)
-- 	•	Score (int)


CREATE TABLE ExamScores (
    StudentID INT,
    StudentName VARCHAR(100),
    ExamDate DATE,
    Score INT
);


INSERT INTO ExamScores (StudentID, StudentName, ExamDate, Score)
VALUES
    (1, 'Alice Smith', '2023-05-01', 85),
    (2, 'Bob Johnson', '2023-05-01', 90),
    (3, 'Charlie Brown', '2023-06-15', 78),
    (4, 'David Wilson', '2023-06-15', 92),
    (5, 'Emma Davis', '2023-07-20', 88),
    (6, 'Fiona White', '2023-07-20', 95),
    (7, 'George Harris', '2023-08-25', 80),
    (8, 'Hannah Clark', '2023-08-25', 85),
    (9, 'Ivy Lewis', '2023-09-30', 89),
    (10, 'Jack Walker', '2023-09-30', 84);


-- Write SQL queries to achieve the following:
-- 	•	Use the SUM function with the OVER clause to calculate the total score for each student, ordered by ExamDate. Display StudentID, ExamDate, Score, and the total score for each student.
SELECT StudentID, ExamDate, Score, SUM(Score) OVER(PARTITION BY StudentID ORDER BY ExamDate) as TotalScore FROM ExamScores

-- 	•	Use the AVERAGE function with the OVER clause to calculate the average score for each student, ordered by ExamDate. Display StudentID, ExamDate, Score, and the average score for each student.
SELECT StudentID, ExamDate, Score, AVG(Score) OVER(PARTITION BY StudentID ORDER BY ExamDate) as AvgScore FROM ExamScores

-- 	•	Use the MIN function with the OVER clause to find the minimum score for each student, ordered by ExamDate. Display StudentID, ExamDate, Score, and the minimum score for each student.
SELECT StudentID, ExamDate, Score, MIN(Score) OVER(PARTITION BY StudentID order by ExamDate) as StudentMinScore FROM ExamScores

-- 	•	Use the MAX function with the OVER clause to find the maximum score for each student, ordered by ExamDate. Display StudentID, ExamDate, Score, and the maximum score for each student.
SELECT StudentID, ExamDate, Score, MAX(Score) OVER(PARTITION BY StudentID order by ExamDate) as StudentMinScore FROM ExamScores
-- Top of Form



-- Ranking Functions: RANK, DENSE_RANK & ROW_NUMBER
-- Instructions: Please complete the following exercises to reinforce your understanding of the Rank, Dense Rank, and Row Number functions in SQL. Use a sample dataset or create your own tables to practice. 
-- Exercise 1: Ranking Students by Test Scores
-- Consider a table named StudentScores with the following columns:
-- 	•	StudentID (int)
-- 	•	StudentName (varchar)
-- 	•	TestScore (Decimal)
CREATE TABLE StudentScores (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    TestScore DECIMAL(10, 2)
);

INSERT INTO StudentScores (StudentID, StudentName, TestScore)
VALUES
    (1, 'Alice', 85.5),
    (2, 'Bob', 79.2),
    (3, 'Charlie', 92.0),
    (4, 'David', 88.7),
    (5, 'Eve', 79.9),
    (6, 'Frank', 85.5),
    (7, 'Grace', 91.2),
    (8, 'Hannah', 84.3),
    (9, 'Ian', 88.5),
    (10, 'Jane', 90.1);

select * from StudentScores


-- Write SQL queries to accomplish the following tasks:
-- 	•	Rank students based on their test scores in descending order, displaying their names and ranks.
SELECT StudentName, RANK() OVER(ORDER BY TestScore DESC) as Rank from StudentScores

-- 	•	Calculate dense ranks for students based on their test scores in ascending order and display their names and dense ranks.
SELECT StudentName, DENSE_RANK() OVER(ORDER BY TestScore ASC) as DenseRank from StudentScores

-- 	•	Use the ROW_NUMBER function to number students in ascending order by their test scores, displaying their names and row numbers.
SELECT StudentName, ROW_NUMBER() OVER(Order by TestScore ASC) as RowNumber from StudentScores

-- Exercise 2: Ranking Salespeople by Sales Amount
-- Consider a table named Sales with the following columns:
-- 	•	SalespersonID (int)
-- 	•	SalespersonName (varchar)
-- 	•	SalesAmount (float)
-- 	•	SaleDate (date)

CREATE TABLE Salespeople (
    SalespersonID INT,
    SalespersonName VARCHAR(100),
    SalesAmount FLOAT,
    SaleDate DATE
);

INSERT INTO Salespeople (SalespersonID, SalespersonName, SalesAmount, SaleDate)
VALUES
    (1, 'John Doe', 1500.50, '2024-07-01'),
    (2, 'Jane Smith', 2200.75, '2024-07-02'),
    (3, 'Michael Johnson', 1800.25, '2024-07-03'),
    (4, 'Emily Davis', 2000.00, '2024-07-04'),
    (5, 'Robert Brown', 2500.80, '2024-07-05');

SELECT * from Salespeople


-- Write SQL queries to perform the following tasks:
-- 	•	Rank salespeople based on their total sales amounts in descending order, displaying their names and ranks.
Select SalespersonName, RANK() OVER(Order by SalesAmount DESC) as Rank from Salespeople

-- 	•	Calculate dense ranks for salespeople based on their total sales amounts in ascending order and display their names and dense ranks.
SELECT SalespersonName, Dense_RANK() OVER(Order by SalesAmount ASC) as DenseRank from Salespeople

-- 	•	Use the ROW_NUMBER function to number salespeople in ascending order by their total sales amounts, displaying their names and row numbers.
SELECT SalespersonName, ROW_NUMBER() OVER(Order by SalesAmount ASC) as RowNumber from Salespeople

-- Exercise 3: Ranking Movies by Ratings
-- Consider a table named Movies with the following columns:
-- 	•	MovieID (int)
-- 	•	Title (varchar)
-- 	•	Rating (float)
-- 	•	ReleaseYear (int)

CREATE TABLE Movies (
  MovieID INT PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  Rating FLOAT,
  ReleaseYear INT
);

INSERT INTO Movies (MovieID, Title, Rating, ReleaseYear)
VALUES
  (1, 'The Shawshank Redemption', 9.3, 1994),
  (2, 'The Godfather', 9.2, 1972),
  (3, 'The Dark Knight', 9.0, 2008),
  (4, 'Pulp Fiction', 8.9, 1994),
  (5, 'Schindlers List', 8.9, 1993);

select * from Movies
-- Write SQL queries to achieve the following:
-- 	•	Rank movies based on their ratings in descending order, displaying their titles and ranks.
SELECT Title, RANK() OVER(Order by Rating DESC) as Rank from Movies

-- 	•	Calculate dense ranks for movies based on their ratings in ascending order and display their titles and dense ranks.
SELECT Title, DENSE_RANK() OVER(Order by Rating ASC) as DenseRank from Movies

-- 	•	Use the ROW_NUMBER function to number movies in ascending order by their ratings, displaying their titles and row numbers.
SELECT Title, ROW_NUMBER() OVER(Order by Rating ASC) as NumberRow from Movies

-- Exercise 4: Analyzing Employee Salaries
-- Consider a table named Employees with the following columns:
-- 	•	EmployeeID (int)
-- 	•	FirstName (varchar)
-- 	•	LastName (varchar)
-- 	•	Salary (decimal)
-- 	•	Department (varchar)

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    Department VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary, Department)
VALUES
    (1, 'John', 'Doe', 55000.00, 'HR'),
    (2, 'Jane', 'Smith', 65000.00, 'IT'),
    (3, 'Michael', 'Johnson', 60000.00, 'Finance'),
    (4, 'Emily', 'Williams', 70000.00, 'Marketing'),
    (5, 'David', 'Brown', 58000.00, 'IT');

Select * from Employees

-- Write SQL queries for the following tasks:
-- 	•	Rank employees within each department based on their salaries in descending order. Display their full names, departments, salaries, and ranks.
SELECT Concat(FirstName, ' ', LastName) as Full_Name, department, Salary, Rank() OVER(PARTITION By Department Order By Salary DESC) as SalaryRank from Employees Order by Department, SalaryRank

-- 	•	Calculate dense ranks for employees within each department based on their salaries in ascending order. Display their full names, departments, salaries, and dense ranks.
SELECT Concat(FirstName, ' ', LastName) as Full_Name, department, Salary, Dense_Rank() OVER(PARTITION By Department Order By Salary ASC) as SalaryDenseRank from Employees Order by Department, SalaryDenseRank

-- 	•	Use the ROW_NUMBER function to number employees within each department in ascending order by their salaries. Display their full names, departments, salaries, and row numbers.
SELECT Concat(FirstName, ' ', LastName) as Full_Name, department, Salary, ROW_NUMBER() OVER(PARTITION By Department Order By Salary ASC) as RowNumber from Employees Order by Department, RowNumber

