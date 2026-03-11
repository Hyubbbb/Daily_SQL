# 취소되지_않은_진료_예약_조회하기
SELECT     
    a.apnt_no,
    p.pt_name, p.pt_no,
    d.mcdp_cd, d.dr_name,
    a.apnt_ymd
FROM appointment AS a
    LEFT JOIN patient AS p 
        ON a.pt_no = p.pt_no
    LEFT JOIN doctor AS d
        ON a.mddr_id = d.dr_id
WHERE 1=1
    AND DATE(a.apnt_ymd) = '2022-04-13'
    AND a.mcdp_cd = 'CS'
    AND a.apnt_cncl_yn = 'N'
ORDER BY a.apnt_ymd;
