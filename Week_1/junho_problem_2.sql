-- (https://school.programmers.co.kr/learn/courses/30/lessons/299307)

SELECT ID, IF(SIZE_OF_COLONY<=100, 'LOW', IF(SIZE_OF_COLONY<=1000, 'MEDIUM', 'HIGH')) AS SIZE
FROM ECOLI_DATA
ORDER BY ID;
