SELECT ROUND(SUM(T1.tiv_2016), 2) AS tiv_2016
FROM (SELECT *, COUNT(*) OVER (PARTITION BY tiv_2015) AS cnt FROM Insurance) T1
    LEFT JOIN Insurance T2 
        ON T1.lat = T2.lat and T1.lon = T2.lon and T1.pid != T2.pid
WHERE T2.pid IS NULL
    AND cnt > 1
