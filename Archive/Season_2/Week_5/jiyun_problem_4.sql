SELECT ROUND(LAT_N, 4)
FROM (
    SELECT LAT_N, PERCENT_RANK() OVER (ORDER BY LAT_N) AS percentrank
    FROM STATION) A
WHERE percentrank = 0.5;