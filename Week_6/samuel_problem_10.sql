-- https://school.programmers.co.kr/learn/courses/30/lessons/164668


SELECT 
    UGU.USER_ID AS `회원 ID`,
    UGU.NICKNAME AS `닉네임`,
    SUM(UGB.PRICE) AS `총거래금액`
FROM USED_GOODS_BOARD UGB
INNER JOIN USED_GOODS_USER UGU ON UGB.WRITER_ID = UGU.USER_ID
WHERE UGB.STATUS = 'DONE'
GROUP BY UGU.USER_ID, UGU.NICKNAME
HAVING SUM(UGB.PRICE) >= 700000
ORDER BY SUM(UGB.PRICE) ASC;