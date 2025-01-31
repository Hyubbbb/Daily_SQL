-- 대장균들의 자식의 수 구하기
SELECT A.ID, count(B.ID) as CHILD_COUNT
FROM ECOLI_DATA as A left outer join ECOLI_DATA as B on A.ID=B.parent_ID
GROUP BY A.ID
ORDER BY A.ID
