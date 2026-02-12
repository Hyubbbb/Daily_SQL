WITH fe_skillcodes AS (
    SELECT *
    FROM skillcodes
    WHERE 1=1 
        AND category = 'Front End'
)
SELECT DISTINCT -- DISTINCT 사용: 2개 이상의 FE 스킬을 갖는 경우, 동일 id의 개발자가 2개 이상 등장하기 때문
    d.id,
    d.email,
    d.first_name,
    d.last_name
FROM developers AS d
    JOIN fe_skillcodes AS s
        ON d.skill_code & s.code -- Front End 스킬이 없다면, 'd.skill_code & s.code = 0'이므로 필터링 될 것임
ORDER BY d.id