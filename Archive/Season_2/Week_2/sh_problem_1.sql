-- 한 해에 잡은 물고기 수 구하기

SELECT count(ID) as fish_count
FROM fish_info
WHERE year(time)="2021"