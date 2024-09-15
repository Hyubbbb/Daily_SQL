-- https://school.programmers.co.kr/learn/courses/30/lessons/276013
-- Use IN

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPER_INFOS
WHERE "Python" IN (SKILL_1, SKILL_2, SKILL_3)
ORDER BY ID ASC;

-- WHERE CONCAT(SKILL_1, " ", SKILL_2, " ", SKILL_3) LIKE "%Python%"
-- WHERE SKILL_1 = "Python" OR SKILL_2 = "Python" OR SKILL_3 = "Python"