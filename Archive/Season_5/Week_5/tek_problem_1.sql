/* leetcode Medium 한 번 더 풀기
1204. Last Person to Fit in the Bus
https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/ */

WITH CTE AS (
    SELECT *, SUM(weight) OVER (ORDER BY turn) AS sum_weight
    FROM Queue
) 

SELECT person_name
FROM CTE
WHERE sum_weight <= 1000
ORDER BY sum_weight DESC
LIMIT 1