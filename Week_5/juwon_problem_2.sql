-- 인기있는 아이스크림
-- https://school.programmers.co.kr/learn/courses/30/lessons/133024

SELECT FLAVOR
FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC;
