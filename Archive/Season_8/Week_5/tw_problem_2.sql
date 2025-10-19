-- 일주일 뒤 날짜만 어떻게 조회해야 하는지를 몰라서 헤맸음
-- DATE_ADD 로 최소 날짜 ~ +6일 간격을 셀프로 만들어줘야 함
WITH base AS (
    SELECT 
        visited_on,
        SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
), solution AS (
    SELECT
        visited_on,
        SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
    FROM base
)

SELECT *
FROM solution
WHERE visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
    FROM customer
)
