-- 특정 조건을 만족하는 물고기별 수와 최대 길이 구하기
SELECT
    COUNT(*) AS fish_count,
    MAX(IFNULL(length, 10)) AS max_length,
    fish_type
FROM fish_info
GROUP BY fish_type
HAVING AVG(IFNULL(length, 10)) >= 33
ORDER BY fish_type
