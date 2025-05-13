SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT
        num
        , LAG(num, 1) OVER (ORDER BY id) AS num2
        , LAG(num, 2) OVER (ORDER BY id) AS num3
    FROM Logs
) TMP
WHERE num = num2 and num2 = num3 and num = num3
