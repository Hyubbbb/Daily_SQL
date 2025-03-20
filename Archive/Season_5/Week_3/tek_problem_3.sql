/* leetcode Medium 한 번 더 풀기
1070. Product Sales Analysis III
https://leetcode.com/problems/product-sales-analysis-iii/description/ */

SELECT product_id, year as first_year, quantity, price
FROM (
    SELECT *, 
        RANK() OVER (PARTITION BY product_id ORDER BY year) as rank
    FROM Sales
) as ranked
WHERE rank = 1

/* 다른 사람 쿼리
select product_id,year as first_year, quantity, price
from Sales
where (product_id,year) in (select product_id, min(year) from Sales group by product_id); 
*/