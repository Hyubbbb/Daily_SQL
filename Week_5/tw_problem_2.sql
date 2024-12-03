# 쿼리를 작성하는 목표, 확인할 지표 : 중고 거래 게시물을 3건 이상 등록한 사용자의 사용자 ID, 닉네임, 전체주소, 전화번호를 조회
# 쿼리 계산 방법 : 전체 주소는 시, 도로명 주소, 상세 주소가 함께 출력 (CONCAT 사용)
# 전화번호의 경우 xxx-xxxx-xxxx 같은 형태로 하이픈 문자열(-)을 삽입하여 출력 (CONCAT 사용)
# WHERE문 3건 이상 필터링
# Join KEY : WRITER_ID - USER_ID 
# 데이터 특징

WITH A AS (SELECT WRITER_ID, COUNT(BOARD_ID) AS COUNT_ID
FROM USED_GOODS_BOARD
GROUP BY WRITER_ID)

SELECT
    USER_ID,
    NICKNAME,
    CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS '전체주소',
    CONCAT(LEFT(TLNO, 3), '-', SUBSTRING(TLNO, 4, 4), '-', RIGHT(TLNO, 4)) AS '전화번호'
FROM
    USED_GOODS_USER
WHERE USER_ID IN (
        SELECT WRITER_ID
        FROM A
        WHERE COUNT_ID >= 3)
ORDER BY
    USER_ID DESC
