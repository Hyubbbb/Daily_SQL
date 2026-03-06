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
    AND a.apnt_ymd >= '2022-04-13' 
    AND a.apnt_ymd <  '2022-04-14' -- 해당 컬럼이 타임스탬프일 때에는 BETWEEN보다는 이런 식으로 조건을 거는 게 명확하다고 함
    AND a.apnt_cncl_yn = 'N'
    AND a.mcdp_cd = 'CS' -- 흉부외과
ORDER BY a.apnt_ymd