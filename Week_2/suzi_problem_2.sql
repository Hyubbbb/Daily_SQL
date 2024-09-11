-- 코드를 작성해주세요
SELECT YEAR(YM) AS YEAR, 
ROUND(AVG(PM_VAL1),2)'PM10',
ROUND(AVG(PM_VAL2),2)'PM2.5'
FROM AIR_POLLUTION
WHERE 
LOCATION1 = '경기도' AND
LOCATION2 = '수원'
GROUP BY YEAR(YM) 
ORDER BY YEAR(YM);