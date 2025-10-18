-- https://school.programmers.co.kr/learn/courses/30/lessons/132204
SELECT 
    a.apnt_no,
    p.pt_name,
    a.pt_no,
    a.mcdp_cd,
    d.dr_name,
    a.apnt_ymd
FROM appointment AS a
    INNER JOIN patient AS p
        ON a.pt_no = p.pt_no
    INNER JOIN doctor AS d
        ON a.mddr_id = d.dr_id
WHERE 1=1
    AND DATE(a.apnt_ymd) = '2022-04-13'
    AND a.mcdp_cd = 'CS'
    AND IFNULL(a.apnt_cncl_yn, 'N') = 'N'
ORDER BY a.apnt_ymd ASC;