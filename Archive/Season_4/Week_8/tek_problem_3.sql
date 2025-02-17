/* leetcode 176. Second Highest Salary
https://leetcode.com/problems/second-highest-salary/description/ */

WITH CTE AS (
    SELECT *, 
        DENSE_RANK() OVER (ORDER BY salary DESC) as rank
    FROM Employee
) 

SELECT (
    SELECT salary
    FROM CTE
    WHERE rank = 2
    LIMIT 1
) as SecondHighestSalary

/* OFFSET 사용한 쿼리
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) as SecondHighestSalary */