/* LeetCode 197. Rising Temperature
https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT w1.id
FROM Weather as w1
LEFT JOIN Weather as w2
    ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature