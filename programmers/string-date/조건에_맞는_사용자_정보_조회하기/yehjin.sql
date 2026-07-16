SELECT
    user.user_id,
    user.nickname,
    CONCAT(user.city, ' ' ,user.street_address1, ' ', user.street_address2) AS 전체주소,
    CONCAT(SUBSTRING(user.tlno, 1, 3), '-', SUBSTRING(user.tlno, 4, 4), '-', SUBSTRING(user.tlno, 8, 4)) AS 전화번호
FROM used_goods_board AS board
    INNER JOIN used_goods_user AS user
        ON board.writer_id = user.user_id
GROUP BY user_id
HAVING COUNT(*)>=3
ORDER BY user_id DESC
