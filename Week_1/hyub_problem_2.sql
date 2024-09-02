-- https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA'
    AND POPULATION > 120000
