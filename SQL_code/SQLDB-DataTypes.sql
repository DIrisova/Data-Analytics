/* 
VARCHAR and NVARCHAR:
VARCHAR: Stands for Variable Character. It stores alphanumeric data.
NVARCHAR: Stands for National Variable Character. It's similar to VARCHAR but stores Unicode data, it can store characters from multiple languages.
*/

DECLARE @first_name VARCHAR(10) = 'John'
DECLARE @last_name NVARCHAR(10) = N'東京'
SELECT @first_name as First_Name, @last_name as Last_Name


/*
CHAR and NCHAR:
a. CHAR: Fixed-length character data type.
NCHAR: Fixed-length Unicode character data type.
b. CHAR uses a fixed amount of storage, regardless of the actual data length, while VARCHAR only uses storage proportional to the data length.
*/

DECLARE @fixed_char CHAR(10) = 'ABC'
DECLARE @fixed_unicode NCHAR(10) = N'東京'
SELECT @fixed_char as fixed_char, @fixed_unicode as UNICODE


/*
DATETIME:
Stores date and time data and representing dates, times, or both together.
*/

DECLARE @date DATE = GETDATE()
DECLARE @date_time DATETIME = GETDATE()
Declare @date_time2 DATETIME2 = GETDATE()
SELECT @date as Date, @date_time as Date_Time, @date_time2 as Date_Time2


/*
INT:
Integer. It stores whole numbers without decimal points. Used for representing counts, IDs, and other whole number values.
The permissible range of values for an INT column is from -2,147,483,648 to 2,147,483,647.
*/

DECLARE @num INT = 10
DECLARE @big_num bigint = 12345678910
DECLARE @small_num TINYINT = 9
SELECT @num as Reg_INT, @big_num as BigNumbers, @small_num as Small_numbers


/*
DECIMAL is a fixed-point number data type.
It's used for precise numeric values, especially for monetary or financial data.
*/


DECLARE @dress_price DECIMAL(10, 2) = 150.25
SELECT @dress_price as Price


/*
BIT: stores boolean values (true or false).
It's primarily used for representing binary data, such as flags or switches.
Scenario: Storing boolean values like 'inStock' or 'sold'. Example: Setting a BIT column to 1 (true) if a product is available and 0 (false) if it's out of stock.
*/

DECLARE @inStock BIT = 1
SELECT @inStock as In_Stock


/*
MONEY is a data type used to store monetary values.
It stores fixed-point numbers with four decimal places of precision.
MONEY is used for financial calculations, such as transactions, payments, and budgeting.
It ensures accurate representation and calculations of monetary values.
*/

DECLARE @price Money = 100.25
DECLARE @discount Money = 10.25
DECLARE @total Money = @price - @discount 
SELECT @price as Price, @discount as Discount, @total as Total



