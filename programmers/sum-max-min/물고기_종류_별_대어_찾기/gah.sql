WITH fish_rank AS (
    SELECT
        id,
        fish_type,
        length,
    ROW_NUMBER() OVER (
        PARTITION BY fish_type
        ORDER BY length DESC
    ) AS rn
    FROM fish_info
    WHERE 1=1
        AND length IS NOT NULL
)

SELECT
    fr.id,
    fni.fish_name,
    fr.length
FROM fish_rank AS fr
    JOIN fish_name_info AS fni
        ON fr.fish_type = fni.fish_type
WHERE 1=1
    AND fr.rn = 1
ORDER BY fr.id;
