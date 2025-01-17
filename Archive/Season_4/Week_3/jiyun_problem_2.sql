SELECT 
  station_id,
  name,
  local,
  ROUND(100.0*(return19+rent19)/(rent18+return18),2) AS usage_pct
  
FROM station S
JOIN
  (SELECT rent_station_id,
    COUNT(CASE WHEN rent_at LIKE '2019-10%' THEN rent_station_id END) AS rent19,
    COUNT(CASE WHEN rent_at LIKE '2018-10%' THEN rent_station_id END) AS rent18
    FROM rental_history
    GROUP BY rent_station_id) AS rentT 
  ON S.station_id=rentT.rent_station_id
JOIN
(SELECT return_station_id,
    COUNT(CASE WHEN return_at LIKE '2019-10%' THEN return_station_id END) AS return19,
    COUNT(CASE WHEN return_at LIKE '2018-10%' THEN return_station_id END) AS return18
    FROM rental_history
    GROUP BY return_station_id) AS renturnT 
  ON S.station_id=renturnT.return_station_id
WHERE (return19+rent19)!=0 
  AND (return18+rent18)!=0
  AND 100*(return19+rent19)/(return18+rent18)<=50
