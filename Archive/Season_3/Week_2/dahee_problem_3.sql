-- Programmers > SELECT > Python 개발자 찾기
-- Python 스킬을 가진 개발자의 ID, 이메일, 이름, 성을 조회
-- 결과는 ID를 기준으로 오름차순 정렬
-- https://school.programmers.co.kr/learn/courses/30/lessons/276013

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPER_INFOS
WHERE 'Python' IN (SKILL_1,  SKILL_2, SKILL_3)
ORDER BY ID ASC;