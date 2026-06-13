WITH price AS (
    SELECT 
        writer_id, 
        price
    FROM used_goods_board
    WHERE 1=1
        AND status = 'DONE'
)

SELECT 
    user_id,
    user.nickname,
    SUM(price) AS total_sales
FROM used_goods_user AS user
    LEFT JOIN price
        ON user.user_id = price.writer_id
GROUP BY user_id
HAVING SUM(price) >= 700000 
ORDER BY total_sales