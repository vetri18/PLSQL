CREATE TABLE department(
    DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(20)
);

select * from department

insert into  department values ('31', 'Sales');
insert into  department values ('33', 'Engineering');
insert into  department values ('34', 'Clerical');
insert into  department values ('35', 'Marketing');
--------
CREATE TABLE employee (
    LastName VARCHAR(20),
    DepartmentID INT REFERENCES department(DepartmentID)
);
insert into  employee values ('Rafferty', '31');
insert into  employee values ('Jones', '33');
insert into  employee values ('Heisenberg', '33');
insert into  employee values ('Robinson', '34');
insert into  employee values ('Smith', '34');
insert into  employee values ('Williams', NULL);

select * from employee


SELECT employee.LastName, employee.DepartmentID, department.DepartmentName 
FROM employee 
INNER JOIN department ON
employee.DepartmentID = department.DepartmentID;

==============
SELECT employee.LastName, employee.DepartmentID, department.DepartmentName 
FROM employee, department
WHERE employee.DepartmentID = department.DepartmentID;

=======================
SELECT employee.LastName, employee.DepartmentID, department.DepartmentName
FROM employee
LEFT OUTER JOIN department ON employee.DepartmentID = department.DepartmentID;
============
SELECT employee.LastName, employee.DepartmentID, department.DepartmentName
FROM employee
INNER JOIN department ON employee.DepartmentID = department.DepartmentID

UNION ALL

SELECT employee.LastName, employee.DepartmentID, cast(NULL as varchar(20))
FROM employee
WHERE NOT EXISTS (
    SELECT * FROM department
             WHERE employee.DepartmentID = department.DepartmentID)