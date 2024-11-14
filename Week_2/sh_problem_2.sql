-- 연도 별 평균 미세먼지 농도 조회하기
SELECT year(ym) as year, round(avg(pm_val1),2) as "PM10", round(avg(pm_val2), 2) as "PM2.5"
FROM air_pollution
WHERE location2="수원"
GROUP BY year(ym)
ORDER BY year asc