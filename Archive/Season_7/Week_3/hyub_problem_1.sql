-- https://leetcode.com/problems/exchange-seats/?envType=study-plan-v2&envId=top-sql-50
SELECT
    CASE
    WHEN s1.id % 2 = 1 AND s2.id IS NOT NULL THEN s1.id + 1
    WHEN s1.id % 2 = 0 THEN s1.id - 1
    ELSE s1.id
    END AS id,
    s1.student
FROM Seat s1
LEFT JOIN Seat s2
    ON s1.id + 1 = s2.id
ORDER BY id
