-- 재구매가 일어난 상품과 회원 리스트 구하기
SELECT user_id, product_id
FROM online_sale
GROUP BY user_id, product_id
HAVING count(sales_date)>=2
ORDER BY user_id asc, product_id desc
