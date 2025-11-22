-- 그룹별 조건에 맞는 식당 목록 출력하기 (박정민)
WITH cnt_ranking AS (
    SELECT
        member_id,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
    FROM rest_review
    GROUP BY member_id
)

SELECT
    m.member_name,
    r.review_text,
    DATE_FORMAT(r.review_date, '%Y-%m-%d') AS review_date
FROM rest_review AS r
    JOIN member_profile AS m
        ON r.member_id = m.member_id
    JOIN cnt_ranking AS c
        ON r.member_id = c.member_id
WHERE 1=1
    AND c.ranking = 1
ORDER BY review_date ASC, r.review_text ASC;
