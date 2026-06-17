SELECT
    users.user_id,
    users.nickname,
    SUM(boards.price) AS total_sales
FROM used_goods_board AS boards
    JOIN used_goods_user AS users
        ON boards.writer_id = users.user_id
WHERE 1=1
    AND boards.status = 'DONE'
GROUP BY boards.writer_id
HAVING total_sales >= 700000
ORDER BY total_sales;