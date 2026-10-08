WITH lm AS (
    SELECT 
        company_code, 
        COUNT(DISTINCT lead_manager_code) AS cnt
    FROM lead_manager
    GROUP BY company_code
),
     sm AS (
     SELECT 
         company_code, 
         COUNT(DISTINCT senior_manager_code) AS cnt
     FROM senior_manager
     GROUP BY company_code
),
     m AS (
     SELECT 
         company_code, 
         COUNT(DISTINCT manager_code) AS cnt
     FROM manager
     GROUP BY company_code
),
     e AS (
     SELECT 
         company_code, 
         COUNT(DISTINCT employee_code) AS cnt
     FROM employee
     GROUP BY company_code
)
SELECT
    c.company_code,
    c.founder,
    COALESCE(lm.cnt, 0) AS lead_managers,
    COALESCE(sm.cnt, 0) AS senior_managers,
    COALESCE(m.cnt, 0)  AS managers,
    COALESCE(e.cnt, 0)  AS employees
FROM company AS c
LEFT JOIN lm ON c.company_code = lm.company_code
LEFT JOIN sm ON c.company_code = sm.company_code
LEFT JOIN m  ON c.company_code = m.company_code
LEFT JOIN e  ON c.company_code = e.company_code
ORDER BY c.company_code;
