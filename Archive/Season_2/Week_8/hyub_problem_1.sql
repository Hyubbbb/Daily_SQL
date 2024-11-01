-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true

SELECT ww.ID, 
    tmp.AGE,
    tmp.min_CN,
    tmp.POWER
FROM WANDS ww
RIGHT JOIN 
    (SELECT 
       -- w.ID AS ID, 
       -- w.COINS_NEEDED AS CN, 
       w.POWER AS POWER, 
       p.CODE AS CODE, 
       p.AGE AS AGE,
       MIN(w.COINS_NEEDED) AS min_CN

    FROM WANDS w
        LEFT JOIN WANDS_PROPERTY p on w.CODE = p.CODE
    WHERE p.IS_EVIL = 0 -- non-evil

    GROUP BY w.POWER, p.CODE, p.AGE) AS TMP on ww.CODE = tmp.CODE AND ww.COINS_NEEDED = tmp.min_CN

ORDER BY tmp.POWER DESC, tmp.AGE DESC
