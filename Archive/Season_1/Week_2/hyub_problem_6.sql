-- # DEVELOPERS 테이블에서 Python이나 C# 스킬을 가진 개발자의 정보를 조회
--     # 조건에 맞는 개발자의 ID, 이메일, 이름, 성을 조회
--     # 결과는 ID를 기준으로 오름차순 정렬

-- # Soultion 1: 실패 (SKILLCODES 테이블이 테케에서 바뀐대)


-- # Soultion 2: 성공 But 지저분한 느낌
# SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
# FROM DEVELOPERS d
# WHERE SKILL_CODE & 
#     (SELECT CODE
#     FROM SKILLCODES 
#     WHERE NAME = 'Python')
    
#     OR
    
#     SKILL_CODE & 
#     (SELECT CODE
#     FROM SKILLCODES 
#     WHERE NAME = 'C#')

# ORDER BY ID

-- # Soultion 3: GPT (내가 DISTINCT만 추가했더니 성공)
SELECT DISTINCT(ID), EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS d
JOIN SKILLCODES sc ON d.SKILL_CODE & sc.CODE > 0
WHERE sc.NAME IN ('Python', 'C#')
ORDER BY d.ID
