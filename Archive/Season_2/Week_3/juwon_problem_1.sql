-- 노선별로 평균 역 사이 거리와 총 누계 거리를 조회하는 SQL
-- https://school.programmers.co.kr/learn/courses/30/lessons/284531 

SELECT 
    ROUTE,  -- 노선명을 선택
    ROUND(SUM(D_BETWEEN_DIST), 2) || 'km' AS TOTAL_DISTANCE,  -- 노선별 총 누계 거리 (소수 둘째 자리 반올림)
    ROUND(AVG(D_BETWEEN_DIST), 3) || 'km' AS AVERAGE_DISTANCE  -- 노선별 평균 역 사이 거리 (소수 셋째 자리 반올림)
FROM 
    SUBWAY_DISTANCE  -- 서울지하철 2호선 역 간 거리 정보가 담긴 테이블
GROUP BY 
    ROUTE  -- 노선별로 그룹화
ORDER BY 
    SUM(D_BETWEEN_DIST) DESC;  -- 총 누계 거리를 기준으로 내림차순 정렬
