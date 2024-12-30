/* LeetCode 1211. Queries Quality and Percentage
https://leetcode.com/problems/queries-quality-and-percentage/submissions/1475259460/?envType=study-plan-v2&envId=top-sql-50 */


SELECT q.query_name, 
    ROUND(AVG(q.rating / q.position), 2) as quality,
    ROUND(SUM(
        CASE WHEN q.rating < 3 THEN 1 ELSE 0 END
        )*100 / COUNT(q.query_name), 2) as poor_query_percentage
FROM Queries as q
GROUP BY q.query_name