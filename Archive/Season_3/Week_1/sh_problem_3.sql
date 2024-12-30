-- 월별 잡은 물고기 수 구하기
SELECT count(id) as fish_count, month
FROM (select month(time) as month, id
     from fish_info) as fish
group by month
order by month asc