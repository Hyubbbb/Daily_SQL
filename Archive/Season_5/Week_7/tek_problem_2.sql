/*
leetcode Medium 한 번 더 풀기
176. Second Highest Salary
https://leetcode.com/problems/second-highest-salary/description/
*/

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