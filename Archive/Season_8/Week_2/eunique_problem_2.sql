https://school.programmers.co.kr/learn/courses/30/lessons/133024 
SELECT
  FLAVOR,
  TOTAL_ORDER,
  SHIPMENT_ID
FROM FIRST_HALF
ORDER BY
  TOTAL_ORDER DESC,   -- 총주문량 내림차순
  SHIPMENT_ID ASC;    -- 동률 시 출하 번호 오름차순
