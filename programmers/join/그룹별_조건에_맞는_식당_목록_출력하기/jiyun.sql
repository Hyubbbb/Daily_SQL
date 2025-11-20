WITH 
cnt_review AS ( 
    SELECT
        member_id,
        COUNT(review_id) AS cnt -- 리뷰 수 count
    FROM rest_review
    GROUP BY member_id
),

most_reviewer AS (
    SELECT
        member_id,
        RANK() OVER (ORDER BY cnt DESC) AS rn -- 리뷰 수 내림차순 기준 rank
    FROM cnt_review
)

SELECT
    m2.member_name,
    r.review_text,
    DATE_FORMAT(r.review_date, '%Y-%m-%d') AS review_date
FROM rest_review AS r
    JOIN most_reviewer m1 
        ON r.member_id = m1.member_id
    JOIN member_profile AS m2
        ON m1.member_id = m2.member_id
WHERE 1=1
    AND rn = 1 -- 리뷰 수 내림차순 기준 rank가 1인 회원
ORDER BY r.review_date, r.review_text
