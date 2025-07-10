WITH T1 AS (
    SELECT requester_id AS id, COUNT(requester_id) AS cnt
    FROM RequestAccepted
    GROUP BY requester_id

    UNION ALL

    SELECT accepter_id AS id, COUNT(accepter_id) AS cnt
    FROM RequestAccepted
    GROUP BY accepter_id
)

SELECT *
FROM (
    SELECT id, SUM(cnt) AS num
    FROM T1
    GROUP BY id
    ORDER BY num DESC
) T2
LIMIT 1
