-- programmers (SUM, MAX, MIN) : 물고기 종류 별 대어 찾기 (LEVEL 3)
WITH max_length AS(
    SELECT
        f1.fish_type,
        MAX(f1.length) AS max_length
    FROM fish_info AS f1
        JOIN fish_name_info AS f2
            ON f1.fish_type = f2.fish_type
    GROUP BY f2.fish_type
)

SELECT
    f1.id,
    f2.fish_name,
    f1.length
FROM fish_info AS f1
    JOIN fish_name_info AS f2
        ON f1.fish_type = f2.fish_type
    JOIN max_length AS m
        ON f1.fish_type = m.fish_type
WHERE f1.length = m.max_length
ORDER BY f1.id ASC;
