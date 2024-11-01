--잔챙이 잡은 수 구하기
SELECT count(id) as fish_count
FROM fish_info
WHERE length IS NULL