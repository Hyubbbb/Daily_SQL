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
    mp.member_name,
    rr.review_text,
    DATE_FORMAT(rr.review_date, '%Y-%m-%d') AS review_date
FROM rest_review AS rr
    JOIN member_profile AS mp
        ON rr.member_id = mp.member_id
    JOIN max_reviewer mx
        ON rr.member_id = mx.member_id
ORDER BY r.review_date, r.review_text;
