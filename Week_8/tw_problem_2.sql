-- FISH_NAME_INFO에서 물고기의 종류 별 물고기의 이름과 잡은 수를 출력하는 SQL문을 작성

WITH cnt AS(SELECT FISH_TYPE, COUNT(*) AS 'FISH_COUNT'
FROM FISH_INFO
GROUP BY FISH_TYPE)

SELECT FISH_COUNT, FISH_NAME
FROM FISH_NAME_INFO a JOIN cnt b ON a.FISH_TYPE=b.FISH_TYPE
ORDER BY FISH_COUNT DESC
