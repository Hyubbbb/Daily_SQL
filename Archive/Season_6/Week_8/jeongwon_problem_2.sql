-- 184. Department Highest Salary
-- https://leetcode.com/problems/department-highest-salary/

SELECT
  d.name AS Department,
  e.name AS Employee,
  e.salary AS Salary
FROM (
  SELECT *,
         RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
  FROM Employee
) e
JOIN Department d ON e.departmentId = d.id
WHERE e.rnk = 1;
