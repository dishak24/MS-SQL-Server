select * from Employees;

--Take id as a input and if id exist then update record otherwise insert new record
	Create or Alter procedure SP_InsertOrUpdateEmployees
	( @EmployeeID int, @Name varchar(25), @Age int, @Department varchar(25), @Salary money)
	as
	begin
	
		if Exists( Select EmployeeID from Employees where EmployeeID = @EmployeeID )
		begin
	
			update 	Employees
			set Name = @Name, 
			Salary = @Salary
			where EmployeeID = @EmployeeID
	
			print 'EmployeeID is already exist. So, Data Updated !'
		end
	
		else
			begin
				Insert into Employees(EmployeeID, Name, Age, Department, Salary)
				values (@EmployeeID, @Name, @Age, @Department, @Salary);
	
				print 'EmployeeID is not exist. So, New Data Inserted !'
			end
	
	end


--Excecute
Exec SP_InsertOrUpdateEmployees
@EmployeeID = 1, 
@Name = 'Prachi',
@Age = 24, 
@Department = 'IT', 
@Salary = 25000;
