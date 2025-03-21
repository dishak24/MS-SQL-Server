					
					---------------- Trigger -----------------------------

-------------------------------------------------------------------------------------------------------------------

--Appling trigger on Students Tables
	Select * from Students;

--Creating a Log table for Students Tables
	Create table StudentsLog
	(
		LogId int identity,
		StudentName varchar(25),
		Address varchar(25),
		Contact varchar(15),
		Operation varchar(25),
		Date_Time DateTime,
	);

--Display Records in StudentsLog
	select * from StudentsLog;

------------------------------------------------------------------------------------------------------------------
			-- AFTER INSERT --									

--Creating a Trigger for Inserting row
	Create Trigger InsertStudentTRG
	on Students
	After Insert 
	as
	Begin
		Insert into StudentsLog(StudentName, Address, Contact, Operation , Date_Time)
		Select t.Stud_Name, t.Stud_Address, t.Phone, 'Insertion', GETDATE() from Inserted t;
	End;

--Now, we inserting records in Student Table
	Insert into Students (Roll_no, Stud_Name, Stud_Address, Phone, Age) 
	values (27, 'Juee', 'Latur', '7089564534', 23);

	Insert into Students (Roll_no, Stud_Name, Stud_Address, Phone, Age) 
	values (12, 'Jaee', 'Nagpur', '8989564534', 20);

--after insertion it shows the
	--		(1 row affected)
	--		(1 row affected)

-- Altering Trigger
	--Creating a Trigger for Inserting row
	Alter Trigger InsertStudentTRG
	on Students
	After Insert 
	as
	Begin
		Set Nocount on; -- Suppresses "rows affected" messages to improve performance
		Insert into StudentsLog(StudentName, Address, Contact, Operation , Date_Time)
		Select t.Stud_Name, t.Stud_Address, t.Phone, 'Insertion', GETDATE() from Inserted t;
	End;

--Now, we inserting records in Student Table
	Insert into Students (Roll_no, Stud_Name, Stud_Address, Phone, Age) 
	values (9, 'Riya', 'Latur', 'XXXXXXXXXX', 19);

	Insert into Students (Roll_no, Stud_Name, Stud_Address, Phone, Age) 
	values (10, 'Dwarka', 'Andura', 'XXXXXXXXXX', 20);

----after insertion it shows the
	--		(1 row affected) -- only once

------------------------------------------------------------------------------------------------------------------

				-- AFTER UPDATE --
	
--Creating after update Trigger
	Create Trigger UpdateStudentTGR
	on Students
	After Update
	as
	Begin
		Set NoCount on;
		Insert into StudentsLog(StudentName, Address, Contact, Operation , Date_Time)
		Select t.Stud_Name, t.Stud_Address, t.Phone, 'Update', GETDATE() from Inserted t;
	End;

-- Updating record
	Update Students
	set Stud_Address ='Pune'
	where Roll_no = 1;

--Display Records in StudentsLog
	select * from StudentsLog;

------------------------------------------------------------------------------------------------------------------

				-- AFTER DELETE --
	
--Creating after update Trigger
	Create Trigger DeleteStudentTGR
	on Students
	After Delete
	as
	Begin
		Set NoCount on;
		Insert into StudentsLog(StudentName, Address, Contact, Operation , Date_Time)
		Select t.Stud_Name, t.Stud_Address, t.Phone, 'Delete', GETDATE() from deleted t;
	End;

-- Deleting record
	Delete from Students
	where Roll_no = 2;

	Delete from Students
	where Phone = 'XXXXXXXXXX';

--Display Records in StudentsLog
	select * from StudentsLog;


-- Drop Trigger
	Drop Trigger DeleteStudentTGR;

-------------------------------------------------------------------------------------------------
