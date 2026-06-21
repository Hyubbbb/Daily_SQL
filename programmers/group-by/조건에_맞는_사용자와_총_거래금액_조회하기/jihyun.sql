WITH completed_sales AS (
    SELECT 
        ugb.writer_id, 
        ugb.price
    FROM used_goods_board AS ugb
    WHERE 1=1
        AND ugb.status = 'DONE'
)

SELECT 
    ugu.user_id,
    ugu.nickname,
    SUM(cs.price) AS total_sales
FROM used_goods_user AS ugu
    INNER JOIN completed_sales AS cs
        ON ugu.user_id = cs.writer_id
GROUP BY 
    ugu.user_id,
    ugu.nickname
HAVING SUM(cs.price) >= 700000
ORDER BY total_sales ASC;
