-- https://solvesql.com/problems/yearly-net-sales/
-- 순매출: 반품되지 않은 거래 내역, SUM(주문금액 - 할인금액)
SELECT
    YEAR(purchased_at) AS year,
    SUM(total_price - discount_amount) AS net_sales
FROM transactions
WHERE 1=1
    AND is_returned = 0
GROUP BY year
ORDER BY year;
