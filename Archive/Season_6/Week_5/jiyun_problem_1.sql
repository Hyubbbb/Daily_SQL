SELECT Department, Employee, Salary
FROM (
    SELECT 
        D.name AS Department
        , E.name AS Employee
        , salary AS Salary
        , DENSE_RANK() OVER (PARTITION BY D.name ORDER BY salary DESC) AS rn
    FROM Employee E
        JOIN Department D ON E.departmentId = D.id
) TMP
WHERE rn <= 3
