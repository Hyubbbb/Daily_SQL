-- customer_data 테이블에서 중복된 고객 레코드를 찾아 제거
WITH duplicate_check AS (
    SELECT
        email,
        COUNT(*) as count,
        STRING_AGG(id::TEXT, ', ') as duplicate_ids
    FROM customer_data
    GROUP BY email
    HAVING COUNT(*) > 1
)
SELECT * FROM duplicate_check
ORDER BY count DESC;