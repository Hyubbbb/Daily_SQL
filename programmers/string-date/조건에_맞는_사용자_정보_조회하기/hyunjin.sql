-- 코드를 입력하세요
WITH heavy_writer AS(
    SELECT 
        b.writer_id
    FROM used_goods_board AS b
    GROUP BY b.writer_id
    HAVING COUNT(*) >= 3
)

SELECT 
    heavy_writer.writer_id AS user_id,
    u.nickname,
    CONCAT(u.city,' ', u.street_address1,' ', u.street_address2) AS 전체주소,
    CONCAT(SUBSTR(u.tlno, 1, 3),'-', SUBSTR(u.tlno, 4, 4),'-', SUBSTR(u.tlno, 8, 4)) AS 전화번호
FROM heavy_writer 
    JOIN used_goods_user AS u
        ON heavy_writer.writer_id = u.user_id
ORDER BY heavy_writer.writer_id DESC
