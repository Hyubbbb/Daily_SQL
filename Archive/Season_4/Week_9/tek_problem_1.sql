/*
Leetcode 185. Department Top Three Salaries
https://leetcode.com/problems/department-top-three-salaries/description/
*/


WITH CTE AS (
    Select e.name as Employee,
        e.salary as salary,
        d.name as Department, 
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) as rank
    FROM Employee as e
    LEFT JOIN Department as d
        ON e.departmentId = d.id
)

SELECT Department, Employee, Salary
FROM CTE
WHERE rank <= 3