WITH max_price_cte AS (
    SELECT
        category,
        MAX(price) AS max_price
    FROM food_product
    WHERE 1=1
        AND category IN ('과자','국','김치','식용유')
    GROUP BY category
)

SELECT
    fp.category,
    fp.price AS max_price,
    fp.product_name
FROM food_product AS fp
    JOIN max_price_cte AS mpc
        ON fp.category = mpc.category
            AND fp.price = mpc.max_price
ORDER BY max_price DESC