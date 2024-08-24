-- These exercises cover a range of DateTime functions in SQL Server, 
-- including date extraction, calculation, formatting, and more. You can work with the sample "Orders" table and data provided.
-- Sample Table: 1
-- Let's assume we have a table called "Orders" with the following structure:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATETIME,
    ShipDate DATETIME,
    CustomerName NVARCHAR(50)
);

-- -- Sample Data
INSERT INTO Orders (OrderID, OrderDate, ShipDate, CustomerName)
VALUES
    (1, '2023-01-15 08:30:00', '2023-01-18 14:45:00', 'John Doe'),
    (2, '2023-02-05 10:15:00', '2023-02-10 09:30:00', 'Jane Smith'),
    (3, '2023-03-20 16:20:00', '2023-03-24 12:10:00', 'Bob Johnson'),
    (4, '2023-04-10 09:45:00', '2023-04-15 16:00:00', 'Alice Brown');

-- Homework Questions:
-- 	•	Date Extraction:
-- 	•	Write a SQL query to extract the year and month from the "OrderDate" column for all orders.
select OrderID, CustomerName, YEAR(OrderDate) as OrderYear, MONTH(OrderDate) as OrderMonth FROM Orders

-- 	•	Date Difference:
-- 	•	Create a query to calculate the number of days between the "OrderDate" and "ShipDate" for each order.
select OrderID, CustomerName, DATEDIFF(day, OrderDate, ShipDate) as CalculateDay from Orders

-- 	•	Date Formatting:
-- 	•	Develop a query to display the "OrderDate" in the "yyyy-MM-dd" format for all orders.
SELECT OrderID, CustomerName, Convert(varchar(12), OrderDate, 23) as formatted_date from Orders

-- 	•	Date Functions and Comparison:
-- 	•	Write a query to find all orders placed in the year 2023.
SELECT OrderID, CustomerName, OrderDate as Orders_2023 from Orders WHERE YEAR(OrderDate) = 2023

-- 	•	Date Aggregation:
-- 	•	Create a query to calculate the average time (in hours and minutes) it took for orders to ship.

select OrderID,
                AVG(DATEDIFF(hour, OrderDate, ShipDate)) as AVG_Ship_Time_Diff_In_Hours,
                AVG(DATEDIFF(MINUTE, OrderDate, ShipDate)) % 60 as AVG_Ship_Time_Remain_Min,
                CAST(AVG(DATEDIFF(hour, OrderDate, ShipDate))  as VARCHAR)  + ' hours and ' + 
                CAST(AVG(DATEDIFF(MINUTE, OrderDate, ShipDate)) % 60 as VARCHAR)  + ' minutes' as AVG_TIME
from Orders 
GROUP BY OrderID


-- 	•	Date Conversion:
-- 	•	Write a query to convert the "OrderDate" to a date without a time component for all orders.

SELECT OrderID, CustomerName, 
CONVERT(date, OrderDate) as Date from orders


-- 	•	Date Range Selection:
-- 	•	Develop a query to retrieve orders that were placed between '2023-03-01' and '2023-04-30'.
select OrderID, CustomerName, CONVERT(date, OrderDate) as Date 
FROM orders
where OrderDate BETWEEN '2023-03-01' and '2023-04-30'


-- 	•	Age Calculation:
-- 	•	Create a query to calculate the age of each customer based on their "OrderDate" (assuming "OrderDate" represents their birthdate).
select CustomerName as Full_Name, Convert(date, OrderDate) as DOB, DATEDIFF(year, OrderDate, GETDATE()) as Customer_Age from orders

-- 	•	Day of the Week:
-- 	•	Write a query to find the day of the week (e.g., Monday, Tuesday) for the "OrderDate" of each order.

SELECT OrderID, DATENAME(weekday, OrderDate) from orders

-- 	•	Time Comparison:
-- 	•	Develop a query to find orders that were placed before 10:00 AM.

SELECT * FROM orders WHERE CAST(OrderDate as TIME) < '10:00:00'

-- 	•	Quarterly Aggregation:
-- 	•	Create a query to calculate the total number of orders for each quarter in 2023.

SELECT 
    DATEPART(QUARTER, OrderDate) AS Quarter, 
    COUNT(OrderID) AS TotalOrders
FROM 
    Orders
WHERE 
    YEAR(OrderDate) = 2023
GROUP BY 
    DATEPART(QUARTER, OrderDate)
ORDER BY 
    Quarter;


-- 	•	Leap Year Check:
-- 	•	Write a query to check if the year of "OrderDate" in each order is a leap year.Top of Form
I couldn't solve this problem. I'll come back later.  


-- Sample Table: 2
-- Let's assume we have a table called "EmployeeHireDates" with the following structure:
CREATE TABLE EmployeeHireDates (
    EmployeeID INT PRIMARY KEY,
    HireDate DATE
);

-- -- Sample Data
INSERT INTO EmployeeHireDates (EmployeeID, HireDate)
VALUES
    (1, '2022-01-15'),
    (2, '2021-05-10'),
    (3, '2023-03-20'),
    (4, '2019-09-05');

-- Homework Questions:
-- 	•	DATEPART - Year Extraction:
-- 	•	Write a SQL query to extract the year from the "HireDate" column for all employees.

SELECT EmployeeID, YEAR(HireDate) as extracted_year from EmployeeHireDates


-- 	•	DATEPART - Quarter Extraction:
-- 	•	Create a query to extract the quarter from the "HireDate" column for all employees.
SELECT EmployeeID,  DATEPART(Quarter, HireDate) as QUARTER from EmployeeHireDates

-- 	•	DATEPART - Month Extraction:
-- 	•	Develop a query to extract the month from the "HireDate" column for all employees.
SELECT EmployeeID, MONTH(HireDate) as extracted_month from EmployeeHireDates

-- 	•	DATEPART - Day of the Week Extraction:
-- 	•	Write a query to find the day of the week (e.g., Monday, Tuesday) for the "HireDate" of each employee.
SELECT EmployeeID, DATENAME(weekday, HireDate) as Day_of_week from EmployeeHireDates

-- 	•	DATEPART - Day of the Year Extraction:
-- 	•	Create a query to extract the day of the year (1 to 365 or 366) from the "HireDate" column for all employees.
SELECT EmployeeID, HireDate, 
    DATEPART(dayofyear, HireDate) AS DayOfYear
FROM 
    EmployeeHireDates;


-- 	•	DATENAME - Month Name Extraction:
-- 	•	Develop a query to extract the full name of the month from the "HireDate" for all employees.
SELECT EmployeeID, DATENAME(month, HireDate) as NameOfMonth from EmployeeHireDates


-- 	•	DATENAME - Day of the Week Name Extraction:
-- 	•	Write a query to extract the full name of the day of the week from the "HireDate" for all employees.
SELECT EmployeeID, DATENAME(weekday, HireDate) as NameOfWeek from EmployeeHireDates

-- 	•	DATENAME - Quarter Name Extraction:
-- 	•	Create a query to extract the full name of the quarter from the "HireDate" for all employees.
SELECT EmployeeID, DATENAME(quarter, HireDate) as NameOfQuater from EmployeeHireDates

-- 	•	DATENAME - Combining Functions:
-- 	•	Write a query to display the "EmployeeID," the name of the month, and the day of the week for each employee.
SELECT EmployeeID, DATENAME(month, HireDate) as NameOfMonth, DATENAME(weekday, HireDate) AS NameOfWeek FROM EmployeeHireDates

-- 	•	Combining DATEPART and DATENAME:
-- 	•	Develop a query to display the "EmployeeID," the name of the quarter, and the year for each employee.
SELECT EmPloyeeID, DATENAME(quarter, HireDate) as QUARTER, DATEPART(year, HireDate) as YEAR from EmployeeHireDates

-- 	•	Age Calculation:
-- 	•	Create a query to calculate the age of each employee based on their "HireDate."
SELECT EmPloyeeID, DATEDIFF(year, HireDate, GETDATE()) AS Age FROM EmployeeHireDates

-- 	•	Holiday Checker:
-- 	•	Write a query to check if an employee's "HireDate" falls on a holiday (consider a list of known holidays in your region).Top of Form
I couldn't solve this problem. I'll come back later.






