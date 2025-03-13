/* leetcode Medium 한 번 더 풀기
570. Managers with at Least 5 Direct Reports
https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT e1.name
FROM Employee as e1
JOIN Employee as e2
    ON e1.id = e2.managerId
GROUP BY e1.id, e1.name
HAVING COUNT(e2.managerId) >= 5

/* 새로운 풀이
SELECT e2.name
FROM employee as e2
WHERE e2.id IN (
    SELECT e1.managerId
    FROM employee as e1
    GROUP BY e1.managerId
    HAVING COUNT(e1.managerId) >= 5
) */