SELECT Department, Employee, Salary
FROM (
    SELECT 
        D.name AS Department
        , E.name AS Employee
        , E.salary AS Salary
        , RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS r
    FROM Employee E
        JOIN Department D ON E.departmentId = D.id
) TMP
WHERE r = 1
