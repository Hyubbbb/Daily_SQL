-- 잡은 물고기 평균 길이 구하기
SELECT round(avg(IFNULL((case when length<=10 then 10  else length end),10)),2) as average_length
FROM fish_info