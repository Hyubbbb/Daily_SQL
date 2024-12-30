/* LeetCode Immediate Food Delivery II
https://leetcode.com/problems/immediate-food-delivery-ii/description/ */

SELECT ROUND(SUM(g.is_immediate)/COUNT(is_immediate)* 100, 2)  as immediate_percentage
FROM (
    SELECT customer_id, MIN(order_date), MIN(customer_pref_delivery_date),
        CASE
            WHEN MIN(order_date) = MIN(customer_pref_delivery_date) THEN 1
            ELSE 0
        END as is_immediate
    FROM Delivery
    GROUP BY customer_id
) as g
