-- https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true

SELECT SUM(a.POPULATION)
FROM CITY a
JOIN COUNTRY b on a.CountryCode = b.Code
WHERE b.CONTINENT = 'Asia'
