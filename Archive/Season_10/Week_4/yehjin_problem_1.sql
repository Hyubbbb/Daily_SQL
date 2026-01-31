#https://school.programmers.co.kr/learn/courses/30/lessons/293260
SELECT
    COUNT(*) AS fish_count,
    MONTH(time) AS month
FROM fish_info
GROUP BY MONTH(time)
ORDER BY month;
