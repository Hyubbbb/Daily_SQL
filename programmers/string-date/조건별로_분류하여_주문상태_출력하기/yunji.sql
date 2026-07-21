SELECT
    order_id,
    product_id,
    DATE_FORMAT(out_date, '%Y-%m-%d') AS out_date,
    CASE
        WHEN out_date IS NULL
            THEN '출고미정'
        WHEN out_date <= '2022-05-01'
            THEN '출고완료'
        ELSE '출고대기'
    END AS 출고여부
FROM food_order
ORDER BY order_id;
