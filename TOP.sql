CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year INT CHECK (model_year >= 1900 AND model_year <= YEAR(GETDATE())),
    list_price DECIMAL(10,2) CHECK (list_price >= 0)
);

INSERT INTO products (product_id, product_name, brand_id, category_id, model_year, list_price)
VALUES
	(1, 'Mountain Bike', 2, 5, 2023, 499.99),
	(2, 'Road Bike', 3, 5, 2022, 799.50),
	(3, 'Hybrid Bike', 1, 5, 2024, 699.00),
	(4, 'Electric Scooter', 4, 6, 2023, 1299.99),
	(5, 'Kids Bicycle', 2, 7, 2021, 199.99), 
	(6, 'Scooter', 5, 6, 2000, 799.50),
	(7, 'Bike', 6, 5, 2005, 699.00);

	select * from products;

	SELECT TOP 3
    product_name, 
    list_price
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


