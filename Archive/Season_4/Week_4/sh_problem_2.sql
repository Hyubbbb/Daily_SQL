-- 특정 조건을 만족하는 물고기별 수와 최대 길이 구하기
SELECT COUNT(ID) AS FISH_COUNT, MAX(LENGTH) AS MAX_LENGTH, A.FISH_TYPE
FROM (SELECT FISH_TYPE
    FROM (SELECT FISH_type, AVG(length) as avg_len
            FROM (SELECT FISH_TYPE, case when length<=10 or length is null then 10 ELSE length end as length
                 FROM FISH_INFO) as T
            group by fish_type) as K
    WHERE avg_len>=33) as T join FISH_info as A on T.FISH_TYPE=A.FISH_TYPE
group by A.fish_type 
ORDER BY FISH_TYPE