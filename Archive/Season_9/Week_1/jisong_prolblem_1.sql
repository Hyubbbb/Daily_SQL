-- programmers (join) : https://school.programmers.co.kr/learn/courses/30/lessons/59043

SELECT
    I.ANIMAL_ID,
    I.NAME
FROM
    ANIMAL_INS AS I
JOIN
    ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE
    O.DATETIME < I.DATETIME
ORDER BY
    I.DATETIME;