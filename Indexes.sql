										/*
											INDEX 
										*/
-------------------------------------------------------------------------------------------
/*
--->Types of Indexes in SQL Server:
	1. Clustered Index
	-A clustered index sorts and stores the data physically in the table based on the index key.
	-There can be only one clustered index per table since the data can be sorted in only one order.

	2. Non-Clustered Index
	-A non-clustered index stores pointers to the actual data instead of sorting the data itself.
	-You can create multiple non-clustered indexes on a table.
*/
			
			
			Select * from Students;
/*
			1	HARSH		DELHI		XXXXXXXXXX	18
			2	PRATIK		BIHAR		XXXXXXXXXX	19
			3	RIYANKA		SILIGURI	XXXXXXXXXX	20
			4	DEEP		RAMNAGAR	XXXXXXXXXX	18
			5	SAPTARHI	KOLKATA		XXXXXXXXXX	19
			6	DHANRAJ		BARABAJAR	XXXXXXXXXX	20
			7	ROHIT		BALURGHAT	XXXXXXXXXX	18
			8	NIRAJ		ALIPUR		XXXXXXXXXX	19
*/

-- Index creation on Students Table
	Create Index Stud_Index on Students(Roll_no); -- By default an index is nonclustered

--To check the indexes on a table:
	SELECT * FROM sys.indexes  
	WHERE object_id = OBJECT_ID('Students');

-- To drop Index
	drop index Stud_Index on students;
