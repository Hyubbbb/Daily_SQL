WITH fish_ranking AS (
    SELECT 
        id,
        fish_type,
        length,
        RANK() OVER (PARTITION BY fish_type ORDER BY LENGTH DESC) AS ranking
    FROM fish_info
)
SELECT
    fr.id,
    fn.fish_name,
    fr.length
FROM fish_ranking AS fr
    JOIN fish_name_info AS fn
        ON fr.fish_type = fn.fish_type
WHERE 1=1
    AND fr.ranking = 1
ORDER BY fr.id