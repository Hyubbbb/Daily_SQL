WITH approved AS (
    SELECT
        DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
    FROM Transactions
    -- WHERE state = 'approved'
    GROUP BY month, country
),

total AS (
    SELECT 
        DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,
        COUNT(id) AS trans_count,
        SUM(amount) AS trans_total_amount
    FROM Transactions
    GROUP BY month, country
)

SELECT 
    T.month,
    T.country,
    T.trans_count,
    A.approved_count,
    T.trans_total_amount,
    A.approved_total_amount
FROM total T
LEFT JOIN approved A
    ON T.month = A.month 
    AND T.country <=> A.country
