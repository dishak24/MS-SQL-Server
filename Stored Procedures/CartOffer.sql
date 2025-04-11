/*
1. 	A user sends a list of items in their cart.
	The Stored Procedure applies best offers/coupons from a stored list (e.g., BOGO, 20% off, Buy 3 get 1).
	It returns the final price + savings.
*/

--BOGO-Buy 1 get 1 
--20% = 0.2

select * from Product.Products;

insert into Product.Products values('Watch', 3000, 12);
insert into Product.Products values('Earphones', 5000, 5);

--User table
create table Product.Users
(
	UserId int primary key Identity(1,1),
	Name varchar(25),

);

insert into Product.Users values 
('Disha'),
('Riya'),
('Kittu');

select * from Product.Users;

--cart table
create table Product.Carts 
(
	cartId int primary key Identity(1,1),
	userId int,
	productId int,
	Quantity int,
	foreign key (userId) references Product.Users(UserId)
	on delete cascade
	on update cascade,
	foreign key (productId) references Product.Products(ProductId)
	on delete cascade
	on update cascade
);

insert into Product.Carts (UserId, ProductId, Quantity)values 
(1, 1, 2),   
(1, 2, 5),   
(2, 5, 4);

select * from Product.Carts;

--SP for apply offer
Create or alter procedure SP_ApplyProductOffer
--@productId int
@cartId int

--@quantity int
as
begin
	declare @prize dec(10,2)
	declare @finalPrize dec(10,2)
	declare @savings dec(10,2)
	declare @quantity int

	--select @prize = Price from Product.Products  
	--where ProductID= @productId;
	
	--to get prize
	select @prize = p.Price from Product.Products p 
	inner join Product.Carts c
	on c.productId = p.ProductID
	where c.cartId= @cartId;

	-- to get Quantity
	select @quantity = Quantity from Product.Carts
	where cartId = @cartId;


	if (@cartId = 1)
	begin
		--BOGO offer for @cartId = 1
		set @finalPrize = (@quantity / 2 + @quantity % 2) * @prize;
		set @savings = (@quantity * @prize) - @finalPrize;
	end

	else if (@cartId = 2)
	begin
		--20% offer for @cartId = 2
		set @finalPrize = @quantity * @prize * 0.8;
		set @savings = @quantity * @prize * 0.2;
	end

	else if (@cartId = 3 )
	begin
		declare @freeProducts int;
		--buying 4 => pay for 3 and 1 free
		set @freeProducts = @quantity / 4;
		set @finalPrize = (@quantity - @freeProducts) * @prize;
		set @savings = @freeProducts * @prize;
	end

	else
	--simple no offer for other productID
	begin
		set @finalPrize = @quantity * @prize;
		set @savings = 0;
	end

	select @cartId as CartId,
			@quantity as Quantity,
			@prize as Original_Prize,
			@finalPrize as Final_Prize,
			@savings as Savings;

end

---Execution
exec SP_ApplyProductOffer @cartId = 1; --BOGO
exec SP_ApplyProductOffer @cartId = 2; --20% off
exec SP_ApplyProductOffer @cartId = 3; --buy 3 get 1 free



