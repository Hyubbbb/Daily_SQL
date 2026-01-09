-- https://school.programmers.co.kr/learn/courses/30/lessons/293258
SELECT COUNT(*) AS fish_count
FROM fish_info
WHERE 1=1
    AND IFNULL(length, 0) <= 10
