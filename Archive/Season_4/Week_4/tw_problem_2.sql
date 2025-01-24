-- 무한 JOIN에 빠져..
-- 더 간단히 풀 방법?
SELECT
    c.company_code, c.founder, COUNT(DISTINCT l.lead_manager_code) AS total_lead_managers,
    COUNT(DISTINCT s.senior_manager_code) AS total_senior_managers,
    COUNT(DISTINCT m.manager_code) AS total_managers,
    COUNT(DISTINCT e.employee_code) AS total_employees
FROM Company c
LEFT JOIN Lead_Manager l ON c.company_code = l.company_code
LEFT JOIN Senior_Manager s ON l.lead_manager_code = s.lead_manager_code AND c.company_code = s.company_code
LEFT JOIN Manager m ON s.senior_manager_code = m.senior_manager_code AND c.company_code = m.company_code
LEFT JOIN Employee e ON m.manager_code = e.manager_code AND c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code
