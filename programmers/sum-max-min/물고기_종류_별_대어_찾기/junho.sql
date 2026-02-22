WITH fish_ranked AS (
    SELECT
        fi.id,
        fni.fish_name,
        fi.length,
        ROW_NUMBER() OVER (
            PARTITION BY fi.fish_type
            ORDER BY fi.length DESC, fi.id ASC
        ) AS ranking
    FROM fish_info fi
    JOIN fish_name_info fni
        ON fi.fish_type = fni.fish_type
)

SELECT id, fish_name, length
FROM fish_ranked
WHERE 1=1
  AND ranking = 1
ORDER BY id
