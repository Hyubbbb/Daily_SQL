/* leetcode Medium 한 번 더 풀기
180. Consecutive Numbers
https://leetcode.com/problems/consecutive-numbers/description/ */


SELECT DISTINCT l.num as ConsecutiveNums
FROM (
    SELECT *, 
        LAG(num, 1) OVER () AS lagged, 
        LEAD(num, 1) OVER () AS led
    FROM Logs
    ORDER BY id
) as l
WHERE l.num = l.lagged AND l.num = l.led