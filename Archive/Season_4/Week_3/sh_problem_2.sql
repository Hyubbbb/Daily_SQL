-- 대장균이 크기에 따라 분류하기 1
SELECT id, case when size_of_colony<=100 then "LOW"
                when size_of_colony<=1000 then "MEDIUM"
                else "HIGH"
            end as size
FROM ecoli_data
ORDER BY id