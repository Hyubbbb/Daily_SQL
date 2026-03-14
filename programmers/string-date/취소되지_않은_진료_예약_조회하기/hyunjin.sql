-- 코드를 입력하세요
SELECT
   a.apnt_no,
   p.pt_name,
   a.pt_no,
   a.mcdp_cd,
   d.dr_name,
   a.apnt_ymd
FROM appointment AS a
  JOIN patient AS p
    ON p.pt_no = a.pt_no
  JOIN doctor AS d
    ON d.dr_id = a.mddr_id
WHERE 1=1
   AND a.mcdp_cd = 'CS'
   AND a.apnt_cncl_yn = 'N'
   AND a.apnt_ymd >= '2022-04-13'
   AND a.apnt_ymd < '2022-04-14'
ORDER BY a.apnt_ymd
