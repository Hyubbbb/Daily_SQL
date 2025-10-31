-- programmers (String, Date) : 연도 별 평균 미세먼지 농도 조회하기 (LEVEL 2)
SELECT
    YEAR(ym) AS year,
    ROUND(AVG(pm_val1),2) AS 'pm10',
    ROUND(AVG(pm_val2),2) AS 'pm2.5'
FROM air_pollution
WHERE 1=1
    AND location2 LIKE '수원'
GROUP BY YEAR(ym)
ORDER BY YEAR(ym)
