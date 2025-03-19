------------------------------------------------------------------------------------------------------------------
	
			/*ORDER BY*/

--Sorting rows using the ORDER BY clause
	SELECT * FROM customers
	WHERE state = 'CA'
	ORDER BY first_name;    --by default Ascending

	--[dbo].[Customers]OR--

	SELECT * FROM customers
	WHERE state = 'CA'
	ORDER BY first_name ASC;	
	   
-- Sorting rows in Descending order,
	SELECT * FROM customers
	WHERE state = 'CA'
	ORDER BY first_name DESC;

--Sort a result set by multiple columns
	SELECT city, first_name,last_name
	FROM customers
	ORDER BY city, first_name;

--Sort a result set by multiple columns in different orders
	SELECT city, first_name, last_name
	FROM customers
	ORDER BY city DESC, first_name ASC;

--Sort a result set by a column that is not in the select list
	SELECT city, first_name, last_name
	FROM customers
	ORDER BY state;

--Sort a result set by an expression
		--LEN(): function returns the number of characters in a string.
		SELECT first_name, last_name , LEN(first_name) as 'Length_of_FirstName'
		FROM customers
		ORDER BY LEN(first_name) DESC;

--Sort by ordinal positions of columns
	SELECT first_name, last_name
	FROM customers
	ORDER BY 1 ,2;

------------------------------------------------------------------------------------------------------------------

				/*Group BY*/

--To group rows into groups
	SELECT city,COUNT (*)
	FROM customers
	WHERE state = 'CA'
	GROUP BY city
	ORDER BY city;
------------------------------------------------------------------------------------------------------------------

		/*HAVING clause*/

--Filtering groups using the HAVING clause
	SELECT city, COUNT (*)
	FROM customers
	WHERE state = 'NY'
	GROUP BY city
	HAVING COUNT (*) > 0
	ORDER BY city;

------------------------------------------------------------------------------------------------------------------
		/* SELECT TOP */

--Using SQL Server SELECT TOP with a constant value
	SELECT TOP 3 product_name, list_price
	FROM products
	ORDER BY list_price DESC;

--Using SELECT TOP to return a percentage of rows
	SELECT TOP 1 PERCENT
    product_name, 
    list_price
	FROM products
	ORDER BY list_price DESC;

--Using SELECT TOP WITH TIES to include rows that match values in the last row
	SELECT TOP 4 WITH TIES
    product_name, 
    list_price
	FROM products
	ORDER BY list_price DESC;
------------------------------------------------------------------------------------------

