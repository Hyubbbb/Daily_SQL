# Programmers > SELECT > 12세 이하인 여자 환자 목록 출력하기 
# SELECT Lv.1 연습
SELECT
    p.pt_name,
    p.pt_no,
    p.gend_cd,
    p.age,
    IFNULL(p.tlno, 'NONE') AS tlno
    # COALESCE(p.tlno, 'NONE') AS tlno 
FROM
    patient AS p
WHERE 1=1
    AND p.age <= 12
    AND p.gend_cd = 'W'
ORDER BY p.age DESC, p.pt_name ASC;
