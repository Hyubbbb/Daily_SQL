SELECT local, count(station_id) num_stations
FROM station
GROUP BY local
ORDER by num_stations asc;
