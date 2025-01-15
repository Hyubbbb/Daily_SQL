-- 7등급 이하 -> Null처리
-- JOIN ON 조건에서 (=)연산자만 쓰는게 너무 익숙해지다 보니 다른 연산자(아래의 경우 BETWEEN)를 써도 되는걸 바로 떠올리지 못함

SELECT IF(Grade>=8, Name, NULL) AS "Name1", Grade, Marks
FROM Students s JOIN Grades g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY Grade Desc, Name1, Marks
