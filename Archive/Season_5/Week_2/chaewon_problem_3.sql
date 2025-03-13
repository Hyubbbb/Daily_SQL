-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/284531
-- 노선별 총 누계 거리와 평균 역 사이 거리를 계산하고, 'km'단위를 연결
-- 총 누계 거리 기준으로 내림차순 정렬
SELECT ROUTE, CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') AS TOTAL_DISTANCE, CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY SUM(D_BETWEEN_DIST) DESC;