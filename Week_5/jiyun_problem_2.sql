WITH MIN_LAT AS (
    SELECT CITY, LONG_W FROM STATION
    WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION
                    WHERE LAT_N > 38.7780))
    
SELECT ROUND(LONG_W, 4)
FROM MIN_LAT;