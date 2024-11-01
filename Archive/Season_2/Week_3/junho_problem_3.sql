-- (https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true)

SELECT SUM(ci.population)
FROM CITY AS ci
JOIN COUNTRY as co
ON ci.countrycode = co.code
GROUP BY continent
HAVING continent = 'Asia'
