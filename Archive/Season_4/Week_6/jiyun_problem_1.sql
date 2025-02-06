WITH TMP AS(
  SELECT 
    CASE
      WHEN measured_at BETWEEN '2022-03-01' AND '2022-05-31' THEN 'spring'
      WHEN measured_at BETWEEN '2022-06-01' AND '2022-08-31' THEN 'summer'
      WHEN measured_at BETWEEN '2022-09-01' AND '2022-11-30' THEN 'autumn'
      ELSE 'winter'
    END AS season,
    pm10
FROM measurements
)

SELECT season,
  AVG(CASE 
        WHEN CNT%2!=0 AND rm=(CNT+1)/2 THEN pm10
        WHEN CNT%2=0 AND (rm=CNT/2 OR rm=CNT/2 + 1) THEN pm10 END) AS pm10_median,
  ROUND(AVG(pm10),2) AS pm10_average
FROM(
  SELECT season,
    pm10,
    ROW_NUMBER() OVER (PARTITION BY season ORDER BY pm10) AS rm,
    COUNT(*) OVER (PARTITION BY season) AS CNT
    FROM TMP
)
GROUP BY season
