-- https://leetcode.com/problems/triangle-judgement/?envType=study-plan-v2&envId=top-sql-50
WITH TMP AS (
    SELECT
        x,
        y,
        z,
        CASE
        WHEN x >= y AND x >= z
        THEN x
        WHEN y >= x AND y >= z
        THEN y
        WHEN z >= x AND z >= y
        THEN z
        END AS max_len
    FROM Triangle
)
SELECT
    x,
    y,
    z,
    CASE
    WHEN x+y+z - max_len <= max_len
    THEN 'No'
    WHEN x+y+z - max_len > max_len
    THEN 'Yes'
    END AS triangle
FROM TMP


-- -- Sol2: GPT
-- SELECT
--   x,
--   y,
--   z,
--   CASE
--     WHEN x + y > z
--       AND x + z > y
--       AND y + z > x
--     THEN 'Yes'
--     ELSE 'No'
--   END AS triangle
-- FROM Triangle;
