-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/164670
-- 사용자 테이블과 게시물 테이블을 조인하여 게시물 3건 이상 등록한 사용자만 필터링
-- 조인 결과에서 주소는 CONCAT으로 결합하고, 전화번호는 SUBSTRING과 CONCAT으로 형식화하여 USER_ID 내림차순 정렬

SELECT u.USER_ID, u.NICKNAME, 
    CONCAT(u.CITY, ' ', u.STREET_ADDRESS1, ' ', IFNULL(u.STREET_ADDRESS2, '')) AS 전체주소,
    CONCAT(
        SUBSTRING(u.TLNO, 1, 3), '-',
        SUBSTRING(u.TLNO, 4, 4), '-',
        SUBSTRING(u.TLNO, 8, 4)
    ) AS 전화번호
FROM USED_GOODS_USER u
JOIN (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD
    GROUP BY WRITER_ID
    HAVING COUNT(*) >= 3
) b ON u.USER_ID = b.WRITER_ID
ORDER BY u.USER_ID DESC;