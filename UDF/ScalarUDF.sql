
--Scalar Function to CalculateDiscount
--Original Price - (Original Price * Discount Percentage)

	Create or Alter Function UDF_CalculateDiscount
	(@price dec(10,2), @quantity int, @discount dec(10,2))
	returns dec(10,2)
	as
	begin
		return @price * @quantity * (1-@discount)
	end


--function call
	select dbo.UDF_CalculateDiscount(30, 4, 1.5) as Discount;

--function call
	SELECT 
    Product_id, 
    SUM(dbo.UDF_CalculateDiscount(Price, Quantity, 1.5)) Net_amount
	FROM 
		Mockaroo.Products
	GROUP BY 
		Product_id
	ORDER BY
		Net_amount DESC;

-------------------------------------------------------------------------------------------------------
--function to get Email
	Create or Alter Function UDF_GetEmail
	(
		@FirstName varchar(50)
	)
	returns varchar(101)  
	as  
	begin  
		return CONCAT(@FirstName,'@gmail.com');
	end;

--Function Call
	Select *, dbo.UDF_GetEmail(Emp_name) as 'Email Address' from Employee;