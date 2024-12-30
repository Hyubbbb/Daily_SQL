/* LeetCode 570. Managers with at Least 5 Direct Reports
https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/ */

-- SELECT e2.name
-- FROM Employee as e1
-- CROSS JOIN Employee as e2
--     ON e1.managerID = e2.id
-- GROUP BY e1.managerID
-- HAVING COUNT(e2.name) >= 5 or e2.name is null

SELECT e1.name
FROM Employee as e1
INNER JOIN Employee as e2
    ON e1.id = e2.managerId
GROUP BY e2.managerID
HAVING COUNT(e2.managerId) >= 5


