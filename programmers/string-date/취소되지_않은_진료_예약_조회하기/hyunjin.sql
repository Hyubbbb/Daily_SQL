-- 코드를 입력하세요
SELECT
   ap.apnt_no,
   p.pt_name,
   ap.pt_no,
   ap.mcdp_cd,
   d.dr_name,
   ap.apnt_ymd
FROM appointment AS ap
  JOIN patient AS p
    ON p.pt_no = ap.pt_no
  JOIN doctor AS d
    ON d.dr_id = ap.mddr_id
WHERE 1=1
   AND ap.mcdp_cd = 'CS'
   AND ap.apnt_cncl_yn = 'N'
   AND ap.apnt_ymd >= '2022-04-13'
   AND ap.apnt_ymd < '2022-04-14'
ORDER BY ap.apnt_ymd
