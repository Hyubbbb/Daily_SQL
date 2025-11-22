-- programmers (SELECT) : 특정 물고기를 잡은 총 수 구하기 (LEVEL 2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/298518
SELECT COUNT(*) AS fish_count
FROM fish_info AS f1
    JOIN fish_name_info AS f2
        ON f1.fish_type = f2.fish_type
WHERE 1=1
    AND f2.fish_name IN ('bass', 'snapper')
