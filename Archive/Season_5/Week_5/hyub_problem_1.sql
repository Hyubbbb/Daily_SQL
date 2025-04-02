-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=top-sql-50

SELECT
      customer_id
    , SUM(transaction_id IS NULL) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
    on v.visit_id = t.visit_id
GROUP BY customer_id
    HAVING SUM(transaction_id IS NULL) > 0
