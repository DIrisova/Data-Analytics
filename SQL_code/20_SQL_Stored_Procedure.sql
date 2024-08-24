-- Stored procedures, parameterized stored procedures, and output parameters in SQL. 
-- These are essential database objects that can help encapsulate and execute complex tasks efficiently. This assignment will provide you with hands-on experience in creating and using these SQL constructs.

-- Task 1: Stored Procedure Creation: Create a stored procedure in SQL that retrieves all the products with a price higher than a specified amount. The stored procedure should take the minimum price as an input parameter and display the product details.

CREATE PROCEDURE spProdHigherThan
    @paramMinPrice Decimal(10, 2)  -- The minimum price for filtering
AS
BEGIN
    SELECT * FROM Products WHERE price > @paramMinPrice
END
    
-- Task 2: Stored Procedure Execution: Execute the stored procedure created in Task 1 with three different minimum price values and display the product details for each execution.
EXEC spProdHigherThan @paramMinPrice = 200
EXEC spProdHigherThan @paramMinPrice = 300
EXEC spProdHigherThan @paramMinPrice = 100

-- Task 3: Parameterized Stored Procedure Creation: Create a parameterized stored procedure that accepts a product name as input and retrieves product details based on that name. The stored procedure should use the "LIKE" operator to find matching products.
CREATE PROCEDURE spGetProdName
    @productName NVARCHAR(100)
AS
BEGIN
    SELECT * FROM Products 
    WHERE productName LIKE '%' + @productName + '%'
END

-- Task 4: Parameterized Stored Procedure Execution: Execute the parameterized stored procedure from Task 3 for three different product names and display the product details for each execution.
EXEC spGetProdName @paramName = 'Black Chair'
EXEC spGetProdName @paramName = 'Desk'
EXEC spGetProdName @paramName = 'Computer'

-- Task 5: Output Parameter Creation: Create a stored procedure that calculates the total order value for a specified customer ID. This stored procedure should have an output parameter that returns the calculated total order value.
CREATE PROCEDURE spCalculateTotalOrderValue 
    @customerId INT,
    @totalOrderValue INT OUTPUT
AS
BEGIN
   SELECT @totalOrderValue = sum(orderValue)
   FROM Orders
   WHERE customerId = @customerId
END

-- Task 6: Output Parameter Execution: Execute the stored procedure created in Task 5 for three different customer IDs and display the total order value returned by the output parameter.
DECLARE @totalValue1 INT
EXECUTE spCalculateTotalOrderValue @customerId = 1, @totalValue1 OUTPUT
select @totalValue1


DECLARE @totalValue2 INT
EXECUTE spCalculateTotalOrderValue @customerId = 2, @totalValue2 OUTPUT
select @totalValue2


DECLARE @totalValue3 INT
EXECUTE spCalculateTotalOrderValue @customerId = 3, @totalValue3 OUTPUT
select @totalValue3


/* 
Task 7: Documentation: Write comments and documentation for your stored procedures, explaining their purpose, input parameters, and expected output. Include explanations for the use of output parameters.
Documentation: 
Task 1 & 2: Retrieving product based on Price. The store procedure spProdHigherThan takes a @paramMinPrice decimal as input and retrieves all products with a price greater than that value 
Task 3 & 4: The store procedure spGetProdName takes product name (@paramName) as input parameters and uses the LIKE operator with wildcard (%) to search for products containing that name
Task 5 & 6: The store procedure spCalculateTotalOrderValue takes a @customerId and has an output parameter @totalOrderValue. It calculates the total order value for the customer using SUM and assigns it to the output parameter. 
/*





