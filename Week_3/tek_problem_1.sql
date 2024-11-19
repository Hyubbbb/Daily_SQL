/* LeetCode 1068. Product Sales Analysis I
https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT P.product_name, S.year, S.price
FROM Product as P
INNER JOIN Sales as S
    ON P.product_id = S.product_id