/* leetcode Medium 한 번 더 풀기
1321. Restaurant Growth
https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50 */

WITH CTE AS (
    SELECT visited_on, 
        SUM(AMOUNT) AS amount
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
)

SELECT visited_on, 
    SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount,
    ROUND(SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) / 7, 2) as average_amount
FROM CTE
ORDER BY visited_on
OFFSET 6


