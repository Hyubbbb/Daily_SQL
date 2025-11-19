WITH 
top_reviewer_cnt AS (
    SELECT 
        COUNT(*) AS top_cnt
    FROM rest_review
    GROUP BY member_id
    ORDER BY top_cnt DESC
    LIMIT 1
),
top_reviewer_list AS (
    SELECT
        member_id
    FROM rest_review
    GROUP BY member_id
        HAVING COUNT(*) = (SELECT top_cnt FROM top_reviewer_cnt)
)
SELECT
    mp.member_name,
    rr.review_text,
    DATE_FORMAT(rr.review_date, '%Y-%m-%d') AS review_date
FROM rest_review AS rr
    JOIN member_profile AS mp
        ON rr.member_id = mp.member_id
WHERE 1=1
    AND rr.member_id IN (SELECT member_id FROM top_reviewer_list)
ORDER BY review_date, review_text