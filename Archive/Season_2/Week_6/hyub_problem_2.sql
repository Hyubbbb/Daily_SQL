-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true

SELECT b.CONTINENT, TRUNCATE(AVG(a.POPULATION), 0)
FROM CITY a
JOIN COUNTRY b on a.CountryCode = b.Code
GROUP BY b.CONTINENT
