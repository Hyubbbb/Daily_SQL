WITH daily_active_users AS (
    SELECT 
        activity_date,
        COUNT(DISTINCT user_id) as dau
    FROM user_activity
    WHERE activity_date >= CURRENT_DATE - INTERVAL 30 DAY
    GROUP BY activity_date
),
dau_with_previous AS (
    SELECT 
        activity_date,
        dau,
        LAG(dau, 1) OVER (ORDER BY activity_date) as prev_dau,
        ROUND((dau - LAG(dau, 1) OVER (ORDER BY activity_date)) * 100.0 / 
              NULLIF(LAG(dau, 1) OVER (ORDER BY activity_date), 0), 2) as growth_rate
    FROM daily_active_users
)
SELECT 
    activity_date,
    dau,
    prev_dau,
    CASE 
        WHEN growth_rate IS NULL THEN 'N/A'
        ELSE CONCAT(growth_rate, '%')
    END as daily_growth_rate
FROM dau_with_previous
ORDER BY activity_date;