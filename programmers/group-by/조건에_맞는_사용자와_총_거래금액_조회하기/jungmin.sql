SELECT
    boards.writer_id,
    users.nickname,
    SUM(price) AS total_sales
FROM used_goods_board AS boards
    JOIN used_goods_user AS users
        ON boards.writer_id = users.user_id
WHERE 1=1
    AND boards.status = 'done'
GROUP BY boards.writer_id
HAVING SUM(price) >= 700000
ORDER BY total_sales;
