-- https://datalemur.com/questions/sql-third-transaction
WITH trans_num AS (
    SELECT 
        user_id, 
        spend, 
        transaction_date, 
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS row_num 
    FROM transactions)
 
SELECT 
    user_id, 
    spend, 
    transaction_date 
FROM trans_num 
WHERE 1=1
    AND row_num = 3;
