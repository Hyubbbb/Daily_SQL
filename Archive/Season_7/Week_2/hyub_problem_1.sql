-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/?envType=study-plan-v2&envId=top-sql-50
WITH CTE AS (
    SELECT
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS totalWeight
    FROM Queue
    ORDER BY turn
)
SELECT 
    person_name
FROM CTE
WHERE totalWeight <= 1000
ORDER BY totalWeight DESC
LIMIT 1
