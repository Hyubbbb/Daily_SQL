-- 특정 물고기를 잡은 총 수 구하기
SELECT count(id) as fish_count
FROM fish_info a join fish_name_info b on a.fish_type=b.fish_type
WHERE fish_name="BASS" or fish_name="SNAPPER"