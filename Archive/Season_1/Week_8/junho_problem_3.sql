-- (https://school.programmers.co.kr/learn/courses/30/lessons/293260, Lv.2)

SELECT COUNT(*) AS FISH_COUNT, MONTH(TIME) AS MONTH
FROM FISH_INFO
GROUP BY 2
ORDER BY 2;
