WITH cnt_review AS (
    SELECT
        member_id,
        RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
    FROM rest_review
    GROUP BY member_id
)

SELECT 
    m.member_name, 
    r.review_text,
    DATE_FORMAT(r.review_date, '%Y-%m-%d') AS review_date
FROM rest_review AS r
    JOIN cnt_review AS c
        ON r.member_id = c.member_id
    JOIN member_profile AS m
        ON r.member_id = m.member_id
WHERE 1=1
    AND c.rnk = 1
ORDER BY 
    3, 
    1;
