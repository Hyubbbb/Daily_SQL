-- (https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true)

SELECT salary*months AS earnings, COUNT(*)
FROM employee
GROUP BY earnings
ORDER BY earnings desc
LIMIT 1;
