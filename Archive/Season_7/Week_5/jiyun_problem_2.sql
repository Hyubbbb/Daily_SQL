SELECT MAX(num) AS num 
FROM (
    SELECT num, COUNT(num) AS cnt
    FROM MyNumbers
    GROUP BY num HAVING cnt = 1
) T1
