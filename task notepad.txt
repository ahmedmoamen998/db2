--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).

CREATE TABLE Employees(
	ID INT not null ,
	Name char(30),
salary decimal(10,2)
)


--Add a new column named "Department" to the "Employees" table with data type varchar(50).

alter table Employees 
add Department varchar(50)

--Remove the "Salary" column from the "Employees" table.

ALTER TABLE Employees
DROP COLUMN Salary;

--Rename the "Department" column in the "Employees" table to "DeptName".

EXEC sp_rename 'Employees.Department', 'DeptName';
--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).

CREATE TABLE  Projects(
	ProjectID INT ,
	ProjectName char(30)
)

--Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE Employees
ADD PRIMARY KEY(ID);
--Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
alter table Employees 
add constraint fk foreign key (ID) REFERENCES Projects(ProjectID)
	
--Remove the foreign key relationship between "Employees" and "Projects."
alter table Employees 
drop constraint fk
	 
--Add a unique constraint to the "Name" column in the "Employees" table.

alter table Employees add constraint unique_nameemp unique(Name)

--Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).

CREATE TABLE  Customers(
	CustomerID INT not null ,
	FirstName char(30),
	LastName char(30),
Email char(300),
Status char(300),
)
--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table Customers add constraint unique_namecustomer unique (FirstName,LastName)
--Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
ALTER TABLE Customers
ADD CONSTRAINT Status_defualt
DEFAULT 'Active' FOR Status;

--Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE  Orders(
	OrderID INT ,
	CustomerID INT,
	 OrderDate datetime ,
TotalAmount decimal(10,2)

)
--Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.

ALTER TABLE Orders
ADD CONSTRAINT TotalAmount_oreders 
check(TotalAmount>0) 

-- for if we want to drop constraint 
ALTER TABLE Orders
drop CONSTRAINT TotalAmount_oreders 
--Create a schema named "Sales" and move the "Orders" table into this schema.
create schema sales 
go 
ALTER SCHEMA sales TRANSFER OBJECT::dbo.orders;  
--Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'sales.Orders', 'SalesOrders'
