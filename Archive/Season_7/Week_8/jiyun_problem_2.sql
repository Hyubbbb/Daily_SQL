WITH cnt AS (
    SELECT
        user_id,
        ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) / count(*), 2) AS confirmation_rate
    FROM Confirmations
    GROUP BY user_id    
)

SELECT
    S.user_id,
    CASE
        WHEN confirmation_rate IS NULL THEN 0.00
        ELSE confirmation_rate 
    END AS confirmation_rate   
FROM Signups S
LEFT JOIN cnt C
    ON S.user_id = C.user_id
