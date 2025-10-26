WITH base as (
    SELECT
        requester_id as id
    FROM RequestAccepted 
    UNION ALL
    SELECT
        accepter_id as id
    FROM RequestAccepted
)

SELECT
    id,
    COUNT(*) AS num
FROM base
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
