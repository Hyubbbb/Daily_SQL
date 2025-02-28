/*
Leetcode 184. Department Highest Salary
https://leetcode.com/problems/department-highest-salary/description/
*/

SELECT Department, Employee, Salary
FROM (
    SELECT e.name as Employee,
        e.salary as Salary,
        d.name as Department,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) as rank
    FROM Employee as e
    JOIN Department as d
        ON e.departmentID = d.id
) as CTE
WHERE rank = 1