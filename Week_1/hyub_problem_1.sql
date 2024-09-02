-- https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
SELECT *
FROM CITY
WHERE POPULATION > 100000
    AND COUNTRYCODE = 'USA'
