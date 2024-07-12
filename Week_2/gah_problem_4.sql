-- [PROGRAMMERS] String, Date > 조건에 맞는 사용자 정보 공유하기

SELECT u.USER_ID, u.NICKNAME,
       CONCAT(u.CITY, " ", u.STREET_ADDRESS1, " ", u.STREET_ADDRESS2) '전체주소',
       CONCAT(SUBSTR(u.TLNO, 1, 3), "-", SUBSTR(u.TLNO, 4, 4), "-", SUBSTR(u.TLNO, 8, 4)) "전화번호"
FROM USED_GOODS_USER u, (SELECT WRITER_ID
                         FROM USED_GOODS_BOARD b
                         GROUP BY WRITER_ID
                         HAVING COUNT(BOARD_ID) >= 3) t
WHERE u.USER_ID = t.WRITER_ID
ORDER BY 1 DESC;
