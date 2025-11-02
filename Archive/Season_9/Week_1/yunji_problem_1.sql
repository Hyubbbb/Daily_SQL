# 프로그래머스 > GROUP BY > 노선별 평균 역 사이 거리 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/284531

SELECT ROUTE, 
        CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') AS TOTAL_DISTANCE, 
        CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY SUM(D_BETWEEN_DIST) DESC;
