-- 1세대 & 2세대 WITH절
WITH first_gen AS (
    SELECT
        id
    FROM ecoli_data
    WHERE 1=1
        AND parent_id IS NULL
), second_gen AS (
    SELECT
        e.id
    FROM ecoli_data AS e
        JOIN first_gen AS fg
            ON e.parent_id = fg.id
)

-- 3세대
SELECT
    e.id
FROM ecoli_data AS e
    JOIN second_gen AS sg
        ON e.parent_id = sg.id
ORDER BY
    e.ID ASC
