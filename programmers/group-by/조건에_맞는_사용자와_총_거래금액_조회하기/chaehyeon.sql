SELECT
    user.user_id,
    user.nickname,
    SUM(board.price) AS total_sales
FROM used_goods_user AS user
    JOIN used_goods_board AS board
        ON user.user_id = board.writer_id
WHERE board.status = 'DONE'
GROUP BY user.user_id, user.nickname
HAVING SUM(board.price) >= 700000
ORDER BY total_sales;
