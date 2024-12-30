-- Programmers > SELECT > 인기있는 아이스크림
-- 상반기에 판매된 아이스크림의 맛을 총주문량을 기준으로 내림차순 정렬하고 총주문량이 같다면 출하 번호를 기준으로 오름차순 정렬하여 조회
-- https://school.programmers.co.kr/learn/courses/30/lessons/133024

SELECT FLAVOR
FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC
, SHIPMENT_ID ASC;