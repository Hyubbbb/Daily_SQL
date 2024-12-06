/* LeetCode 1251. Average Selling Price
https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50 */

-- # Write your MySQL query statement below

-- SELECT g.product_id, 
--     CASE
--         WHEN g.purchase_date is NULL THEN 0
--         ELSE ROUND(sum(g.total_price) / sum(g.units), 2) 
--     END as average_price
-- FROM (
--     SELECT p.product_id, u.units, u.purchase_date, p.price * u.units as total_price
--     FROM Prices as p
--     LEFT JOIN UnitsSold as u
--         ON p.product_id = u.product_id
--     WHERE p.end_date >= u.purchase_date 
--         AND p.start_date <= u.purchase_date
--         OR u.purchase_date is Null
-- ) as g
-- GROUP BY g.product_id


select p.product_id, 
    round(ifnull((sum(p.price*u.units)/sum(u.units)),0),2) as average_price 
from Prices p
left join UnitsSold u
on p.product_id=u.product_id 
    and u.purchase_date>=p.start_date  
    and u.purchase_date<=p.end_date
group by p.product_id