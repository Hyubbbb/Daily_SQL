WITH ranked_fish AS (
    SELECT
        id,
        fish_type,
        length,
        ROW_NUMBER() OVER (
            PARTITION BY fish_type
            ORDER BY length DESC
        ) AS rnk
    FROM fish_info
)
SELECT
    rf.id,
    fni.fish_name,
    rf.length
FROM ranked_fish AS rf
    JOIN fish_name_info AS fni
        ON rf.fish_type = fni.fish_type
WHERE 1=1
  AND rf.rnk = 1
ORDER BY id;
