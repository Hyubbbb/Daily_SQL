SELECT
    user.user_id,
    user.nickname,
    SUM(board.price) AS total_sales
FROM used_goods_board AS board
    INNER JOIN used_goods_user AS user
        ON board.writer_id = user.user_id
WHERE 1=1
    AND board.status = 'DONE'
GROUP BY user.user_id, user.nickname
HAVING total_sales >= 700000
ORDER BY total_sales;