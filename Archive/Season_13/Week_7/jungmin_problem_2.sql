-- https://solvesql.com/problems/yearly-shipping-usage/
SELECT
    YEAR(purchased_at) AS year,
    COUNT(CASE 
              WHEN shipping_method = 'Standard'
                  THEN transaction_id
          END)
    + COUNT(CASE
                WHEN is_returned = TRUE
                    THEN transaction_id
            END) AS standard,
    COUNT(CASE
              WHEN shipping_method = 'Express'
                  THEN transaction_id
          END) AS express,
    COUNT(CASE
              WHEN shipping_method = 'Overnight'
                  THEN transaction_id 
          END) AS overnight
FROM transactions
WHERE 1=1
    AND is_online_order = TRUE
GROUP BY year
ORDER BY year;
