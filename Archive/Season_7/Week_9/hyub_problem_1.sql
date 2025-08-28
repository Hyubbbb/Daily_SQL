-- https://leetcode.com/problems/department-top-three-salaries/?envType=study-plan-v2&envId=top-sql-50

WITH t_salary_rank AS (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
    FROM Employee
)
SELECT
    d.name AS Department,
    t.name AS Employee,
    t.salary AS Salary
FROM t_salary_rank AS t
JOIN Department AS d
    ON t.departmentId = d.id
WHERE salary_rank <= 3
