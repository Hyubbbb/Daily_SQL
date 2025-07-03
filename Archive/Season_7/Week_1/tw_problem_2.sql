SELECT p.product_name, s.year, s.price
FROM Sales s LEFT JOIN Product p ON s.product_id=p.product_id 
-- GROUP BY s.sale_id
ORDER BY 1

-- group by인 것처럼 설명해놓고;;
