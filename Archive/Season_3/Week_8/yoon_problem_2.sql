-- https://school.programmers.co.kr/learn/courses/30/lessons/59042
-- 없어진 기록 찾기

SELECT O.ANIMAL_ID, O.NAME
FROM ANIMAL_OUTS AS O
LEFT JOIN ANIMAL_INS AS I
ON O.ANIMAL_ID = I.ANIMAL_ID
WHERE I.DATETIME IS NULL
ORDER BY O.ANIMAL_ID;

-- https://school.programmers.co.kr/learn/courses/30/lessons/59043
-- 있었는데요 없었습니다

SELECT I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS AS I
JOIN ANIMAL_OUTS AS O
ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE O.DATETIME < I.DATETIME
ORDER BY I.DATETIME;

-- https://school.programmers.co.kr/learn/courses/30/lessons/133027
-- 주문량이 많은 아이스크림들 조회하기

SELECT J.FLAVOR
FROM JULY J
JOIN FIRST_HALF F
ON J.FLAVOR = F.FLAVOR
GROUP BY J.FLAVOR
ORDER BY sum(F.TOTAL_ORDER) + sum(J.TOTAL_ORDER) DESC
LIMIT 3;
-- 테이블 별로 각각 따로 sum을 한 다음 더해줘야 한다.

