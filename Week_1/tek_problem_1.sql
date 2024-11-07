/* LeetCode 1757. Recyclable and Low Fat Products
https://leetcode.com/problems/recyclable-and-low-fat-products/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT p.product_id
FROM Products as p
WHERE p.low_fats = "Y" AND p.recyclable = "Y"