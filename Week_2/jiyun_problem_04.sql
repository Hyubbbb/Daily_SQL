SELECT A.company_code, founder, lead_manager, senior_manager, manager, employee
FROM COMPANY A
    JOIN (SELECT company_code, COUNT(DISTINCT lead_manager_code) AS lead_manager 
            FROM LEAD_MANAGER GROUP BY company_code) B ON A.company_code = B.company_code
    JOIN (SELECT company_code, COUNT(DISTINCT senior_manager_code) AS senior_manager 
            FROM SENIOR_MANAGER GROUP BY company_code) C ON A.company_code = C.company_code
    JOIN (SELECT company_code, COUNT(DISTINCT manager_code) AS manager 
            FROM MANAGER GROUP BY company_code) D ON A.company_code = D.company_code
    JOIN (SELECT company_code, COUNT(DISTINCT employee_code) AS employee 
            FROM EMPLOYEE GROUP BY company_code) E ON A.company_code = E.company_code
ORDER BY COMPANY_CODE
