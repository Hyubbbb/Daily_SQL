-- 2022.1.1 토요일
WITH week AS (
  SELECT CASE
    WHEN STRFTIME('%w',measured_at) = '0' THEN '일요일'
    WHEN STRFTIME('%w',measured_at) = '1' THEN '월요일'
    WHEN STRFTIME('%w',measured_at) = '2' THEN '화요일'
    WHEN STRFTIME('%w',measured_at) = '3' THEN '수요일'
    WHEN STRFTIME('%w',measured_at) = '4' THEN '목요일'
    WHEN STRFTIME('%w',measured_at) = '5' THEN '금요일'
    ELSE '토요일'
  END AS weekday,
  *
  FROM measurements
)

SELECT weekday,
  ROUND(AVG(no2),4) AS no2,
  ROUND(AVG(o3),4) AS o3,
  ROUND(AVG(co),4) AS co,
  ROUND(AVG(so2),4) AS so2,
  ROUND(AVG(pm10),4) AS pm10,
  ROUND(AVG(pm2_5),4) AS pm2_5
FROM week
GROUP BY weekday

ORDER BY 
    CASE weekday
        WHEN '월요일' THEN 1
        WHEN '화요일' THEN 2
        WHEN '수요일' THEN 3
        WHEN '목요일' THEN 4
        WHEN '금요일' THEN 5
        WHEN '토요일' THEN 6
        ELSE 7 -- 나머지 값
    END;



