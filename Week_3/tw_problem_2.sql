-- 특정 물고기를 잡은 총 수 구하기(programmers)
-- OR보다 IN 연산자 사용이 더 편리(물론 OR로 해도 똑같이 나옴)
SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO f RIGHT JOIN FISH_NAME_INFO n ON f.FISH_TYPE = n.FISH_TYPE
WHERE FISH_NAME IN ('BASS', 'SNAPPER')
