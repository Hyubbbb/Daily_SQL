SELECT
    u.user_id,
    u.nickname,
    CONCAT(u.city, ' ', u.street_address1, ' ', u.street_address2) AS '전체주소',
    CONCAT(SUBSTRING(u.TLNO, 1, 3), '-',SUBSTRING(u.TLNO, 4, 4), '-', SUBSTRING(u.TLNO, 8, 4)) AS '전화번호'
FROM used_goods_board AS b
    JOIN used_goods_user AS u
        ON b.writer_id = u.user_id
GROUP BY b.writer_id
HAVING COUNT(*) >= 3
ORDER BY u.user_id DESC