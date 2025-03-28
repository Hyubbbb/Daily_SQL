/* leetcode Medium 한 번 더 풀기
1045. Customers Who Bought All Products
https://leetcode.com/problems/customers-who-bought-all-products/description/ */


SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(product_key) IN (SELECT COUNT(DISTINCT product_key) FROM Product)