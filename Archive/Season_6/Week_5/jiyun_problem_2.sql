WITH T1 AS (
    SELECT T.id, client_id, driver_id, status, request_at
    FROM Trips T 
        JOIN Users C ON T.client_id = C.users_id
        JOIN Users D ON T.driver_id = D.users_id
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
        AND C.banned = 'No'
        AND D.banned = 'No'
)

SELECT 
    DISTINCT request_at AS Day
    , ROUND(cancel / cnt, 2) AS 'Cancellation Rate'
FROM (
    SELECT
        request_at
        , SUM(CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END) OVER (PARTITION BY request_at) AS cancel
        , COUNT(*) OVER (PARTITION BY request_at) AS cnt
    FROM T1
) T2
