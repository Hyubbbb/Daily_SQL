-- (https://school.programmers.co.kr/learn/courses/30/lessons/298518, Lv.2)

SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO as fi
JOIN FISH_NAME_INFO as fni
ON fi.FISH_TYPE = fni.FISH_TYPE
WHERE FISH_NAME = 'BASS' OR FISH_NAME = 'SNAPPER';
