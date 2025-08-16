SELECT
    product_id,
    first_year,
    quantity,
    price
FROM 
    (SELECT
        *,
        MIN(year) OVER (PARTITION BY product_id) AS first_year
    FROM Sales
    ) T1
WHERE year = first_year
