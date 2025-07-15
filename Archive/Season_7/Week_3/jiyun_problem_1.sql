WITH T1 AS (
    SELECT
        id
        , LEAD(id, 1) OVER (ORDER BY id) AS next_id
        , LEAD(id, 2) OVER (ORDER BY id) AS next_id2
        , visit_date
        , people
    FROM Stadium
    WHERE people >= 100
),

    T2 AS (
    SELECT *
    FROM T1
    WHERE next_id = id + 1 AND next_id2 = id + 2
)

SELECT DISTINCT T1.id, T1.visit_date, T1.people
FROM T1
JOIN T2 ON T1.id = T2.id
        OR T1.id = T2.next_id
        OR T1.id = T2.next_id2
