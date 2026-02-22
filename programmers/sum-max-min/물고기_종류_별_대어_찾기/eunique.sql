-- 코드를 작성해주세요

SELECT
    fi.id,
    fn.fish_name,
    fi.length
FROM fish_info AS fi
    JOIN fish_name_info AS fn
        ON fn.fish_type = fi.fish_type
    JOIN (
     SELECT
            fish_type,
            MAX(length) AS max_len
        FROM fish_info
        GROUP BY fish_type
    ) fm
        ON fm.fish_type = fi.fish_type
        AND fm.max_len = fi.length
ORDER BY fi.id;
