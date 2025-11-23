-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=top-sql-50
SELECT 
    v.customer_id, 
    COUNT(v.visit_id) AS count_no_trans
FROM visits AS v
    LEFT JOIN transactions AS t
        ON v.visit_id = t.visit_id
WHERE 1=1
  AND t.transaction_id IS NULL
GROUP BY v.customer_id;
