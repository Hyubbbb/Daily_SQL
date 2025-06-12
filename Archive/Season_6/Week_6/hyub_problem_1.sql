-- https://leetcode.com/problems/biggest-single-number/?envType=study-plan-v2&envId=top-sql-50

WITH cte_num AS (
    SELECT
        num
    FROM MyNumbers
    GROUP BY num
        HAVING COUNT(*) = 1
)
SELECT
    MAX(num) AS num
FROM cte_num
