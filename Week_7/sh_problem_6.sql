-- 상품 별 오프라인 매출 구하기
SELECT product_code, sum(sales_amount*price) as sales
FROM product as a join offline_sale as b on a.product_id=b.product_id
group by product_code
order by sales desc, product_code asc