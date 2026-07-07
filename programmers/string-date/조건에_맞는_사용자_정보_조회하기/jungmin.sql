WITH freq_writers AS (
    SELECT writer_id
    FROM used_goods_board
    GROUP BY writer_id
    HAVING COUNT(writer_id) >= 3
)

SELECT 
    users.user_id,
    users.nickname,
    CONCAT(users.city, ' ', users.street_address1, ' ', users.street_address2) AS 전체주소,
    CONCAT(SUBSTRING(users.tlno, 1, 3), '-', SUBSTRING(users.tlno, 4, 4), '-', SUBSTRING(users.tlno, 8, 4)) AS 전화번호
FROM used_goods_user AS users
    INNER JOIN freq_writers AS freq
        ON users.user_id = freq.writer_id
ORDER BY users.user_id DESC;
