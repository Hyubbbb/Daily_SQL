-- 물고기 종류별 대어 찾기
WITH ranked AS (
    SELECT
        fi.id,
        fni.fish_name,
        fi.length,
        ROW_NUMBER() OVER (
            PARTITION BY fi.fish_type
            ORDER BY fi.length DESC
        ) AS rn
    FROM fish_info fi
        JOIN fish_name_info fni
            ON fi.fish_type = fni.fish_type
)

SELECT
    id,
    fish_name,
    length
FROM ranked
WHERE 1=1
    AND rn = 1
ORDER BY id;
