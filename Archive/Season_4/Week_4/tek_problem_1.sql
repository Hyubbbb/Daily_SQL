/* 180. Consecutive Numbers
https://leetcode.com/problems/consecutive-numbers/description/ */

SELECT DISTINCT l.num as ConsecutiveNums
FROM (
    SELECT *,
        LAG(num, 1) OVER () as lag1,
        LAG(num, 2) OVER () as lag2
    FROM Logs
) as l
WHERE l.num = l.lag1
    AND l.lag1 = l.lag2
    -- AND l.num = l.lag2