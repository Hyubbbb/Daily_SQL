-- [PROGRAMMERS] SUM, MIN, MAX > 물고기 종류 별 대어 찾기

SELECT i.ID, n.FISH_NAME, i.LENGTH
FROM FISH_INFO i, FISH_NAME_INFO n
WHERE i.FISH_TYPE = n.FISH_TYPE
      AND i.LENGTH = (SELECT MAX(LENGTH)
                      FROM FISH_INFO i2
                      WHERE i.FISH_TYPE = i2.FISH_TYPE
                      GROUP BY FISH_TYPE)
ORDER BY 1;
