
--Table valued User defined Function


	Create Function UDF_GetProductInYear( @model_year int )
	Returns table
	as 
	return
		select product_name, model_year, list_price
		from products
		where model_year = @model_year;


--Function call
	Select   *  from UDF_GetProductInYear(2023);

------------------------------------------------------------------------------------------------------

--Table valued function to get expensive price
	Create Function udf_GetExpensiveProduct(@price decimal(10,2))
	returns Table
	as
	return
		select * from products
		where list_price > @price;

--call

	Select * from udf_GetExpensiveProduct(1000);