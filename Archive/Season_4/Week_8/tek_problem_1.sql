/* leetcode 1327. List the Products Ordered in a Period
https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/ */

SELECT p.product_name, SUM(unit) as unit
FROM Orders as o
INNER JOIN Products as p
    ON o.product_id = p.product_id
WHERE o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(unit) >= 100

-- SELECT ANY_VALUE(products.product_name) AS product_name,
-- 	   SUM(orders.unit) AS unit
-- FROM orders
-- INNER JOIN products USING(product_id)
-- WHERE orders.order_date BETWEEN '2020-02-01'::DATE AND '2020-02-29'::DATE
-- GROUP BY product_id
-- HAVING SUM(orders.unit) >= 100;