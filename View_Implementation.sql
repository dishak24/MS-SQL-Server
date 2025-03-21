

				----------------------------[ Views ]------------------------
	/*
	A view is a named query stored in the database catalog that allows you to refer to it later.
	*/

--Existing table
	select * from Employee;

--Create view on Employee table with all data
	Create View view_Employees
	as
	select * from Employee; -- stores as its data of Employee table into view_Employees view 

--Display view
	select * from view_Employees;

--Alter View
	Alter View view_Employees
	as
	select * from Employee
	where Commision is not Null; 

--Inserting values in View
	Insert into view_Employees values(1000, 'Dan', 'Engineer', 7566, '2023-12-17', 1600, Null, 20); -- Its adding but not display because of not null condition in View creation

	Insert into view_Employees values(1002, 'Dan', 'Engineer', 7566, '2023-12-17', 1600, 500, 20);-- Its adding and also display.
	
-- Delete record from view
	Delete from view_Employees
	where Emp_NO = 7844; -- delete specific data

--Update View
	Update view_Employees
	set Job = 'Cleark'
	where Emp_Name = 'Ward';

--In previous view it inserting null data. but it cant display null record. So, there is no meaning to inserting such data.
--[with check option]- It doesn't insert not null data.It check the condition while inserting null data. 
	
	Create View view_EmployeesOnlyNotNull
	as
	select * from Employee
	where Commision is not Null
	with check option;

--now, to verify trying to insert null data 
	Insert into view_EmployeesOnlyNotNull 
	values(1003, 'Dan', 'Engineer', 7566, '2023-12-17', 1600, Null, 20); -- Error 

	Insert into view_Employees 
	values(1003, 'Dia', 'HR', 7566, '2023-12-17', 1600, 500, 20);-- Done(Nom Error) 

-- View with Schema Binding: To binding columns with view,Hence we cannot update or deelete these columns
	Create view View_EmpSchemaBinding
	with SchemaBinding
	as 
	select Emp_NO, Emp_Name, Salary from dbo.Employee; -- here we, binding Emp_NO, Emp_Name, Job, Salary columns of Emplyee
														-- table with View_EmpSchemaBinding

-- to verify Schema Binding, we trying to delete column job
	Alter table Employee
	Drop column Salary;--failed because one or more objects access this column

-- To drop view
	drop view View_EmpSchemaBinding