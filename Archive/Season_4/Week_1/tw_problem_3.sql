
SELECT CITY, LENGTH(CITY) AS LENGTH
FROM STATION
WHERE LENGTH(CITY) = (
    SELECT MIN(LENGTH(CITY))
    FROM STATION
)
ORDER BY CITY
LIMIT 1;


SELECT CITY, LENGTH(CITY) AS LENGTH
FROM STATION
WHERE LENGTH(CITY) = (
    SELECT MAX(LENGTH(CITY))
    FROM STATION
)
ORDER BY CITY
LIMIT 1;
