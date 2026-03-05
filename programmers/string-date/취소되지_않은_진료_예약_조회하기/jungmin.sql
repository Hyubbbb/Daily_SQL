SELECT
    a.apnt_no,
    p.pt_name,
    a.pt_no,
    a.mcdp_cd,
    d.dr_name,
    a.apnt_ymd
FROM appointment AS a
    LEFT JOIN patient AS p
        ON a.pt_no = p.pt_no
    LEFT JOIN doctor AS d
        ON a.mddr_id = d.dr_id
WHERE 1=1
    AND a.apnt_YMD BETWEEN '2022-04-13' AND '2022-04-14'
    AND a.apnt_cncl_yn = 'N'
    AND a.mcdp_cd = 'CS'
ORDER BY a.apnt_ymd;
