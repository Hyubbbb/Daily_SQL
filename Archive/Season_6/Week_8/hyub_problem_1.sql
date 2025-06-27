-- https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&envId=top-sql-50
WITH CTE AS (
SELECT
    id,
    num,
    LAG(num,1) OVER (ORDER BY id ASC) AS lag_num1,
    LAG(num,2) OVER (ORDER BY id ASC) AS lag_num2
FROM Logs
)
SELECT DISTINCT
    num AS ConsecutiveNums
FROM CTE
WHERE 1=1
    AND num = lag_num1
    AND num = lag_num2
