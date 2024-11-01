/*
HackerRank Average Population of Each Continent
https://www.hackerrank.com/challenges/average-population-of-each-continent/submissions/code/318924000
*/

SELECT CT.CONTINENT, FLOOR(AVG(C.POPULATION))
FROM CITY AS C
    JOIN COUNTRY AS CT
    ON C.COUNTRYCODE = CT.CODE
GROUP BY CT.CONTINENT
