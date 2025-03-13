/*
	-----JOINS-----
*/

--Student table
	Create table Students
	(
		Roll_no int primary key,
		Stud_Name varchar(20) not null,
		Stud_Address varchar(30) not null,
		Phone varchar(12) not null,
		Age int check(Age >= 18)-- for validating age
	);

--Inserting values in Student table
	INSERT INTO Students (Roll_no, Stud_Name, Stud_Address, Phone, Age)
	VALUES
		(1, 'HARSH', 'DELHI', 'XXXXXXXXXX', 18),
		(2, 'PRATIK', 'BIHAR', 'XXXXXXXXXX', 19),
		(3, 'RIYANKA', 'SILIGURI', 'XXXXXXXXXX', 20),
		(4, 'DEEP', 'RAMNAGAR', 'XXXXXXXXXX', 18),
		(5, 'SAPTARHI', 'KOLKATA', 'XXXXXXXXXX', 19),
		(6, 'DHANRAJ', 'BARABAJAR', 'XXXXXXXXXX', 20),
		(7, 'ROHIT', 'BALURGHAT', 'XXXXXXXXXX', 18),
		(8, 'NIRAJ', 'ALIPUR', 'XXXXXXXXXX', 19);

--Display Student Table
	select * from Students;

-- Student Course Table
	Create table StudentCourse
	(
		course_id int,
		roll_no int,
		--Foreign key (roll_no) References Students(Roll_no) 
		--on update cascade --ensures that when a record in the parent table (Students) is updated, all corresponding records in the child table (StudentCourse) are automatically updated.
		--on delete cascade --ensures that when a record in the parent table (Students) is deleted, all corresponding records in the child table (StudentCourse) are automatically deleted.
	);
	
-- Inserting data in StudentCourse Table
	INSERT INTO StudentCourse (course_id, roll_no)
	VALUES	(1, 1),
			(2, 2),
			(2, 3),
			(3, 4),
			(1, 5),
			(4, 9),
			(5, 10),
			(4, 11);

-- Display StudentCourse Table
	select * from StudentCourse;
------------------------------------------------------------------------------------------------------
							--- INNER JOIN (Common data) ---

-- Display those roll no & name of students whose common in StudentCouse table 
	Select s.Roll_no, s.Stud_Name, c.course_id 
	from Students as s
	Inner join 	StudentCourse as c
	On s.Roll_no = c.roll_no;

-- Display all data of students whose common in StudentCouse table 
	Select * from Students as s
	Inner Join 	StudentCourse as c
	On s.Roll_no = c.roll_no;

-------------------------------------------------------------------------------------------------------
							--- Left Outer JOIN (NULL in Right Table) ---

--It retrieves all rows from the Student table and the matching rows from the StudentCourse table based on the ROLL_NO column. 
--For non-matching row in Right table(StudentCourse) it gives NULL.

	Select  s.Roll_no, s.Stud_Name, c.course_id
	from Students s
	Left Join StudentCourse c
	On s.Roll_no = c.roll_no;


	Select  * from Students s
	Left Join StudentCourse c
	On s.Roll_no = c.roll_no;


-------------------------------------------------------------------------------------------------------
							--- Right Outer JOIN (NULL in Left Table) ---

--It retrieves matching rows from the Student table based on the ROLL_NO column and the all rows from the StudentCourse table . 
--For non-matching row in Left table(Student) it gives NULL.

	Select  s.Roll_no, s.Stud_Name, c.course_id
	from Students s
	Right Join StudentCourse c
	On s.Roll_no = c.roll_no;


	Select  * from Students s
	Right Join StudentCourse c
	On s.Roll_no = c.roll_no;
	
-------------------------------------------------------------------------------------------------
							--- FULL Outer JOIN (NULL in Both Table) ---
/*
 It combines the results of both LEFT JOIN and RIGHT JOIN. 
 The query retrieves all rows from the Student and StudentCourse tables. 
 If a record in one table does not have a matching record in the other table, 
 the result set will include that record with NULL values for the missing fields.
*/

	Select  s.Roll_no, s.Stud_Name, c.course_id
	from Students s
	Full Join StudentCourse c
	On s.Roll_no = c.roll_no;


	Select  * from Students s
	Full Join StudentCourse c
	On s.Roll_no = c.roll_no;

-------------------------------------------------------------------------------------------------
							--- CROSS JOIN (Cartesian product)---

--Each row from Table-1 (Students) is combined with each row from Table-2 (StudentCourse).

	Select  s.Roll_no, s.Stud_Name, c.course_id
	from Students s
	Cross Join StudentCourse c;


	Select  * from Students s
	Cross Join StudentCourse c;

----------------------------------------------------------------------------------------------------
								--- SELF JOIN (Join with itself)---

	Select s1.Stud_Name, s1.Age , s2.Stud_Name
	from Students s1
	join Students s2
	ON s1.Age = s2.Age
	AND S1.Roll_no <> S2.Roll_no; --Excludes self-matching rows, so a student is not matched with themselves.

	/*
	 <> this means "not equal to"
	*/

-------------------------------------------------------------------------------------------------------