-- 대장균의 크기에 따라 분류하기 2
SELECT  id, case when ranks<=len/4 then "CRITICAL"
                 when ranks<=len/4*2 then "HIGH"
                 when ranks<=len/4*3 then "MEDIUM"
                 else "LOW"
                end as colony_name
FROM (SELECT *, 
     RANK() OVER(ORDER BY SIZE_OF_COLONY DESC) AS ranks, 
     (select count(id) from ecoli_data) as len
     FROM ecoli_data) as T
order by id

