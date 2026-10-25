-- SELECT > 특정 물고기를 잡은 총 수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/298518

SELECT COUNT(*) AS fish_count
FROM fish_info AS f
    INNER JOIN fish_name_info AS n
        ON f.fish_type = n.fish_type
WHERE 1=1
    AND n.fish_name IN ('BASS', 'SNAPPER')
