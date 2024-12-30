-- 진료과별 총 예약 횟수 출력하기
SELECT mcdp_cd as `진료과 코드`, count(apnt_no) as `5월예약건수`
FROM appointment
WHERE year(apnt_ymd)=2022 and month(apnt_ymd)=5
group by mcdp_cd
order by `5월예약건수` asc, `진료과 코드` asc