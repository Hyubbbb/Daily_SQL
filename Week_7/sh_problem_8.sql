-- 카테고리 별 상품 개수 구하기
SELECT category, count(product_id) as products
FROM (SELECT left(product_code, 2) as category, product_id
        FROM product) as T
GROUP BY category
order by category asc
