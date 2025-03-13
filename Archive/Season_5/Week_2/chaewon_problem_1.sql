-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/298519
-- 10cm 이하는 NULL대신 10cm로 처리하여 평균 길이가 33cm 이상인 물고기별로 개수, 최대 길이를 계산
SELECT COUNT(*) AS FISH_COUNT, MAX(COALESCE(LENGTH, 10)) AS MAX_LENGTH, FISH_TYPE
FROM FISH_INFO
GROUP BY FISH_TYPE
HAVING AVG(COALESCE(LENGTH, 10)) >= 33
ORDER BY FISH_TYPE ASC;