SELECT ROUND(SUM_LAT, 4)
FROM (SELECT SUM(LAT_N) AS SUM_LAT FROM STATION
        WHERE LAT_N BETWEEN 38.7880 AND 137.2345 ) A
