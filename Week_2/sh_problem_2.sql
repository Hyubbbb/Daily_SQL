-- 잡은 물고기 중 가장 큰 물고기의 길이 구하기

SELECT concat(max(length),"cm") as max_length
FROM fish_info