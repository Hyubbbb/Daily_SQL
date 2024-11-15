SELECT floor(price / 10000)*10000 as PRICE_GROUP, count(*) as PRODUCTS
FROM product
GROUP BY floor(price / 10000)
ORDER BY PRICE_GROUP
