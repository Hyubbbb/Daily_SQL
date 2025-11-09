# 프로그래머스 > String, Date > 조건별로 분류하여 주문상태 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131113

SELECT t.order_id, t.product_id, DATE_FORMAT(t.out_date, '%Y-%m-%d'),
    CASE
        WHEN t.out_date IS NULL THEN '출고미정'
        WHEN DATE('2022-05-01') >= t.out_date THEN '출고완료'
        WHEN DATE('2022-05-01') < t.out_date THEN '출고대기'   
    END AS 출고여부
FROM food_order AS t
ORDER BY order_id;
