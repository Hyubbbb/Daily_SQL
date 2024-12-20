-- 가격대 별 상품 개수 구하기
SELECT price as price_group, count(price) as products
FROM (SELECT (price div 10000)*10000 as price
        FROM product) as T
group by price
order by price_group asc