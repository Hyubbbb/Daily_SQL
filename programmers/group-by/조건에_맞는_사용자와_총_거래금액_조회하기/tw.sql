-- 완료된(WHERE = "DONE") 중고 거래의 총금액이 70만 원 이상(HAVING)인 사람

SELECT
    user.user_id,
    user.nickname,
    SUM(price) AS total_price
FROM used_goods_board AS board
    JOIN used_goods_user AS user
        ON board.writer_id = user.user_id
WHERE 1=1
    AND status = "DONE"
GROUP BY board.writer_id
HAVING total_price >= 700000
ORDER BY total_price
