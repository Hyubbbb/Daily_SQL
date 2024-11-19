/* LeetCode 1581. Customer Who Visited but Did Not Make Any Transactions
https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT v.customer_id, COUNT(v.customer_id) as count_no_trans
FROM Visits as v 
WHERE v.visit_id NOT IN (
    SELECT t.visit_id
    FROM Transactions as t
)
GROUP BY v.customer_id