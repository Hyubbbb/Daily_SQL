-- https://leetcode.com/problems/second-highest-salary/?envType=study-plan-v2&envId=top-sql-50
SELECT
    MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE 1=1
    AND salary != (SELECT MAX(salary) FROM Employee)
