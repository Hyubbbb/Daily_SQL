-- https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true

SELECT DISTINCT a.X, a.Y
FROM (
        SELECT ROW_NUMBER() OVER () AS RNUM, 
                X, Y
        FROM FUNCTIONS) a
JOIN (
        SELECT ROW_NUMBER() OVER () AS RNUM,
                X, Y
        FROM FUNCTIONS) b on a.X = b.Y AND a.Y = b.X AND a.RNUM != b.RNUM
WHERE a.X <= a.Y
ORDER BY a.X
