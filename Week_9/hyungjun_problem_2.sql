잡은 물고기의 평균 길이 구하기 | https://school.programmers.co.kr/learn/courses/30/lessons/293259

select ROUND(avg(
    CASE 
        WHEN LENGTH IS NULL THEN 10
        WHEN LENGTH <= 10 THEN 10
        ELSE LENGTH
    END), 2) as AVERAGE_LENGTH
from FISH_INFO
