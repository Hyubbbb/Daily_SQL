SELECT ROUND(MAX_LAT, 4)
FROM (SELECT MAX(LAT_N) AS MAX_LAT FROM STATION WHERE LAT_N < 137.2345) A
