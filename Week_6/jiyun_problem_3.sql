SELECT local, COUNT(station_id) AS num_stations
FROM station
GROUP BY local
ORDER BY num_stations