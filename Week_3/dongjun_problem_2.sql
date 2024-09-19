-- LEVEL2 : 조건에 부합하는 중고거래 상태 조회하기
SELECT BOARD_ID,
    WRITER_ID,
    TITLE,
    PRICE,
    CASE
        WHEN STATUS = 'SALE' THEN '판매중'
        WHEN STATUS = 'RESERVED' THEN '예약중'
        ELSE '거래완료'
    END AS STATUS
FROM USED_GOODS_BOARD
WHERE CREATED_DATE = '2022-10-05'
ORDER BY BOARD_ID DESC;

/* 
CASE  ... WHEN .. THEN 절 기억하기
AS 빼먹지 않기
DESC : 내림차순
 */
