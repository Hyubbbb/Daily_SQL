-- 12세 이하인 여자 환자 목록 출력하기 (윤다빈)
SELECT
  pt_name,
  pt_no,
  gend_cd,
  age,
  COALESCE(tlno, 'NONE') AS tlno
FROM patient
WHERE 1=1
  AND age <= 12
  AND gend_cd = 'W'
ORDER BY
  age DESC,
  pt_name ASC;
