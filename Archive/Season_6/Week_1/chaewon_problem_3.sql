-- https://school.programmers.co.kr/learn/courses/30/lessons/293261
SELECT f.ID, n.FISH_NAME, f.LENGTH
FROM FISH_INFO f
JOIN FISH_NAME_INFO n ON f.FISH_TYPE = n.FISH_TYPE
JOIN (
    -- 물고기 종류별 최대 길이를 구하기
    SELECT FISH_TYPE, MAX(LENGTH) as MAX_LENGTH
    FROM FISH_INFO
    WHERE LENGTH IS NOT NULL  -- NULL 값 제외
    GROUP BY FISH_TYPE
) max_fish ON f.FISH_TYPE = max_fish.FISH_TYPE AND f.LENGTH = max_fish.MAX_LENGTH
ORDER BY f.ID ASC;