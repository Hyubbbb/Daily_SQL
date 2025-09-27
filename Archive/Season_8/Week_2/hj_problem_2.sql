-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true
SELECT 
    salary * months AS total_earning,
    COUNT(*) AS num_max
FROM employee
GROUP BY total_earning
ORDER BY total_earning DESC
LIMIT 1;