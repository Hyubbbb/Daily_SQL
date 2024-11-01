-- 연도별 대장균 크기의 편차 구하기
SELECT year ,max_size-size_of_colony as year_dev, id
FROM ecoli_data a join
(select  max(size_of_colony) as max_size, year(differentiation_Date) as year
 FROM ecoli_data
 group by year(differentiation_Date)) b
 on year(a.DIFFERENTIATION_DATE)=b.year
 order by year, year_dev