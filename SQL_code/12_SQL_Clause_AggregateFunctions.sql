-- Temporary tables in SQL. 
-- Temporary tables are useful for storing and manipulating data within the scope of a session or a transaction.

-- Question 1: Creating a Temporary Table
-- Write SQL code to create a temporary table named TempOrders with the following columns:
-- 	•	OrderID (INT)
-- 	•	CustomerName (VARCHAR)
-- 	•	OrderDate (DATE)
-- 	•	TotalAmount (DECIMAL)

CREATE TABLE #TempOrders (
	OrderID INT,
	CustomerName VARCHAR(50),
	OrderDate DATE,
	TotalAmount DECIMAL(10,2)
);

-- Question 2: Populating the Temporary Table
-- Insert at least three sample records into the TempOrders table. Make sure to include values for each column.

INSERT INTO #TempOrders (OrderID, CustomerName, OrderDate, TotalAmount)
VALUES 
(1, 'John Doe', '2023-06-01', 150.50),
(2, 'Jane Smith', '2023-06-15', 250.75),
(3, 'Alice Johnson', '2023-06-20', 350.00);


-- Question 3: Querying the Temporary Table
-- Write a SQL query to retrieve all records from the TempOrders table where the TotalAmount is greater than 100. 
-- Include all columns in the result set.

SELECT TotalAmount 
FROM #TempOrders
WHERE TotalAmount > 100

-- Question 4: Modifying Data in the Temporary Table
-- Update the TotalAmount of one of the records in the TempOrders table to be 150. Write the SQL code to perform this update.

UPDATE #TempOrders SET TotalAmount = 150 WHERE TotalAmount > 250;

-- Question 5: Delete data from Temporary Table
-- Write a SQL query to delete few records from the TempOrders table.

DELETE FROM #TempOrders
WHERE OrderId IN (1, 2)

-- Question 6: Dropping the Temporary Table 
-- Write SQL code to drop the TempOrders temporary table when you're done using it.

Drop TABLE #TempOrders;

