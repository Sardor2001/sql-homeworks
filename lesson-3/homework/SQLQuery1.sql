WITH RankedEmployees AS (
    -- Rank employees based on salary in descending order
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Salary,
        PERCENT_RANK() OVER (ORDER BY Salary DESC) AS PercentRank
    FROM Employees
),
Top10Percent AS (
    -- Select only the top 10% highest-paid employees
    SELECT * 
    FROM RankedEmployees
    WHERE PercentRank <= 0.10
),
DepartmentSummary AS (
    -- Group employees by department and calculate average salary
    SELECT
        Department,
        AVG(Salary) AS AverageSalary,
        Salary,
        CASE 
            WHEN Salary > 80000 THEN 'High'
            WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
            ELSE 'Low'
        END AS SalaryCategory
    FROM Top10Percent
    GROUP BY Department, Salary
)
SELECT Department, AverageSalary, Salary, SalaryCategory
FROM DepartmentSummary
ORDER BY AverageSalary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY; 