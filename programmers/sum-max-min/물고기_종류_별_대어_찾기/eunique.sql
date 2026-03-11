-- 코드를 작성해주세요

WITH fish_max AS (
    SELECT
        fish_type,
        MAX(length) AS max_len
    FROM fish_info
    GROUP BY fish_type
)
SELECT
    fi.id,
    fn.fish_name,
    fi.length
FROM fish_info AS fi
    JOIN fish_name_info AS fn
        ON fn.fish_type = fi.fish_type
    JOIN fish_max AS fm
        ON fm.fish_type = fi.fish_type
   AND fm.max_len = fi.length
ORDER BY fi.id;
