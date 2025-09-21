-- https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true
SELECT 
    c.company_code, 
    c.founder, 
    COUNT(DISTINCT e.lead_manager_code) AS total_num_lm, 
    COUNT(DISTINCT e.senior_manager_code) AS total_num_sm,
    COUNT(DISTINCT e.manager_code) AS total_num_m,
    COUNT(DISTINCT e.employee_code) AS total_num_e
FROM Employee e
LEFT JOIN Company c 
    ON e.company_code = c.company_code
GROUP BY e.company_code, c.founder
ORDER BY e.company_code;