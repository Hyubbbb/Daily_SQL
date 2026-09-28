SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM company AS c
    LEFT JOIN Lead_Manager AS lm
        ON c.company_code = lm.company_code
    LEFT JOIN Senior_Manager AS sm
        ON c.company_code = sm.company_code
    LEFT JOIN Manager AS m
        ON c.company_code = m.company_code
    LEFT JOIN Employee AS e
        ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code