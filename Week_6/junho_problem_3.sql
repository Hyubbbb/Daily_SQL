-- (https://school.programmers.co.kr/learn/courses/30/lessons/293257, Lv.2)

SELECT COUNT(ID) AS FISH_COUNT, FISH_NAME
FROM FISH_INFO as fi
JOIN FISH_NAME_INFO as fmi
ON fi.FISH_TYPE = fmi.FISH_TYPE
GROUP BY 2
ORDER BY 1 DESC;
