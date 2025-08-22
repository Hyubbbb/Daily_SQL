-- https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true
SELECT CONCAT(NAME, '(', SUBSTR(OCCUPATION, 1, 1), ')' )AS NAMES 
FROM OCCUPATIONS
ORDER BY NAMES ASC;

SELECT CONCAT('There are a total of ',count(occupation), ' ', LOWER(OCCUPATION), 's.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION);