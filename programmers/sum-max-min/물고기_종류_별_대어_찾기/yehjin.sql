WITH rank_length AS(
    SELECT
        id,
        fish_type,
        length,
        ROW_NUMBER() OVER (PARTITION BY fish_type ORDER BY length DESC) AS rn
    FROM fish_info)
    
SELECT
    rl.id,
    fni.fish_name,
    rl.length
FROM rank_length AS rl
    JOIN fish_name_info AS fni
        ON rl.fish_type = fni.fish_type
WHERE 1=1
    AND rl.rn=1
ORDER BY rl.id;