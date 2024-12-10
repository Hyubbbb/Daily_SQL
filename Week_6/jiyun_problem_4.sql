-- 와일드카드 문자의 역할
-- 특정 문자를 알 수 없거나, 가변적인 패턴을 가진 데이터를 찾을 때 사용

-- `ESCAPE`는 SQL에서 와일드카드 문자(%, _)를 특정 문자로 취급하고자 할 때 사용하는 함수

SELECT DISTINCT page_location
FROM ga
WHERE page_location NOT LIKE '%\_%' ESCAPE '\'
ORDER BY page_location
