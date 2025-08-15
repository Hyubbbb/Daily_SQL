SELECT * FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY price DESC, product_id) as rn
    FROM products
) ranked
WHERE rn <= 5;