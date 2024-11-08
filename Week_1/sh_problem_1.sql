-- 분기별 분화된 대장균의 개체 수 구하기
SELECT quarter, count(id) as ecoli_count
FROM (SELECT case when month(differentiation_date)>=1 and month(differentiation_date)<4 then '1Q'
            when month(differentiation_date)>=4 and month(differentiation_date)<7 then '2Q'
            when month(differentiation_date)>=7 and month(differentiation_date)<10 then '3Q'
            when month(differentiation_date)>=10 and month(differentiation_date)<=12 then '4Q'
            end as 'quarter', id
      FROM ecoli_data) as ecoli
GROUP BY ecoli.quarter
ORDER BY ecoli.quarter asc