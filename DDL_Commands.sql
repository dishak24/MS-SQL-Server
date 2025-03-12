--Database creation
	create database BridgeLabz
	use BridgeLabz
-----------------------------------------------------------------------------------------------------------
-- Table creation
	CREATE TABLE Emp
		   (Emp_NO int NOT NULL primary key,
			Emp_Name varchar(25),
			Job varchar(9),
			Manager int,
			Hiredate date,
			Salary decimal(7, 2),
			Commision decimal(7, 2),
			Dept_No int);
-----------------------------------------------------------------------------------------------------------

-- display table structure in MS SQL server
	sp_help employee;

-----------------------------------------------------------------------------------------------------------

-- Rename table name
	sp_rename emp, Employee

----------------------------------------------------------------------------------------------------------
--->> ALTER: used to change the structure of table

-- Alter column data type
	Alter table Employee
	Alter column Salary money;

--alter column with not null
	Alter table Employee
	Alter column Job varchar(20) not null;

-- adding new column
	Alter table employee
	ADD DOB date;

-- -- deleting a column
	Alter table employee
	DROP column DOB;

-----------------------------------------------------------------------------------------------------------
--->>> TRUNCATE: used to remove all records from table

	Truncate table employee;

-----------------------------------------------------------------------------------------------------------
	
-- Drop table: used to delete an existing table
	DROP Table Employee;

