--Database creation
create database Demo
use Demo

-- Table creation
create table Student
(roll_no int, 
name varchar(20),
standard varchar(20))

--display table
select * from Student

-- Inserting records
insert into Student values (1, 'Disha', 'first year')
insert into Student values (12, 'Riya', 'Second year')
insert into Student values (23, 'Pooja', 'Third year')
insert into Student values (4, 'Atharv', 'first year')
insert into Student values (15, 'Swarali', 'first year')

--Updating row
update Student
set standard = 'Final Year'
where roll_no = 1

-- Display data based on condition
select * from student where standard= 'first year'

--Sorting data based on Name
select * from Student
order by name

