SELECT
    a.apnt_no,
    p.pt_name,
    p.pt_no,
    d.mcdp_cd,
    d.dr_name,
    a.apnt_ymd
FROM patient AS p
    JOIN appointment AS a
        ON p.pt_no = a.pt_no
    JOIN doctor AS d
        ON a.mddr_id = d.dr_id
WHERE 1=1
    AND DATE(a.apnt_ymd) = '2022-04-13'
    AND a.apnt_cncl_yn = 'N'
    AND d.mcdp_cd = 'CS'
ORDER BY a.apnt_ymd
