/* leetcode 1321. Restaurant Growth
https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50 */

WITH CTE AS (
    SELECT visited_on, 
        -- visited_on 순서대로 7일 점수 계산하기
        -- interval '6 day preceding and current row로 7일치 간격 잡아 합계 구한다
        SUM(amount) OVER (ORDER BY visited_on ASC range BETWEEN INTERVAL '6 day' PRECEDING AND CURRENT ROW) as amount
    FROM Customer
)

-- ::Decimal을 통해, 소수점 아래가 절삭되는 것 막는다
SELECT DISTINCT visited_on, amount, ROUND(amount/7 ::DECIMAL, 2) as average_amount
FROM CTE
WHERE visited_on >= (SELECT visited_on FROM Customer LIMIT 1) + 6
ORDER BY visited_on ASC