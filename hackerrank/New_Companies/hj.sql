SELECT
    e.company_code,
    c.founder,
    COUNT(DISTINCT lead_manager_code) AS num_lm,
    COUNT(DISTINCT senior_manager_code)AS num_sm,
    COUNT(DISTINCT manager_code)AS num_m,
    COUNT(DISTINCT employee_code) AS num_e
FROM employee AS e
    LEFT JOIN company AS c 
        ON e.company_code = c.company_code
GROUP BY e.company_code, c.founder
ORDER BY e.company_code
