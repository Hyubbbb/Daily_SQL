-- 취소되지 않은 진료예약 조회하기
SELECT 
    ap.apnt_no, 
    p.pt_name, 
    ap.pt_no, 
    ap.mcdp_cd, 
    d.dr_name, 
    ap.apnt_ymd
FROM appointment AS ap
    INNER JOIN doctor AS d 
        oN d.dr_id = ap.mddr_id
    INNER JOIN patient AS p 
        ON p.pt_no = ap.pt_no
WHERE 1=1
    AND ap.apnt_cncl_ymd IS NULL 
    AND ap.mcdp_cd = 'CS' 
    AND ap.apnt_ymd >= '2022-04-13'
    AND ap.apnt_ymd < '2022-04-14'
ORDER BY ap.apnt_ymd
