WITH RECURSIVE Numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers
    WHERE num < 1000),

Prime_num AS (
SELECT num
FROM Numbers A
WHERE NOT EXISTS (SELECT 1
                FROM Numbers B
                WHERE A.num > B.num AND A.num % B.num = 0))

SELECT GROUP_CONCAT(num SEPARATOR '&')
FROM Prime_num
