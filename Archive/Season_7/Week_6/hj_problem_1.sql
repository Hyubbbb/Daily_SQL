-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
WITH length_stats AS (
    SELECT MIN(CHAR_LENGTH(CITY)) AS min_len,
           MAX(CHAR_LENGTH(CITY)) AS max_len
    FROM STATION
)
(
    SELECT CITY, CHAR_LENGTH(CITY) AS name_length
    FROM STATION, length_stats
    WHERE CHAR_LENGTH(CITY) = length_stats.min_len
    ORDER BY CITY ASC
    LIMIT 1
)
UNION ALL
(
    SELECT CITY, CHAR_LENGTH(CITY) AS name_length
    FROM STATION, length_stats
    WHERE CHAR_LENGTH(CITY) = length_stats.max_len
    ORDER BY CITY ASC
    LIMIT 1
);