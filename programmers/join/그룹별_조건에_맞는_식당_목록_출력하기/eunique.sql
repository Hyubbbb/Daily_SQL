-- 코드를 입력하세요
WITH review_count AS (
    SELECT 
        member_id,
        COUNT(*) AS cnt
    FROM rest_review
    GROUP BY member_id
),
max_reviewer AS (
    SELECT 
        member_id
    FROM review_count
    WHERE 1=1
        AND cnt = (SELECT MAX(cnt) FROM review_count)
)
  
SELECT 
    m.member_name,
    r.review_text,
    DATE_FORMAT(r.review_date, '%Y-%m-%d') AS review_date
FROM rest_review AS r
    JOIN member_profile AS m
        ON r.member_id = m.member_id
    JOIN max_reviewer mx
        ON r.member_id = mx.member_id
ORDER BY 
    r.review_date ASC,
    r.review_text ASC;
