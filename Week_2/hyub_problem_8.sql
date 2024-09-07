-- https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true
SELECT CONCAT(NAME, '(', LEFT(OCCUPATION, 1),')')
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(OCCUPATION),'s.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(*), OCCUPATION;
