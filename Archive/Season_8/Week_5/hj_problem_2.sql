-- https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true
SELECT c.Name
FROM CITY c
JOIN COUNTRY co
ON c.CountryCode = co.Code
WHERE co.Continent = 'Africa';
