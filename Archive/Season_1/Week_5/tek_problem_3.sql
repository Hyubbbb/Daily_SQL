/* HackerRank New Companies
https://www.hackerrank.com/challenges/the-company/submissions/code/320074859 */

SELECT C.company_code, 
       C.founder, 
       COUNT(DISTINCT E.lead_manager_code), 
       COUNT(DISTINCT E.senior_manager_code),
       COUNT(DISTINCT E.manager_code),
       COUNT(DISTINCT E.employee_code)
FROM Company as C
    INNER JOIN Employee as E
    ON C.company_code = E.company_code
GROUP BY C.company_code, C.founder