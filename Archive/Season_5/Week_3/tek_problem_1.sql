/* leetcode Medium 한 번 더 풀기
1174. Immediate Food Delivery II
https://leetcode.com/problems/immediate-food-delivery-ii/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT ROUND(
    AVG(CASE WHEN min_order_date = min_customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2
    ) AS immediate_percentage
FROM (
    SELECT customer_id, 
        MIN(order_date) as min_order_date, 
        MIN(customer_pref_delivery_date) as min_customer_pref_delivery_date
    FROM Delivery
    GROUP BY customer_id
) 