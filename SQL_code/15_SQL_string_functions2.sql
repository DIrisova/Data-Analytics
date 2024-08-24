-- These exercises cover a range of scenarios where the CHARINDEX, REPLICATE, and SUBSTRING functions can be applied in SQL.
-- Sample Table:
-- Let's assume we have a table called "Products" with the following structure:
-- CREATE TABLE Products (
--     ProductID INT PRIMARY KEY,
--     ProductName NVARCHAR(100),
--     Description NVARCHAR(255)
-- );

-- -- Sample Data
-- INSERT INTO Products (ProductID, ProductName, Description)
-- VALUES
--     (1, 'Widget A', 'This is Widget A, a high-quality product.'),
--     (2, 'Gizmo B', 'Gizmo B is an innovative device for your needs.'),
--     (3, 'Doodad C', 'Doodad C - making life simpler since 2020.'),
--     (4, 'Thingamajig D', 'Thingamajig D - a must-have in every home.');

-- Homework Questions:
-- 	CHARINDEX:
-- 	•	Write a SQL query to find the position of the word "high-quality" in the "Description" column of "Products." Return the position if found or 0 if not found.

Select ProductID, ProductName, CHARINDEX('high-quality', Description) as HighQualityPosition FROM Products

-- 	CHARINDEX and Substring:
-- 	•	Create a query to extract the first 15 characters of the "Description" column for all products after the word "Doodad."

SELECT 
    ProductID, 
    ProductName,
    SUBSTRING(Description, CHARINDEX('Doodad', Description) + LEN('Doodad') + 1, 15) AS ExtractedDescription
FROM 
    Products
WHERE 
    CHARINDEX('Doodad', Description) > 0;

-- 	REPLICATE:
-- 	•	Write a query to replicate the product name in the "ProductName" column four times and concatenate it with " - Special Offer." For example, "Widget A - Special Offer."

SELECT ProductID, ProductName, REPLICATE(ProductName + ' - Special Offer. ', 4) as SpecialOffer FROM Products

-- 	Substring and CHARINDEX:
-- 	•	Develop a query to extract the portion of the "Description" column that is between the word "is" and the word "for" for all products.
SELECT 
    ProductID, 
    ProductName,
    SUBSTRING(
        Description, 
        CHARINDEX('is', Description) + LEN('is') + 1,
        CHARINDEX('for', Description) - CHARINDEX('is', Description) - LEN('is') - 1
    ) AS ExtractedPortion
FROM 
    Products
WHERE 
    CHARINDEX('is', Description) > 0 
    AND CHARINDEX('for', Description) > 0;

-- 	Substring and Length Calculation:
-- 	•	Create a query to retrieve the last 20 characters of the "Description" column for all products.

SELECT ProductID, ProductName, RIGHT(Description, 20) as Last20Chars FROM Products

-- 	CHARINDEX and REPLICATE:
-- 	•	Write a query to find the position of the letter "m" in the product name and replicate the product name by that many times. For example, for "Gizmo B," the result should be “Gizmo B Gizmo B Gizmo B Gizmo B”.

SELECT 
    ProductID, 
    ProductName,
    REPLICATE(ProductName + ' ', CHARINDEX('m', ProductName)) as ReplacedName 
	from Products 
	WHERE CHARINDEX('m', ProductName) > 0


-- 	Substrings with Dynamic Length:
-- 	•	Develop a query that extracts a substring from the "Description" column of each product, starting from the fifth character and extending to the end of the string.
SELECT 
    ProductID, 
    ProductName,
    SUBSTRING(Description, 5, LEN(Description) - 4) AS DynamicSubstring
FROM 
    Products;

-- 	Substring with Range:
-- 	•	Write a query to extract the text between the 10th and 20th characters in the "Description" column for all products.
-- Top of Form
SELECT 
    ProductID, 
    ProductName,
    SUBSTRING(Description, 10, 11) AS RangeSubstring
FROM 
    Products;
