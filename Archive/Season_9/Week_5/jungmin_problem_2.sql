-- programmers (GROUP BY) : 물고기 종류 별 잡은 수 구하기 (LEVEL 2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/293257
SELECT
    COUNT(*) AS fish_count,
    fn.fish_name
FROM fish_info AS fi
    LEFT JOIN fish_name_info AS fn
        ON fi.fish_type = fn.fish_type
GROUP BY fn.fish_name
ORDER BY fish_count DESC;
