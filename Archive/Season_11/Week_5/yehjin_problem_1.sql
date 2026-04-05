SELECT
    route,
    CONCAT(ROUND(SUM(d_between_dist), 2), 'km') AS total_distance,
    CONCAT(ROUND(AVG(d_between_dist), 3), 'km') AS average_distance
FROM subway_distance
GROUP BY route
ORDER BY SUM(d_between_dist) DESC;