-- 물고기 종류 별 잡은 수 구하기
SELECT count(id) as fish_count, fish_name
FROM fish_info a join fish_name_info b on a.fish_type=b.fish_type
group by fish_name
order by fish_count desc