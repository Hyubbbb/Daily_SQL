WITH RECURSIVE Numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers
    WHERE num < 1000
),
PRIME AS (
    SELECT num
    FROM Numbers n
    WHERE NOT EXISTS (
        SELECT *
        FROM Numbers n2
        WHERE n2.num < n.num AND n.num % n2.num = 0
    )
)

SELECT GROUP_CONCAT(num SEPARATOR '&') AS PRIMES
FROM PRIME;
