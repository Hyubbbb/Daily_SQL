-- 조건에 맞는 개발자 찾기
SELECT distinct id, email, first_name, last_name
FROM developers, 
(select name, code
from skillcodes
where name="Python" or name="C#") as t
WHERE t.code&skill_code=t.code
order by id asc