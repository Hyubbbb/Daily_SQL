-- https://solvesql.com/problems/ab-testing-buckets-1/
-- 그룹A: id가 10으로 나누어떨어지는 그룹 / 그룹B: 나머지
-- 정답처리를 위해 그룹 A, B를 대문자로 작성함
SELECT
    customer_id,
    MIN(CASE
        WHEN customer_id % 10 = 0
            THEN 'A'
        ELSE 'B'
    END) AS bucket
FROM transactions
GROUP BY customer_id
ORDER BY customer_id;
