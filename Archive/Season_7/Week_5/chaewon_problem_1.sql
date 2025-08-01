SELECT 
    symbol, date, price,
    ROUND(
        AVG(price) OVER (
            PARTITION BY symbol 
            ORDER BY date 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2
    ) AS moving_avg_7days,
    CASE 
        WHEN price > AVG(price) OVER (
            PARTITION BY symbol 
            ORDER BY date 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) THEN '상승'
        ELSE '하락'
    END AS trend
FROM stock_prices
ORDER BY symbol, date;