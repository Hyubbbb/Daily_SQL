-- https://school.programmers.co.kr/learn/courses/30/lessons/131533
SELECT
    p.product_code as PRODUCT_CODE,
    p.price * sum(sale.sales_amount) as SALES
from product as p
    inner join offline_sale as sale
        on p.product_id = sale.product_id
group by p.product_id
order by sales desc, p.product_code
;