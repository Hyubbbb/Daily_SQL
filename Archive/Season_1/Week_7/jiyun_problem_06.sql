-- 코드를 작성해주세요
WITH ROUTE_TABLE AS(
SELECT ROUTE, ROUND(SUM(D_BETWEEN_DIST), 1) AS TOTAL_DISTANCE, 
        ROUND(AVG(D_BETWEEN_DIST), 2) AS AVERAGE_DISTANCE
    FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY TOTAL_DISTANCE DESC)

SELECT ROUTE, CONCAT(TOTAL_DISTANCE, 'km') AS TOTAL_DISTANCE,
        CONCAT(AVERAGE_DISTANCE, 'km') AS AVERAGE_DISTANCE
    FROM ROUTE_TABLE;
