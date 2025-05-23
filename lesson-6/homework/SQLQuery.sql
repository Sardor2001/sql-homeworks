-- Step 1: Create Tables

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    EmployeeID INT NULL
);

-- Step 2: Insert Sample Data into Tables

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary)
VALUES 
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 65000),
(4, 'David', 103, 72000),
(5, 'Eva', NULL, 68000);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

INSERT INTO Projects (ProjectID, ProjectName, EmployeeID)
VALUES 
(1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NULL);

-- Step 3: Task Implementation

-- Task 1: INNER JOIN - Get a list of employees along with their department names
SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- Task 2: LEFT JOIN - List all employees, including those who are not assigned to any department
SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- Task 3: RIGHT JOIN - List all departments, including those without employees
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    e.Name AS EmployeeName
FROM Departments d
RIGHT JOIN Employees e
ON e.DepartmentID = d.DepartmentID;

-- Task 4: FULL OUTER JOIN - Retrieve all employees and all departments, even if there’s no match between them
SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    d.DepartmentID,
    d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- Task 5: JOIN with Aggregation - Find the total salary expense for each department
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    SUM(e.Salary) AS TotalSalaryExpense
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- Task 6: CROSS JOIN - Generate all possible combinations of departments and projects
SELECT 
    d.DepartmentName,
    p.ProjectName
FROM Departments d
CROSS JOIN Projects p;

-- Task 7: MULTIPLE JOINS - Get a list of employees with their department names and assigned project names, including employees without projects
SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    d.DepartmentName,
    p.ProjectName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects p
ON e.EmployeeID = p.EmployeeID;