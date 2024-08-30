-- # Table 1: USED_GOODS_BOARD
-- # Table 2: USED_GOODS_USER

-- # 중고 거래 게시물을 3건 이상 등록한 사용자의 사용자 ID, 닉네임, 전체주소, 전화번호를 조회
--     # 전체 주소는 시, 도로명 주소, 상세 주소가 함께 출력되도록
--     # 전화번호의 경우 xxx-xxxx-xxxx 같은 형태로 하이픈 문자열(-)을 삽입하여 출력해
--     # 결과는 회원 ID를 기준으로 내림차순 정렬

SELECT u.USER_ID, 
       NICKNAME, 
       CONCAT(CITY, " ",STREET_ADDRESS1, " ",STREET_ADDRESS2) AS 전체주소,
       CONCAT(SUBSTRING(TLNO, 1, 3), '-',
             SUBSTRING(TLNO, 4, 4), '-',
             SUBSTRING(TLNO, 8, 4)) AS 전화번호
FROM USED_GOODS_BOARD b
    JOIN USED_GOODS_USER u on b.WRITER_ID = u.USER_ID
GROUP BY u.USER_ID
    HAVING COUNT(*) >= 3
ORDER BY USER_ID DESC
