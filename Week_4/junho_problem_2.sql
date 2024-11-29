WITH t1 AS (SELECT product_id
           FROM sales
           WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31'
),
t2 AS (SELECT product_id
      FROM sales
      WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
)
SELECT product_id, product_name
FROM product
WHERE product_id IN (SELECT product_id
                        FROM t1
                        WHERE product_id NOT IN (SELECT product_id FROM t2))
