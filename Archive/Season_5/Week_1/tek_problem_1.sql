/*
leetcode 1158. Market Analysis I
https://leetcode.com/problems/market-analysis-i/description/
*/


WITH grouped AS (
    SELECT o.buyer_id, COUNT(o.buyer_id) as orders_in_2019
    FROM Orders as o
    WHERE o.order_date BETWEEN '2019-01-01' AND '2019-12-31'
    GROUP BY o.buyer_id
)


SELECT u.user_id as buyer_id, 
    u.join_date, 
    COALESCE(g.orders_in_2019, 0) as orders_in_2019
FROM Users as u
LEFT JOIN grouped as g
    ON u.user_id = g.buyer_id