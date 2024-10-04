/* HackerRank Population Census
https://www.hackerrank.com/challenges/asian-population/submissions/code/318922932 */

SELECT SUM(C.POPULATION)
FROM CITY AS C
JOIN COUNTRY AS CC
ON C.COUNTRYCODE = CC.CODE
WHERE CC.CONTINENT = "ASIA"