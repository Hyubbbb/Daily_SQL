 -- &: 비트 AND 연산자
 -- 두 숫자를 2진수로 바꿔서 같은 자리끼리 비교한 다음
 -- 둘 다 1이면 → 1
 -- 하나라도 0이면 → 0

SELECT
    DISTINCT d.id,
    d.email,
    d.first_name,
    d.last_name
FROM skillcodes AS s
    JOIN developers AS d
        ON (d.skill_code & s.code) > 0
WHERE 1=1
    AND s.category = 'Front End'
ORDER BY d.id
