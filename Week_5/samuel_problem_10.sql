-- https://school.programmers.co.kr/learn/courses/30/lessons/299310
-- Window function! Use PARTITION BY to divide data into groups.

SELECT 
    YEAR(DIFFERENTIATION_DATE) AS YEAR, 
    MAX(SIZE_OF_COLONY) OVER (PARTITION BY YEAR(DIFFERENTIATION_DATE)) - SIZE_OF_COLONY AS YEAR_DEV,
    ID
FROM ECOLI_DATA
ORDER BY YEAR ASC, YEAR_DEV ASC;