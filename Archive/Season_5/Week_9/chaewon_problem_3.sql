-- 일별 매출 추세와 7일 이동 평균을 계산하세요.
SELECT
    sale_date,
    daily_revenue,
    AVG(daily_revenue) OVER (
        ORDER BY sale_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) as seven_day_moving_avg
FROM (
    SELECT
        DATE(sale_timestamp) as sale_date,
        SUM(amount) as daily_revenue
    FROM sales
    WHERE sale_timestamp >= CURRENT_DATE - INTERVAL '90 days'
    GROUP BY DATE(sale_timestamp)
) daily_sales
ORDER BY sale_date;
