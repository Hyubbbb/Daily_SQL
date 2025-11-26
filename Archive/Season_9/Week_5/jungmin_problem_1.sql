-- programmers (GROUP BY) : 월별 잡은 물고기 수 구하기 (LEVEL 2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/293260
SELECT
    COUNT(*) AS fish_count,
    MONTH(time) AS month
FROM fish_info
GROUP BY month
ORDER BY month
