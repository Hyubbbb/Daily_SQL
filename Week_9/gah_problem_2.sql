-- [PROGRAMMERS] GROUP BY > 물고기 종류 별 잡은 수 구하기

SELECT COUNT(i.ID) FISH_COUNT, n.FISH_NAME
FROM FISH_INFO i, FISH_NAME_INFO n
WHERE i.FISH_TYPE = n.FISH_TYPE
GROUP BY FISH_NAME
ORDER BY FISH_NAME DESC;
