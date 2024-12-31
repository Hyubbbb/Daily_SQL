/* 1070. Product Sales Analysis III
https://leetcode.com/problems/product-sales-analysis-iii/description/ */


SELECt s.product_id, 
    min_year as first_year,
    s.quantity,
    s.price
FROM Sales as s
-- LEFT JOIN Product as p
--     ON s.product_id = p.product_id
INNER JOIN (SELECT product_id, MIN(year) as min_year FROM Sales GROUP BY product_id) as sub1
    ON s.product_id = sub1.product_id
WHERE s.year = sub1.min_year


-- select product_id,year as first_year, quantity, price
-- from Sales
-- where(product_id, year) in (select  product_id, min(year) from Sales group by product_id)