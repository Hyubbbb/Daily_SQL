-- 조건에 맞는 사용자와 총 거래금액 조회하기
SELECT 
    board.writer_id AS user_id,
    user.nickname,
    SUM(board.price) AS total_sales
FROM used_goods_board AS board
    INNER JOIN used_goods_user AS user
        ON board.writer_id = user.user_id
WHERE 1=1
    AND board.status = 'DONE'
GROUP BY 
    board.writer_id,
    user.nickname
HAVING SUM(board.price) >= 700000
ORDER BY total_sales
