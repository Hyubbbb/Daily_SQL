/* 1045. Customers Who Bought All Products
https://leetcode.com/problems/customers-who-bought-all-products/description/ */

SELECT DISTINCT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product)
ORDER BY customer_id