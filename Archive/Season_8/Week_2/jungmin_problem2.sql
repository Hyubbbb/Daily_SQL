-- JOIN : 상품 별 오프라인 매출 구하기
SELECT
    p.product_code,
    SUM (p.price * o.sales_amount) as sales
FROM
    product as p
    JOIN offline_sale as o
        ON p.product_id = o.product_id
GROUP BY
    p.product_code
ORDER BY 
    sales DESC,
    p.product_code ASC
