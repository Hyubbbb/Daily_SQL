-- SELECT: 특정 물고기를 잡은 총 수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/298518

SELECT COUNT(FI.ID) AS FISH_COUNT
FROM FISH_INFO FI
JOIN FISH_NAME_INFO FNI
ON FI.FISH_TYPE = FNI.FISH_TYPE
WHERE FNI.FISH_NAME IN ('BASS', 'SNAPPER');
