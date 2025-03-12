CREATE TABLE Employee
		   (Emp_NO int NOT NULL primary key,
			Emp_Name varchar(25),
			Job varchar(9),
			Manager int,
			Hiredate date,
			Salary decimal(7, 2),
			Commision decimal(7, 2),
			Dept_No int);

INSERT INTO Employee VALUES(7369, 'SMITH',  'CLERK',7902, '17-DEC-1980',  800, NULL, 20);
INSERT INTO Employee VALUES(7499, 'ALLEN', 'SALESMAN',7698, '20-FEB-1981', 1600,  300, 30);
INSERT INTO Employee VALUES(7521, 'WARD',   'SALESMAN',7698,'22-FEB-1981',1250,  500, 30);
INSERT INTO Employee VALUES(7566, 'JONES',  'MANAGER', 7839,'2-APR-1981', 2975, NULL, 20);
INSERT INTO Employee VALUES(7654, 'MARTIN', 'SALESMAN', 7698,'28-SEP-1981',1250, 1400, 30);
INSERT INTO Employee VALUES(7698, 'BLAKE',  'MANAGER',7839, '1-MAY-1981',2850, NULL, 30);
INSERT INTO Employee VALUES(7782, 'CLARK',  'MANAGER', 7839,'9-JUN-1981',2450, NULL, 10);
INSERT INTO Employee VALUES(7788, 'SCOTT',  'ANALYST',7566,'09-DEC-1982',3000, NULL, 20);
INSERT INTO Employee VALUES(7839, 'KING',   'PRESIDENT', NULL,'17-NOV-1981',5000, NULL, 10);
INSERT INTO Employee VALUES(7844, 'TURNER', 'SALESMAN',7698,'8-SEP-1981', 1500,  0, 30);
INSERT INTO Employee VALUES(7876, 'ADAMS',  'CLERK', 7788,'12-JAN-1983', 1100, NULL, 20);
INSERT INTO Employee VALUES(7900, 'JAMES',  'CLERK', 7698,'3-DEC-1981', 950, NULL, 30);
INSERT INTO Employee VALUES(7902, 'FORD',   'ANALYST', 7566,'3-DEC-1981', 000, NULL, 20);
INSERT INTO Employee VALUES(7934, 'MILLER', 'CLERK', 7782,'23-JAN-1982', 1300, NULL, 10);

----------------------------------------------------------------------------------------------------------
-- Display specific columns
	select Emp_Name, Job, Salary from Employee;

-- Display all records
	Select * from employee;

--display only records whose matches condition
	Select * from Employee
	where Salary < 1000;

-- Sorting rows using the ORDER BY clause
	Select * from Employee
	where Job = 'MANAGER'
	ORDER BY Salary;	--by default Ascending

	--OR--

	Select * from Employee
	where Job = 'MANAGER'
	ORDER BY Salary ASC;	



-- Sorting rows in Descending order,
	Select * from Employee
	where Job = 'MANAGER'
	ORDER BY Salary DESC;