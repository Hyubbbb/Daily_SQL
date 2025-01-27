/* leetcode 626. Exchange Seats
https://leetcode.com/problems/exchange-seats/description/?envType=study-plan-v2&envId=top-sql-50 */


-- Write your PostgreSQL query statement below

-- WITH CTE AS (
--     SELECT *,
--     CASE
--         WHEN id % 2 = 1 THEN id + 1
--         ELSE id - 1
--     END AS id_mod
--     FROM Seat
-- )

-- -- SELECT *, LAST_VALUE(s.student) OVER(),
-- --     COALESCE(c.id, LAST_VALUE(s.id) OVER())
-- SELECT COALESCE(c.id, LAST_VALUE(s.id) OVER()) as id,
--     s.student
-- FROM Seat as s
-- LEFT JOIN CTE as c
--     ON s.id = c.id_mod 
-- ORDER BY id

SELECT
    CASE
        WHEN id = (SELECT MAX(id) FROM Seat) AND id % 2 = 1 THEN id
        WHEN id % 2 = 1 THEN id + 1
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id
