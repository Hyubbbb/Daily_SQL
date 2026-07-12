SELECT
    ugu.user_id,
    ugu.nickname,
    CONCAT_WS(' ', ugu.city, ugu.street_address1, ugu.street_address2) AS 전체주소,
    CONCAT(LEFT(ugu.tlno, 3),'-',MID(ugu.tlno, 4, 4),'-',RIGHT(ugu.tlno, 4)) AS 전화번호
FROM used_goods_user AS ugu
    INNER JOIN used_goods_board AS ugb
        ON ugu.user_id = ugb.writer_id
GROUP BY ugu.user_id
HAVING COUNT(*) >= 3
ORDER BY ugu.user_id DESC
