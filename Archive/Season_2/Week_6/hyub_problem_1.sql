-- https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true

SELECT a.NAME
FROM CITY a
JOIN COUNTRY b on a.CountryCode = b.Code
WHERE b.CONTINENT = 'Africa'
