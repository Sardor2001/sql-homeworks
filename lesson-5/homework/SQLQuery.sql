-- 1. Assign a Unique Rank to Each Employee Based on Salary
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    ROW_NUMBER() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- 2. Find Employees Who Have the Same Salary Rank
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- 3. Identify the Top 2 Highest Salaries in Each Department
WITH DepartmentRanked AS (
    SELECT 
        EmployeeID,
        Name,
        Department,
        Salary,
        ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT EmployeeID, Name, Department, Salary
FROM DepartmentRanked
WHERE SalaryRank <= 2; -- Top 2 salaries in each department

-- 4. Find the Lowest-Paid Employee in Each Department
SELECT DISTINCT
    Department,
    FIRST_VALUE(Name) OVER (PARTITION BY Department ORDER BY Salary ASC) AS LowestPaidEmployee,
    FIRST_VALUE(Salary) OVER (PARTITION BY Department ORDER BY Salary ASC) AS LowestSalary
FROM Employees;

-- 5. Calculate the Running Total of Salaries in Each Department
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    SUM(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS RunningTotal
FROM Employees;

-- 6. Find the Total Salary of Each Department Without GROUP BY
SELECT 
    Department,
    SUM(Salary) OVER (PARTITION BY Department) AS TotalSalary
FROM Employees
GROUP BY Department, Salary;

-- 7. Calculate the Average Salary in Each Department Without GROUP BY
SELECT 
    Department,
    Salary,
    AVG(Salary) OVER (PARTITION BY Department) AS AverageSalary
FROM Employees;

-- 8. Find the Difference Between an Employee’s Salary and Their Department’s Average
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    Salary - AVG(Salary) OVER (PARTITION BY Department) AS SalaryDifference
FROM Employees;

-- 9. Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    AVG(Salary) OVER (
        ORDER BY Salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS MovingAverage
FROM Employees;

-- 10. Find the Sum of Salaries for the Last 3 Hired Employees
WITH RankedEmployees AS (
    SELECT 
        EmployeeID,
        Name,
        Salary,
        RANK() OVER (ORDER BY HireDate DESC) AS HireRank
    FROM Employees
)
SELECT SUM(Salary) AS SumOfLast3Salaries
FROM RankedEmployees
WHERE HireRank <= 3;

-- 11. Calculate the Running Average of Salaries Over All Previous Employees
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    AVG(Salary) OVER (
        ORDER BY HireDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningAverage
FROM Employees;

-- 12. Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    MAX(Salary) OVER (
        ORDER BY HireDate ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
    ) AS MaxSlidingWindowSalary
FROM Employees;

-- 13. Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    (Salary * 100.0) / SUM(Salary) OVER (PARTITION BY Department) AS PercentageContribution
FROM Employees;