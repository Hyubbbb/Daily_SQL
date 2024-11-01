-- (https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true)

SELECT id, age, coins_needed, power
FROM Wands AS w
JOIN Wands_property AS wp
ON w.code = wp.code
WHERE (age, coins_needed, power) IN (SELECT age, MIN(coins_needed), power
                                    FROM Wands AS w2
                                    JOIN Wands_property AS wp2
                                    ON w2.code = wp2.code
                                    GROUP BY age, power)
        AND is_evil = 0
ORDER BY power desc, age desc;
