-- https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

-- print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees
    -- Order your output by ascending company_code.

-- SELECT c.company_code, founder, 
--     -- COUNT(l.lead_manager_code)
--     l.lead_manager_code
    
-- FROM Company c
-- JOIN Lead_Manager l on c.company_code = l.company_code
-- -- JOIN Senior_Manager s on c.company_code = s.company_code

-- -- GROUP BY c.company_code, founder
-- ORDER BY c.company_code

SELECT c.company_code, c.founder,
    COUNT(DISTINCT(e.lead_manager_code)), 
    COUNT(DISTINCT(e.senior_manager_code)), 
    COUNT(DISTINCT(e.manager_code)), 
    COUNT(DISTINCT(e.employee_code))
FROM Employee e 
JOIN Company c on e.company_code = c.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code
